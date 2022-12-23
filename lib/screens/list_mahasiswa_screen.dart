import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:myunila_app/api/get_lembaga.dart';
import 'package:myunila_app/api/get_mahasiswa.dart';
import 'package:myunila_app/components/mahasiswa_list.dart';
import 'package:myunila_app/models/lembaga_model.dart';
import 'package:myunila_app/models/mahasiswa_model.dart';

import '../components/lembaga_list.dart';

class ListMahasiswaScreen extends StatefulWidget {
  final String idProdi;

  const ListMahasiswaScreen({Key? key, required this.idProdi})
      : super(key: key);

  @override
  State<ListMahasiswaScreen> createState() => _ListMahasiswaScreenState();
}

class _ListMahasiswaScreenState extends State<ListMahasiswaScreen> {
  int? _value = 0;
  var mahasiswaServices = GetMahasiswa();
  List<String> lembagaCategory = ["Semua", "Fakultas", "Jurusan", "Prodi"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Mahasiswa")),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            FutureBuilder(
              future: mahasiswaServices.getMahasiswaByProdi(
                  widget.idProdi.toString(), 1),
              builder: (BuildContext context,
                  AsyncSnapshot<List<Mahasiswa>> snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  return MahasiswaList(mahasiswa: snapshot.data ?? []);
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
