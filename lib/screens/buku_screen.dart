import 'package:flutter/material.dart';
import 'package:myunila_app/api/get_buku.dart';
import 'package:myunila_app/components/buku_grid_view.dart';
import 'package:myunila_app/models/buku_model.dart';

class BukuScreen extends StatefulWidget {
  const BukuScreen({Key? key}) : super(key: key);

  @override
  State<BukuScreen> createState() => _BukuScreenState();
}

class _BukuScreenState extends State<BukuScreen> {
  var _value = 1;
  var bukuServices = GetBuku();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Buku")),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            Expanded(
              child: FutureBuilder(
                future: bukuServices.getBuku(_value),
                builder:
                    (BuildContext context, AsyncSnapshot<List<Buku>> snapshot) {
                  if (snapshot.connectionState == ConnectionState.done) {
                    return BukuGridView(buku: snapshot.data ?? []);
                  } else {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                },
              ),
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  onPressed: () {
                    setState(() {
                      if (_value == 1) _value = 23;
                      _value = (_value % 24) - 1;
                    });
                  },
                  icon: Icon(Icons.arrow_back),
                ),
                Text(
                  _value.toString(),
                  style: TextStyle(fontSize: 18),
                ),
                IconButton(
                  onPressed: () {
                    setState(() {
                      _value = ((_value % 22) + 1);
                    });
                  },
                  icon: Icon(Icons.arrow_forward),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
