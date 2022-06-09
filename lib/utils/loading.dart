import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatelessWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
          child: SpinKitFoldingCube(
        size: 100,
        itemBuilder: (context, index) {
          final colors = [
            Colors.purpleAccent,
            Colors.purple,
          ];
          final color = colors[index % colors.length];
          return DecoratedBox(decoration: BoxDecoration(color: color));
        },
      )),
    );
  }
}
