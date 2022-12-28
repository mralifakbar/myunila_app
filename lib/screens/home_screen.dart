import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myunila_app/components/feature_card.dart';
import 'package:myunila_app/screens/lembaga_screen.dart';
import 'package:myunila_app/screens/prodi_mahasiswa_screen.dart';

import 'buku_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "Halo, selamat datang!",
                  style: TextStyle(fontSize: 40, fontWeight: FontWeight.w600),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  "Silakan pilih layanan pencarian",
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                SizedBox(
                  height: 12,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    FeatureCard(
                      name: "Lembaga",
                      imageName: "lembaga.png",
                      widget: LembagaScreen(),
                    ),
                    FeatureCard(
                      name: "Mahasiswa",
                      imageName: "mahasiswa.png",
                      widget: ProdiMahasiswaScreen(
                        mahasiswa: true,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 12,
                  width: double.infinity,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    FeatureCard(
                      name: "Alumni",
                      imageName: "alumni.png",
                      widget: ProdiMahasiswaScreen(mahasiswa: false),
                    ),
                    FeatureCard(
                      name: "Buku",
                      imageName: "buku.png",
                      widget: BukuScreen(),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
