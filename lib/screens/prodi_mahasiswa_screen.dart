import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:myunila_app/api/get_lembaga.dart';
import 'package:myunila_app/models/lembaga_model.dart';

import '../components/lembaga_list.dart';

class ProdiMahasiswaScreen extends StatefulWidget {
  final bool mahasiswa;
  const ProdiMahasiswaScreen({Key? key, required this.mahasiswa})
      : super(key: key);

  @override
  State<ProdiMahasiswaScreen> createState() => _ProdiMahasiswaScreenState();
}

class _ProdiMahasiswaScreenState extends State<ProdiMahasiswaScreen> {
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
            // FutureBuilder(
            //   future: lembagaServices.getLembaga(1),
            //   builder: (BuildContext context,
            //       AsyncSnapshot<List<Lembaga>> snapshot) {
            //     if (snapshot.connectionState == ConnectionState.done) {
            //       var namaFakultas = <String>[];
            //       var idFakultas = <String>[];
            //       List<Lembaga>? testLembaga = snapshot.data;
            //       testLembaga?.forEach((element) {
            //         namaFakultas.add(element.nmLemb.toString());
            //         idFakultas.add(element.idSms.toString());
            //       });
            //       return DropdownButtonFormField(
            //         decoration: InputDecoration(border: OutlineInputBorder()),
            //         value: dropdownValue,
            //         items: namaFakultas
            //             .map<DropdownMenuItem<String>>((String value) {
            //           return DropdownMenuItem<String>(
            //             value: value,
            //             child: Text(
            //               value,
            //               maxLines: 2,
            //               overflow: TextOverflow.ellipsis,
            //               style: TextStyle(fontSize: 16),
            //             ),
            //           );
            //         }).toList(),
            //         onChanged: (String? newValue) {
            //           setState(() {
            //             dropdownValue = newValue!;
            //           });
            //         },
            //       );
            //     } else {
            //       return Center(child: CircularProgressIndicator());
            //     }
            //   },
            // ),
            FutureBuilder(
              future: lembagaServices.getLembaga(3),
              builder: (BuildContext context,
                  AsyncSnapshot<List<Lembaga>> snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  if (widget.mahasiswa) {
                    return LembagaList(
                      lembaga: snapshot.data ?? [],
                      toLembaga: false,
                      mahasiswa: true,
                    );
                  } else {
                    return LembagaList(
                      lembaga: snapshot.data ?? [],
                      toLembaga: false,
                      mahasiswa: false,
                    );
                  }
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
