
## Another_ChatGpt
Flutter implementation for the OpenAI APIs

## Usage

The implementation is centered around the GptClient with all implemented APIs exposed through it.
```dart
GptClient client = GptClient(organizationId: AppKeys.orgId, apiKey: AppKeys.apiKey);
GptChatCompletionRequest chatCompletionRequest = GptChatCompletionRequest(model: "gpt-3.5-turbo-16k", messages: messages);
GptCompletion completionResponse = await client.createChatCompletion(request: chatCompletionRequest);

```

## Additional information

TODO: Tell users more about the package: where to find more information, how to
contribute to the package, how to file issues, what response they can expect
from the package authors, and more.
