import 'package:flutter/material.dart';
import 'package:myunila_app/screens/list_alumni_screen.dart';
import 'package:myunila_app/screens/list_mahasiswa_screen.dart';

import '../components/feature_card.dart';
import '../models/lembaga_model.dart';
import 'buku_screen.dart';
import 'lembaga_screen.dart';

class DetailProdiScreen extends StatefulWidget {
  final Lembaga prodi;

  const DetailProdiScreen({super.key, required this.prodi});

  @override
  State<DetailProdiScreen> createState() => _DetailProdiScreenState();
}

class _DetailProdiScreenState extends State<DetailProdiScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Detail Prodi",
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Container(
          width: double.maxFinite,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Card(
                surfaceTintColor: Colors.white,
                elevation: 0.5,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        widget.prodi.nmLemb.toString(),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w600),
                      ),
                      SizedBox(
                        height: 12,
                      ),
                      Text(
                        "Akreditasi",
                        style: TextStyle(fontWeight: FontWeight.w600),
                      ),
                      Text(
                        widget.prodi.statProdi.toString(),
                      ),
                      SizedBox(
                        height: 6,
                      ),
                      Text(
                        "Jenjang",
                        style: TextStyle(fontWeight: FontWeight.w600),
                      ),
                      Text(
                        widget.prodi.nmJenjDidik.toString(),
                      ),
                      SizedBox(
                        height: 6,
                      ),
                      Text(
                        "Tanggal Berdiri",
                        style: TextStyle(fontWeight: FontWeight.w600),
                      ),
                      Text(
                        widget.prodi.tglBerdiri.toString(),
                      ),
                      SizedBox(
                        height: 6,
                      ),
                      Text(
                        "Gelar Lulusan",
                        style: TextStyle(fontWeight: FontWeight.w600),
                      ),
                      Text(
                        widget.prodi.gelarLulusan != null
                            ? widget.prodi.gelarLulusan.toString()
                            : "-",
                      ),
                    ],
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  FeatureCard(
                    name: "Alumni",
                    imageName: "alumni.png",
                    widget: ListAlumniScreen(
                        idProdi: widget.prodi.idSms.toString(),
                        tahunLulus: "2022"),
                  ),
                  FeatureCard(
                    name: "Mahasiswa",
                    imageName: "mahasiswa.png",
                    widget: ListMahasiswaScreen(
                      idProdi: widget.prodi.idSms.toString(),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
