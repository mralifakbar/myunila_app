import 'package:flutter/material.dart';
import 'package:myunila_app/components/buku_card.dart';

import '../models/buku_model.dart';

class BukuGridView extends StatefulWidget {
  final List<Buku> buku;

  const BukuGridView({super.key, required this.buku});

  @override
  State<BukuGridView> createState() => _BukuGridViewState();
}

class _BukuGridViewState extends State<BukuGridView> {
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        itemCount: 24,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          childAspectRatio: 0.60,
          crossAxisCount: 2,
        ),
        itemBuilder: (context, index) {
          final buku = widget.buku[index % 24];
          // print(buku.judulBuku.toString());
          return BukuCard(buku: buku);
        });
  }
}
