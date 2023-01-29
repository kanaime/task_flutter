import 'package:flutter/material.dart';

class Loading extends StatelessWidget {
  const Loading({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color.fromARGB(255, 247, 247, 247),
      child: Center(
        child: CircularProgressIndicator(
          color: Color.fromARGB(255, 0, 0, 0),
          strokeWidth: 10,
        ),
      ),
    );
  }
}
