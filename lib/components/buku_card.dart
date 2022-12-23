import 'package:flutter/material.dart';

import '../models/buku_model.dart';

class BukuCard extends StatefulWidget {
  final Buku buku;

  const BukuCard({super.key, required this.buku});

  @override
  State<BukuCard> createState() => _BukuCardState();
}

class _BukuCardState extends State<BukuCard> {
  var isBookmarked = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Card(
        surfaceTintColor: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 5,
              ),
              Text(
                widget.buku.penerbit.toString(),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(
                height: 190,
                child: Text(
                  widget.buku.judulBuku.toString(),
                  maxLines: 5,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  IconButton(
                    onPressed: () {
                      setState(() {
                        isBookmarked = !isBookmarked;
                      });
                    },
                    icon: isBookmarked
                        ? Icon(Icons.bookmark)
                        : Icon(Icons.bookmark_outline_outlined),
                    iconSize: 30,
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
