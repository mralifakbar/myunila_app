import 'package:dio/dio.dart';
import 'package:myunila_app/models/mahasiswa_model.dart';
import '../models/alumni_model.dart';
import '../models/buku_model.dart';
import 'get_token.dart';

// void main() async {
//   print(await (new GetMahasiswa()
//       .getMahasiswaByProdi("6C0F8943-A9E9-4EDF-92A4-11B9A71104DF", 1)));
// }

class GetAlumni {
  Future<List<Alumni>> getAlumniByProdi(String idProdi, int tahunLulus) async {
    var dio = Dio();
    Response response;
    dio.options.headers["authorization"] = await GetToken().getToken();

    response = await dio.get(
        "http://onedata.unila.ac.id/api/live/0.1/mahasiswa/list_alumni?page=1&limit=50&sort_by=ASC&tahun_lulus=$tahunLulus");

    final alumni = <Alumni>[];

    if (response.statusCode == 200) {
      final Map<String, dynamic> json = response.data;

      if (json["data"] != null) {
        json["data"].forEach((v) {
          // print(json["data"]);
          alumni.add(Alumni.fromJson(v));
        });
        return alumni;
      }
    }

    return [];
  }
}
