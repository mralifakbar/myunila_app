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

    response = await dio.get(
        "http://onedata.unila.ac.id/api/live/0.1/mahasiswa/list_mahasiswa?page=$page&limit=50&sort_by=ASC&id_prodi=$idProdi");

    final mahasiswa = <Mahasiswa>[];

    if (response.statusCode == 200) {
      final Map<String, dynamic> json = response.data;

      if (json["data"] != null) {
        json["data"].forEach((v) {
          // print(json["data"]);
          mahasiswa.add(Mahasiswa.fromJson(v));
        });
        return mahasiswa;
      }
    }

    return [];
  }
}
