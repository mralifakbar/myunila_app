import 'package:dio/dio.dart';
import 'package:myunila_app/models/lembaga_model.dart';
import 'get_token.dart';

class GetLembaga {
  Future<List<Lembaga>> getLembaga(int index) async {
    var dio = Dio();
    Response response;
    dio.options.headers["authorization"] = await GetToken().getToken();

    response = await dio
        .get("http://onedata.unila.ac.id/api/live/0.1/lembaga/daftar_lembaga");

    final lembaga = <Lembaga>[];

    if (response.statusCode == 200) {
      final Map<String, dynamic> json = response.data;

      if (index == 0) {
        if (json["data"] != null) {
          json["data"].forEach((v) {
            // print(json["data"]);
            lembaga.add(Lembaga.fromJson(v));
          });
          return lembaga;
        }
      } else if (index == 1) {
        if (json["data"] != null) {
          json["data"].forEach((v) {
            // print(json["data"]);
            if (v["id_jns_sms"] == "1") {
              lembaga.add(Lembaga.fromJson(v));
            }
          });
          return lembaga;
        }
      } else if (index == 2) {
        if (json["data"] != null) {
          json["data"].forEach((v) {
            // print(json["data"]);
            if (v["id_jns_sms"] == "2") {
              lembaga.add(Lembaga.fromJson(v));
            }
          });
          return lembaga;
        }
      } else if (index == 3) {
        if (json["data"] != null) {
          json["data"].forEach((v) {
            // print(json["data"]);
            if (v["id_jns_sms"] == "3") {
              lembaga.add(Lembaga.fromJson(v));
            }
          });
          return lembaga;
        }
      }
    }

    return [];
  }

  Future<List<Lembaga>> getJurusanFromFakultas(String idFakultas) async {
    var dio = Dio();
    Response response;
    dio.options.headers["authorization"] = await GetToken().getToken();

    response = await dio
        .get("http://onedata.unila.ac.id/api/live/0.1/lembaga/daftar_lembaga");

    final lembaga = <Lembaga>[];

    if (response.statusCode == 200) {
      final Map<String, dynamic> json = response.data;

      if (json["data"] != null) {
        json["data"].forEach((v) {
          // print(json["data"]);
          // print(v["id_fak_unila"]);
          // print(idFakultas);
          if (v["id_jns_sms"] == "2" && v["id_fak_unila"] == idFakultas) {
            lembaga.add(Lembaga.fromJson(v));
          }
        });
        return lembaga;
      }
    }

    return [];
  }

  Future<List<Lembaga>> getProdiFromJurusan(String idJurusan) async {
    var dio = Dio();
    Response response;
    dio.options.headers["authorization"] = await GetToken().getToken();

    response = await dio
        .get("http://onedata.unila.ac.id/api/live/0.1/lembaga/daftar_lembaga");

    final lembaga = <Lembaga>[];

    if (response.statusCode == 200) {
      final Map<String, dynamic> json = response.data;

      if (json["data"] != null) {
        json["data"].forEach((v) {
          if (v["id_jns_sms"] == "3" && v["id_jur_unila"] == idJurusan) {
            lembaga.add(Lembaga.fromJson(v));
          }
        });
        return lembaga;
      }
    }

    return [];
  }
}
