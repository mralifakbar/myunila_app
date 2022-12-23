import 'dart:math';

import 'package:flutter/material.dart';
import 'package:myunila_app/models/lembaga_model.dart';

import '../screens/list_mahasiswa_screen.dart';

class ProdiToMahasiswaCard extends StatefulWidget {
  final Lembaga prodi;

  const ProdiToMahasiswaCard({super.key, required this.prodi});

  @override
  State<ProdiToMahasiswaCard> createState() => _ProdiToMahasiswaCardState();
}

class _ProdiToMahasiswaCardState extends State<ProdiToMahasiswaCard> {
  @override
  Widget build(BuildContext context) {
    var intValue = Random().nextInt(5) + 1;
    late Color color;
    var iconText = widget.prodi.nmLemb.toString().substring(0, 1);

    if (intValue == 1) {
      color = Color.fromARGB(255, 85, 239, 195);
    } else if (intValue == 2) {
      color = Color.fromARGB(255, 116, 185, 255);
    } else if (intValue == 3) {
      color = Color.fromARGB(255, 162, 155, 254);
    } else if (intValue == 4) {
      color = Color.fromARGB(255, 255, 107, 107);
    } else if (intValue == 5) {
      color = Color.fromARGB(255, 254, 202, 87);
    }
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ListMahasiswaScreen(
              idProdi: widget.prodi.idSms.toString(),
            ),
          ),
        );
      },
      child: Container(
        width: double.infinity,
        child: Card(
            surfaceTintColor: Colors.white,
            elevation: 0.1,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 25,
                    backgroundColor: color,
                    child: Text(
                      "$iconText",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontSize: 20,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Expanded(
                    child: Text(
                      widget.prodi.nmLemb!,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(fontWeight: FontWeight.w600),
                    ),
                  )
                ],
              ),
            )),
      ),
    );
  }
}
