import 'package:dio/dio.dart';
import '../models/buku_model.dart';
import 'get_token.dart';

// void main() async {
//   print(await (new GetBuku().getBuku(1)));
// }

class GetBuku {
  Future<List<Buku>> getBuku(int page) async {
    var dio = Dio();
    Response response;
    dio.options.headers["authorization"] = await GetToken().getToken();

    response = await dio.get(
        "http://onedata.unila.ac.id/api/live/0.1/buku_ajar/daftar?page=$page&limit=24&sort_by=DESC");

    final buku = <Buku>[];

    if (response.statusCode == 200) {
      final Map<String, dynamic> json = response.data;

      if (json["data"] != null) {
        json["data"].forEach((v) {
          // print(json["data"]);
          buku.add(Buku.fromJson(v));
        });
        return buku;
      }
    }

    return [];
  }
}
