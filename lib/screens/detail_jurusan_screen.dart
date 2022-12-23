import 'package:flutter/material.dart';

import '../api/get_lembaga.dart';
import '../components/lembaga_list.dart';
import '../models/lembaga_model.dart';

class DetailJurusan extends StatefulWidget {
  final Lembaga jurusan;

  const DetailJurusan({super.key, required this.jurusan});

  @override
  State<DetailJurusan> createState() => _DetailJurusanState();
}

class _DetailJurusanState extends State<DetailJurusan> {
  var lembagaServices = GetLembaga();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Detail Jurusan",
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Container(
          width: double.maxFinite,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Card(
                surfaceTintColor: Colors.white,
                elevation: 0.5,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        widget.jurusan.nmLemb.toString(),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                ),
              ),
              FutureBuilder(
                future: lembagaServices
                    .getProdiFromJurusan(widget.jurusan.idSms.toString()),
                builder: (BuildContext context,
                    AsyncSnapshot<List<Lembaga>> snapshot) {
                  if (snapshot.connectionState == ConnectionState.done) {
                    return LembagaList(
                      lembaga: snapshot.data ?? [],
                      toProdi: false,
                    );
                  } else {
                    return Center(child: CircularProgressIndicator());
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
