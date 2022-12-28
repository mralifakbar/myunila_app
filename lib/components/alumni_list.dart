import 'package:flutter/material.dart';
import 'package:myunila_app/components/alumni_card.dart';

import '../models/alumni_model.dart';

class AlumniList extends StatefulWidget {
  final List<Alumni> alumni;

  const AlumniList({super.key, required this.alumni});

  @override
  State<AlumniList> createState() => _AlumniListState();
}

class _AlumniListState extends State<AlumniList> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.separated(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        padding: const EdgeInsets.all(8),
        itemCount: widget.alumni.length,
        itemBuilder: (BuildContext context, int index) {
          return AlumniCard(alumni: widget.alumni[index]);
        },
        separatorBuilder: (BuildContext context, int index) => const Divider(),
      ),
    );
  }
}
