import 'package:flutter/material.dart';

class IconArrowRight extends StatelessWidget {
  const IconArrowRight({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Icon(
      Icons.arrow_forward,
      size: 26.0,
      color: Colors.blueGrey,
    );
  }
}
