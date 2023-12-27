
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('adds one to input values', () async {

    //GptClient client = GptClient(organizationId: AppKeys.orgId, apiKey: AppKeys.apiKey);

    /*
    GptAssistant assistant = await client.retrieveAssistant(assistantId: "asst_VbIB8QeWk7JFsWfkHQKKZu1W");
    print("Assistant: $assistant");

    GptRun assistantRun = await client.createThreadAndRun(request:
    CreateAndRunThreadRequest(assistantId: assistant.id, thread: GptRunThread(
      messages: [ GptThreadMessage(role: GptThreadRole.user, content: "What is flying?")]
    )));

    print("Print Run: $assistantRun");

    assistantRun = await client.retrieveRun(threadId: "thread_nrdXhyJrAoKjittBP9m5zls7", runId: "run_UtFRfQ96MJw37SETth1TfUZl");
    print("Print Run: $assistantRun");

    List<GptAssistantMessage> messages = await client.listMessages(threadId: "thread_nrdXhyJrAoKjittBP9m5zls7", request: GetGptListRequest());

    print("Messages: $messages");

     */

    /*
    ImageCreateRequest request = ImageCreateRequest(prompt: "I want a wizard like the one in Final Fantasy 1 in pixelated style.");
    List<GptImage> images = await client.createImage(request: request);
    */
    //GptChatCompletionRequest chatCompletionRequest = GptChatCompletionRequest(model: "gpt-3.5-turbo-16k", messages: messages);
    //GptCompletion completionResponse = await client.createChatCompletion(request: chatCompletionRequest);

    //print(completionResponse);
    //GptCompletionRequest request = GptCompletionRequest(model: model, prompt: prompt);
    //_client.createChatCompletion(request: request)

    /*
    ImageCreateRequest request = ImageCreateRequest(
        prompt: '''A sunlit indoor lounge area with a pool containing a flamingo''',
        n: 1,
        responseFormat: ResponseFormat.b64Json,
        model: "dall-e-3",
      size: ImageSize.size1024x1024
    );
    List<GptImage> images = await client.createImage(request: request);
     */
    //File("testImage2.png").writeAsBytes(await images.first.getImageBytes());

    /*
    ImageEditRequest request = ImageEditRequest(
        imageBytes: File("image_edit_original.png").readAsBytesSync(),
        imageMaskBytes: File("image_edit_mask.png").readAsBytesSync(),
        prompt: "A sunlit indoor lounge area with a pool containing a flamingo",
        n: 1,
      size: ImageSize.size1024x1024
    );
    List<GptImage> images = await client.createImageEdit(request: request);
    print(images);


    ImageVariationRequest request = ImageVariationRequest(
        imageBytes: File("image_edit_original.png").readAsBytesSync(),
        n: 1,
        size: ImageSize.size1024x1024
    );
    List<GptImage> images = await client.createImageVariation(request: request);
    print(images);

     */

    /*
    AssistantConversation conversation = AssistantConversation(client: client, assistantId: "asst_VbIB8QeWk7JFsWfkHQKKZu1W");

    List<GptAssistantMessage> responses = await conversation.postMessage(content: "What does the lifelink ability do?");
    print("Responses: $responses");

    responses = await conversation.postMessage(content: "What happens when a creature with lifelink blocks?");
    print("Responses 2: $responses");
     */

    //await client.modifyAssistant(assistantId: "asst_VbIB8QeWk7JFsWfkHQKKZu1W" , request: ModifyGptAssistantRequest(model: "gpt-3.5-turbo-instruct"));

    /*
    var completer = Completer();
    conversation.getProgress().listen((progress) {
      print("Status: ${progress.status}");
      if(progress.status == GptRunStatus.completed || progress.status == GptRunStatus.cancelled || progress.status == GptRunStatus.expired) {
        print(progress.messages);
        completer.complete();
      }

    });

    conversation.postMessage(content: "What does the lifelink ability do?");
    await Future.delayed(Duration(seconds: 5));
    conversation.cancelLastMessage();

    await completer.future;

     */

    /*
    GptFile uploadedFile = await client.uploadFile(request: CreateFileRequest(purpose:  GptFilePurpose.fineTune, fileName: "mtg_rules_data_set.jsonl"), fileBytes: File("magic_rules_data_set.jsonl").readAsBytesSync());
    print ("Uploaded File: $uploadedFile");

    //await client.deleteFile(fileId: "file-bcREJ7ju0GSpdDaL9UZNH7QG");

     */
  });
}
