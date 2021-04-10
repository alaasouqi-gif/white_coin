import 'package:flutter/material.dart';

class ScrollViewWithHeight extends StatelessWidget {
  final Widget child;

  const ScrollViewWithHeight({Key key, this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new LayoutBuilder(builder: (BuildContext context, BoxConstraints constraints) {
      return new SingleChildScrollView(
        child: new ConstrainedBox(
          constraints: constraints.copyWith(minHeight: constraints.maxHeight, maxHeight: double.infinity),
          child: child,
        ),
      );
    });
  }
}
