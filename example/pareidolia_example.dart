import 'dart:io';

import 'package:image/image.dart';
import 'package:pareidolia/pareidolia.dart';

void main() {
  final pareidolia = Pareidolia(seed: 12345);
  final image = pareidolia.generate(
    width: 1024,
    height: 512,
    redMax: 0,
    blueMax: 0,
  );
  final png = encodePng(image);
  File('image.png').writeAsBytesSync(png);
}
