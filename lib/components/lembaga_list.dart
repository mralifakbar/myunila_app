import 'package:flutter/material.dart';
import 'package:myunila_app/components/lembaga_card.dart';
import 'package:myunila_app/components/prodi_to_mahasiswa_card.dart';

import '../models/lembaga_model.dart';

class LembagaList extends StatelessWidget {
  final List<Lembaga> lembaga;
  final bool toProdi;
  const LembagaList({super.key, required this.lembaga, required this.toProdi});

  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.separated(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        padding: const EdgeInsets.all(8),
        itemCount: lembaga.length,
        itemBuilder: (BuildContext context, int index) {
          if (toProdi) {
            return ProdiToMahasiswaCard(
              prodi: lembaga[index],
            );
          } else {
            return LembagaCard(
              lembaga: lembaga[index],
            );
          }
        },
        separatorBuilder: (BuildContext context, int index) => const Divider(),
      ),
    );
  }
}
