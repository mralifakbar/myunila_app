import 'package:flutter/material.dart';

import '../models/lembaga_model.dart';

class LembagaCard extends StatelessWidget {
  final Lembaga lembaga;

  const LembagaCard({super.key, required this.lembaga});

  @override
  Widget build(BuildContext context) {
    late String text;
    late Color color;

    if (lembaga.idJnsSms == "1") {
      text = "F";
      color = Color.fromARGB(255, 85, 239, 195);
    } else if (lembaga.idJnsSms == "2") {
      text = "J";
      color = Color.fromARGB(255, 116, 185, 255);
    } else if (lembaga.idJnsSms == "3") {
      text = "P";
      color = Color.fromARGB(255, 162, 155, 254);
    } else {
      text = "O";
      color = Color.fromARGB(255, 178, 190, 195);
    }

    return Container(
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
                    "$text",
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
                    lembaga.nmLemb!,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(fontWeight: FontWeight.w600),
                  ),
                )
              ],
            ),
          )),
    );
  }
}
