import 'package:flutter/material.dart';
import 'package:myunila_app/api/get_lembaga.dart';
import 'package:myunila_app/models/lembaga_model.dart';

import '../components/lembaga_list.dart';

class DetailFakultas extends StatefulWidget {
  final Lembaga fakultas;

  const DetailFakultas({super.key, required this.fakultas});

  @override
  State<DetailFakultas> createState() => _DetailFakultasState();
}

class _DetailFakultasState extends State<DetailFakultas> {
  var lembagaServices = GetLembaga();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Detail Fakultas",
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
                        widget.fakultas.nmLemb.toString(),
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
                    .getJurusanFromFakultas(widget.fakultas.idSms.toString()),
                builder: (BuildContext context,
                    AsyncSnapshot<List<Lembaga>> snapshot) {
                  // print(widget.fakultas.idFakUnila.toString());
                  if (snapshot.connectionState == ConnectionState.done) {
                    return LembagaList(lembaga: snapshot.data ?? []);
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
