import 'dart:async';

import 'package:another_chatgpt/another_chatgpt.dart';
import 'package:another_chatgpt/assistants/assistant_messages_dto.dart';
import 'package:another_chatgpt/assistants/assistant_threads_dto.dart';
import 'package:another_chatgpt/assistants/runs_dto.dart';
import 'package:another_chatgpt/common/common_dto.dart';

/// Helper for managing a single conversation with an assistant.
class AssistantConversation {
  GptClient client;
  String assistantId;
  Duration statusCheckPeriod;
  String? threadId;
  String? runId;
  List<GptAssistantMessage>? _messageHistory;

  final StreamController<AssistantConversationProgress>
      _conversationProgressStream = StreamController.broadcast();

  AssistantConversation(
      {required this.client,
      required this.assistantId,
      this.statusCheckPeriod = const Duration(seconds: 2)});

  /// Notifies the progress of the conversation.
  Stream<AssistantConversationProgress> getProgress() => _conversationProgressStream.stream;

  ///
  /// Sends a message to the assistant. This will take care of creating the
  /// conversation thread as well as the run for each of the messages sent.
  /// It will also handle the periodic checks on the progress of the assistant
  /// and return when the assistant has completed.
  /// When done it returns all the messages in the assistant conversation.
  ///
  Future<List<GptAssistantMessage>> postMessage(
      {required String content, List<String> fileIds = const []}) async {
    if (runId != null) {
      throw Exception("Assistant busy.");
    }

    // If there is no thread active thread create it.
    if (threadId == null) {
      GptThread currentThread = await client.createThread(
        request: CreateGptThreadRequest(
          messages: [
            GptThreadMessage(role: GptThreadRole.user, content: content)
          ],
        ),
      );
      threadId = currentThread.id;
    } else {
      // Add message to thread
      await client.createMessage(
        threadId: threadId!,
        request: CreateGptMessageRequest(
            fileIds: fileIds, content: content, role: GptThreadRole.user),
      );
    }

    GptRun run = await client.createRun(
      threadId: threadId!,
      request: CreateGptRunRequest(
        assistantId: assistantId,
      ),
    );
    runId ??= run.id;

    do {
      _conversationProgressStream.add(AssistantConversationProgress(
          assistantId: assistantId, status: run.status, messages: _messageHistory));
      await Future.delayed(statusCheckPeriod);
      run = await client.retrieveRun(threadId: threadId!, runId: runId!);
    } while (_isRunFinished(run: run));


    List<GptAssistantMessage> messages = await client.listMessages(
        threadId: threadId!, request: GetGptListRequest());

    _messageHistory = messages;

    _conversationProgressStream.add(AssistantConversationProgress(
        assistantId: assistantId, status: run.status, messages: _messageHistory));

    runId = null;
    return messages;
  }

  bool _isRunFinished({required GptRun run}) {
    return run.status != GptRunStatus.completed && run.status != GptRunStatus.cancelled && run.status != GptRunStatus.expired;
  }


  /// Request a cancel for the last conversation message submitted.
  /// Returns true if the cancel was requested, false otherwise.
  /// A cancel will not be sent if there is no active run.
  Future<bool> cancelLastMessage() async {
    if (runId == null) {
      return false;
    }
    await client.cancelRun(threadId: threadId!, runId: runId!);
    return true;
  }



  bool isBusy() {
    return runId != null;
  }
}

class AssistantConversationProgress {
  final String assistantId;
  final GptRunStatus status;
  final List<GptAssistantMessage>? _messages;

  AssistantConversationProgress(
      {required this.assistantId,
      required this.status,
      List<GptAssistantMessage>? messages})
      : _messages = messages;

  List<GptAssistantMessage>? get messages => _messages;
}
