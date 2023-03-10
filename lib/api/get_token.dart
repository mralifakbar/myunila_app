import 'package:dio/dio.dart';

class GetToken {
  Future<String> getToken() async {
    var dio = Dio();
    Response response;

    response = await dio.post(
      "http://onedata.unila.ac.id/api/live/0.1/auth/login",
      data: {
        "id_aplikasi": "948df317-78f7-4b92-a53f-0a56215e07de",
        "username": "mhs-testing",
        "password": "unilajaya"
      },
    );

    if (response.statusCode == 200) {
      return response.data["data"]["token_bearer"];
    } else {
      return "Failed";
    }
  }
}
