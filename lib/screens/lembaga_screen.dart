import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:myunila_app/api/get_lembaga.dart';
import 'package:myunila_app/models/lembaga_model.dart';

import '../components/lembaga_list.dart';

class LembagaScreen extends StatefulWidget {
  const LembagaScreen({Key? key}) : super(key: key);

  @override
  State<LembagaScreen> createState() => _LembagaScreenState();
}

class _LembagaScreenState extends State<LembagaScreen> {
  int? _value = 0;
  var lembagaServices = GetLembaga();
  List<String> lembagaCategory = ["Semua", "Fakultas", "Jurusan", "Prodi"];
  TextEditingController editingController = TextEditingController();
  var holdLembaga;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Lembaga")),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 8,
            ),
            Wrap(
              spacing: 5.0,
              children: List<Widget>.generate(
                4,
                (int index) {
                  return ChoiceChip(
                    labelStyle: _value == index
                        ? TextStyle(color: Colors.white)
                        : TextStyle(color: Colors.black),
                    label: Text(lembagaCategory[index]),
                    selected: _value == index,
                    onSelected: (bool selected) {
                      setState(() {
                        _value = selected ? index : null;
                      });
                    },
                  );
                },
              ).toList(),
            ),
            FutureBuilder(
              future: lembagaServices.getLembaga(_value!),
              builder: (BuildContext context,
                  AsyncSnapshot<List<Lembaga>> snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  return LembagaList(lembaga: snapshot.data ?? []);
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
