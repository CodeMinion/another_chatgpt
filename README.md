
## Another_ChatGpt
Flutter implementation for the OpenAI APIs

## Usage

The implementation is centered around the GptClient with all implemented APIs exposed through it.
```dart
GptClient client = GptClient(organizationId: AppKeys.orgId, apiKey: AppKeys.apiKey);
GptChatCompletionRequest chatCompletionRequest = GptChatCompletionRequest(model: "gpt-3.5-turbo-16k", messages: messages);
GptCompletion completionResponse = await client.createChatCompletion(request: chatCompletionRequest);

```

### Assistant Conversation
Helper for dealing with a conversation with a single AI assistant. 

```dart
AssistantConversation conversation = AssistantConversation(client: client, assistantId: "");

/// Listen for status updates.
conversation.getProgress().listen((progress) {
    print("Status: ${progress.status}");
    if(progress.status == GptRunStatus.completed || progress.status == GptRunStatus.cancelled || progress.status == GptRunStatus.expired) {
        print(progress.messages);
    }
}
});

/// Post a message to the assistant 
conversation.postMessage(content: "What does the lifelink ability do?");

```

