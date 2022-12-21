import 'package:dio/dio.dart';

// void main() async {
//   // print((new GetToken()).getToken());
//   print(await new GetToken().getToken());
// }

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
      return "Bearer " + response.data["data"]["token"];
    } else {
      return "Failed";
    }
  }
}
