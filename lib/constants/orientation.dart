import 'package:flutter/cupertino.dart';

class OrientationLayout extends StatelessWidget {
  final Widget landscape;
  final Widget portrait;

  const OrientationLayout({
    required this.landscape,
    required this.portrait,
  });

  @override
  Widget build(BuildContext context) {
    var orientation = MediaQuery.of(context).orientation;
    if (orientation == Orientation.landscape) {
      return landscape;
    }

    return portrait;
  }
}
