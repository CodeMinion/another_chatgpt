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

  AssistantConversation(
      {required this.client,
      required this.assistantId,
      this.statusCheckPeriod = const Duration(seconds: 2)});

  // TODO Create a stream to publish run status changes.


  Future<List<GptAssistantMessage>> postMessage(
      {required String content, List<String> fileIds = const []}) async {

    if(runId != null) {
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
      GptAssistantMessage threadMessage = await client.createMessage(
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
      await Future.delayed(statusCheckPeriod);
      run = await client.retrieveRun(threadId: threadId!, runId: runId!);
    } while (run.status != GptRunStatus.completed);

    List<GptAssistantMessage> messages = await client.listMessages(
        threadId: threadId!, request: GetGptListRequest());

    runId = null;
    return messages;
  }

  bool isBusy() {
    return runId != null;
  }
}
