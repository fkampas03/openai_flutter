import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:try_two/models/model.dart';

class ImageController extends GetxController {
  var url = Uri.parse('https://api.openai.com/v1/images/generations');
  // ignore: non_constant_identifier_names
  var api_token = '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';

  Rx<List<String>> image = Rx<List<String>>([]);
  final data = ''.obs;

  final isLoading = false.obs;

  Future getImage({required String imageText}) async {
    try {
      isLoading.value = true;
      var request = await http.post(
        url,
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $api_token',
        },
        body: jsonEncode(
          {
            'prompt': imageText,
          },
        ),
      );
      if (request.statusCode == 200) {
        isLoading.value = false;
        data.value = jsonDecode(request.body)['data'][0]['url'];
        print(data.value);
        image.value.add(data.value);
        //image.value.add(ImageModel.fromJson((jsonDecode(request.body))));
        print(jsonDecode(request.body));
        print("loooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooool${image.value.length}");
      } else {
        isLoading.value = false;

        print(jsonDecode(request.body));
        print("loooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooool${image.value.length}");
      }
    } catch (e) {
      isLoading.value = false;

      print(e.toString());
      print("loooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooool${image.value.length}");
    }
  }
}