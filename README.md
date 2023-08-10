
## Another_ChatGpt
Flutter implementation for the OpenAI APIs

## Usage

The implementation is centered around the GptClient with all implemented APIs exposed through it.
```dart
GptClient client = GptClient(organizationId: AppKeys.orgId, apiKey: AppKeys.apiKey);
GptChatCompletionRequest chatCompletionRequest = GptChatCompletionRequest(model: "gpt-3.5-turbo-16k", messages: messages);
GptCompletion completionResponse = await client.createChatCompletion(request: chatCompletionRequest);

```

