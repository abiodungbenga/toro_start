import 'package:flutter/material.dart';
import 'package:toro_start/widget/custom_scaffold.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      body: Column(
        children: [
          Text("TEST DEVICE DEFAULT FONT", style: TextStyle(color: Colors.black, fontSize: 30),),

        ],
      ),

    );
  }
}
