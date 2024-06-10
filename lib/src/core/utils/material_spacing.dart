import 'package:flutter/material.dart';

class MaterialSpacing extends StatelessWidget {
  final int height;
  final int width;

  double get calculatedHeight => height * 8;
  double get calculatedWidth => width * 8;

  const MaterialSpacing({
    super.key,
    this.height = 0,
    this.width = 0,
  });

  factory MaterialSpacing.heightMin() {
    return const MaterialSpacing(
      height: 1,
    );
  }

  factory MaterialSpacing.widthMin() {
    return const MaterialSpacing(
      width: 1,
    );
  }

  factory MaterialSpacing.heightDefault() {
    return const MaterialSpacing(
      height: 2,
    );
  }

  factory MaterialSpacing.widthDefault() {
    return const MaterialSpacing(
      width: 2,
    );
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: calculatedHeight,
      width: calculatedWidth,
    );
  }
}
