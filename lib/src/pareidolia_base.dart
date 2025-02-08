import 'dart:math';

import 'package:image/image.dart';

/// Random image generator.
class Pareidolia {
  /// Creates a new [Pareidolia].
  Pareidolia({
    this.seed,
  });

  /// The random seed for the random number generator.
  final int? seed;

  /// The random number generator instance.
  late final random = Random(seed);

  int _randomRange(int min, int max) {
    return random.nextInt(max - min + 1) + min;
  }

  /// Generates an image with random color data.
  Image generate({
    required int width,
    required int height,
    int redMin = 0,
    int redMax = 255,
    int greenMin = 0,
    int greenMax = 255,
    int blueMin = 0,
    int blueMax = 255,
  }) {
    final image = Image(width: width, height: height);

    for (final pixel in image) {
      pixel
        ..r = _randomRange(redMin, redMax)
        ..g = _randomRange(greenMin, greenMax)
        ..b = _randomRange(blueMin, blueMax);
    }

    return image;
  }
}
