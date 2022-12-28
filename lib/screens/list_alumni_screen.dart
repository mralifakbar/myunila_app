import 'package:flutter/material.dart';
import 'package:myunila_app/api/get_alumni.dart';
import 'package:myunila_app/components/alumni_list.dart';
import 'package:myunila_app/models/alumni_model.dart';

class ListAlumniScreen extends StatefulWidget {
  final String idProdi, tahunLulus;
  const ListAlumniScreen(
      {super.key, required this.idProdi, required this.tahunLulus});

  @override
  State<ListAlumniScreen> createState() => _ListAlumniScreenState();
}

class _ListAlumniScreenState extends State<ListAlumniScreen> {
  var alumniServices = GetAlumni();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("List Alumni")),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            FutureBuilder(
              future: alumniServices.getAlumniByProdiAndTahunLulus(
                  widget.idProdi.toString(), widget.tahunLulus.toString()),
              builder:
                  (BuildContext context, AsyncSnapshot<List<Alumni>> snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  return AlumniList(
                    alumni: snapshot.data ?? [],
                  );
                } else {
                  return Center(child: CircularProgressIndicator());
                }
              },
            )
          ],
        ),
      ),
    );
  }
}
