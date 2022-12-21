import 'package:flutter/material.dart';
import 'package:myunila_app/screens/lembaga_screen.dart';

class FeatureCard extends StatelessWidget {
  final String imageName;
  final String name;
  final Widget widget;

  const FeatureCard({
    Key? key,
    required this.name,
    required this.imageName,
    required this.widget,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => widget),
          );
        },
        child: Container(
          width: double.infinity,
          child: Card(
            elevation: 0.5,
            surfaceTintColor: Colors.white,
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  Image.asset(
                    "assets/$imageName",
                    width: 50,
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Text(
                    "$name",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
