import 'dart:math';

import 'package:flutter/material.dart';

import '../models/mahasiswa_model.dart';

class MahasiswaCard extends StatefulWidget {
  final Mahasiswa mahasiswa;

  const MahasiswaCard({super.key, required this.mahasiswa});

  @override
  State<MahasiswaCard> createState() => _MahasiswaCardState();
}

class _MahasiswaCardState extends State<MahasiswaCard> {
  @override
  Widget build(BuildContext context) {
    var intValue = Random().nextInt(5) + 1;
    late Color color;
    var iconText = widget.mahasiswa.namaMahasiswa.toString().substring(0, 1);
    var ipk = widget.mahasiswa.ipk.toString();

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
        // Navigator.push(
        //   context,
        //   MaterialPageRoute(
        //       builder: (context) => DetailProdiScreen(prodi: lembaga)),
        // );
        final snackBar = SnackBar(
          content: const Text('Yay! A SnackBar!'),
          action: SnackBarAction(
            label: 'Undo',
            onPressed: () {
              // Some code to undo the change.
            },
          ),
        );

        // Find the ScaffoldMessenger in the widget tree
        // and use it to show a SnackBar.
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
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
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: 220,
                        child: Text(
                          widget.mahasiswa.namaMahasiswa.toString(),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(fontWeight: FontWeight.w600),
                        ),
                      ),
                      Text(
                        "IPK: $ipk",
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(fontWeight: FontWeight.w400),
                      )
                    ],
                  ),
                ],
              ),
            )),
      ),
    );
    ;
  }
}
