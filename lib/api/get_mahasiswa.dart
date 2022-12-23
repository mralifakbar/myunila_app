import 'package:dio/dio.dart';
import 'package:myunila_app/models/mahasiswa_model.dart';
import 'get_token.dart';

// void main() async {
//   print(await (new GetMahasiswa()
//       .getMahasiswaByProdi("6C0F8943-A9E9-4EDF-92A4-11B9A71104DF", 1)));
// }

class GetMahasiswa {
  Future<List<Mahasiswa>> getMahasiswaByProdi(String idProdi, int page) async {
    var dio = Dio();
    Response response;
    dio.options.headers["authorization"] = await GetToken().getToken();

    final mahasiswa = <Mahasiswa>[];

    for (int i = 1; i < 23; i++) {
      response = await dio.get(
          "http://onedata.unila.ac.id/api/live/0.1/mahasiswa/list_mahasiswa?page=$i&limit=50&sort_by=ASC&id_prodi=$idProdi");

      if (response.statusCode == 200) {
        final Map<String, dynamic> json = response.data;

        if (json["data"] != null) {
          json["data"].forEach((v) {
            mahasiswa.add(Mahasiswa.fromJson(v));
          });
          print(json["data"].length);
          if (json["data"].length < 50) break;
        }
      }
    }

    return mahasiswa;
  }
}
