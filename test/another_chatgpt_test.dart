import 'package:another_chatgpt/app_keys.dart';
import 'package:another_chatgpt/completions/completions_dto.dart';
import 'package:another_chatgpt/models/models_dto.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:another_chatgpt/another_chatgpt.dart';

void main() {
  test('adds one to input values', () async {

    ChatGptClient client = ChatGptClient(organizationId: AppKeys.orgId, apiKey: AppKeys.apiKey);

    List<GptModelDto> models = await client.getModels();

    print("Models: $models");
    //GptCompletionRequest request = GptCompletionRequest(model: model, prompt: prompt);
    //_client.createChatCompletion(request: request)
    /*
    final calculator = Calculator();
    expect(calculator.addOne(2), 3);
    expect(calculator.addOne(-7), -6);
    expect(calculator.addOne(0), 1);

     */
  });
}
