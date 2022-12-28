import 'package:dio/dio.dart';
import 'package:myunila_app/models/mahasiswa_model.dart';
import '../models/alumni_model.dart';
import '../models/buku_model.dart';
import 'get_token.dart';

void main() async {
  print(await (new GetAlumni().getAlumniByProdiAndTahunLulus(
      "54BBD27B-2376-4CAE-9951-76EF54BD2CA2", "2022")));
}

class GetAlumni {
  Future<List<Alumni>> getAlumniByProdiAndTahunLulus(
      String idProdi, String tahunLulus) async {
    var dio = Dio();
    Response response;
    dio.options.headers["authorization"] = await GetToken().getToken();

    final alumni = <Alumni>[];

    for (int i = 1; i < 23; i++) {
      response = await dio.get(
          'http://onedata.unila.ac.id/api/live/0.1/mahasiswa/list_alumni?page=$i&limit=50&sort_by=ASC&tahun_lulus=$tahunLulus&id_prodi=$idProdi');

      if (response.statusCode == 200) {
        final Map<String, dynamic> json = response.data;

        if (json["data"] != null) {
          json["data"].forEach((v) {
            alumni.add(Alumni.fromJson(v));
          });
          if (json["data"].length < 50) break;
        }
      }
    }

    return alumni;
  }
}
