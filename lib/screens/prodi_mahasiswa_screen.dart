import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:myunila_app/api/get_lembaga.dart';
import 'package:myunila_app/models/lembaga_model.dart';

import '../components/lembaga_list.dart';

class ProdiMahasiswaScreen extends StatefulWidget {
  const ProdiMahasiswaScreen({Key? key}) : super(key: key);

  @override
  State<ProdiMahasiswaScreen> createState() => _ProdiMahasiswaScreenState();
}

class _ProdiMahasiswaScreenState extends State<ProdiMahasiswaScreen> {
  int? _value = 3;
  var lembagaServices = GetLembaga();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Prodi Mahasiswa")),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            FutureBuilder(
              future: lembagaServices.getLembaga(_value!),
              builder: (BuildContext context,
                  AsyncSnapshot<List<Lembaga>> snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  return LembagaList(
                    lembaga: snapshot.data ?? [],
                    toProdi: true,
                  );
                } else {
                  return Center(child: CircularProgressIndicator());
                }
              },
            )
          ],
        ),
      ),
    );
  }
}
