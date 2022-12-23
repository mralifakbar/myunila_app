import 'package:flutter/material.dart';
import 'package:myunila_app/components/mahasiswa_card.dart';
import 'package:myunila_app/models/mahasiswa_model.dart';

class MahasiswaList extends StatelessWidget {
  final List<Mahasiswa> mahasiswa;

  const MahasiswaList({super.key, required this.mahasiswa});

  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.separated(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        padding: const EdgeInsets.all(8),
        itemCount: mahasiswa.length,
        itemBuilder: (BuildContext context, int index) {
          return MahasiswaCard(
            mahasiswa: mahasiswa[index],
          );
        },
        separatorBuilder: (BuildContext context, int index) => const Divider(),
      ),
    );
  }
}
