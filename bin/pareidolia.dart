import 'dart:io';

import 'package:args/args.dart';
import 'package:image/image.dart';
import 'package:pareidolia/pareidolia.dart';

Future<void> main(List<String> args) async {
  final argParser = ArgParser();
  argParser
    ..addFlag(
      'help',
      abbr: 'h',
      help: 'Shows the program usage.',
      negatable: false,
      callback: (value) {
        if (value) {
          stdout.writeln(argParser.usage);
          exit(0);
        }
      },
    )
    ..addOption(
      'width',
      abbr: 'x',
      help: 'The image width.',
      defaultsTo: '1920',
    )
    ..addOption(
      'height',
      abbr: 'y',
      help: 'The image height.',
      defaultsTo: '1080',
    )
    ..addOption(
      'seed',
      abbr: 's',
      help: 'The seed to use.',
    )
    ..addOption(
      'filename',
      abbr: 'f',
      help: 'The filename to save the image under.',
      defaultsTo: 'image.png',
    )
    ..addOption(
      'red-min',
      help: 'The minimum RGB value for the red channel [0, 255].',
      defaultsTo: '0',
    )
    ..addOption(
      'red-max',
      help: 'The maximum RGB value for the red channel [0, 255].',
      defaultsTo: '255',
    )
    ..addOption(
      'green-min',
      help: 'The minimum RGB value for the green channel [0, 255].',
      defaultsTo: '0',
    )
    ..addOption(
      'green-max',
      help: 'The maximum RGB value for the green channel [0, 255].',
      defaultsTo: '255',
    )
    ..addOption(
      'blue-min',
      help: 'The minimum RGB value for the blue channel [0, 255].',
      defaultsTo: '0',
    )
    ..addOption(
      'blue-max',
      help: 'The maximum RGB value for the blue channel [0, 255].',
      defaultsTo: '255',
    );

  final options = argParser.parse(args);

  try {
    final width = int.parse(options['width']! as String);
    final height = int.parse(options['height']! as String);
    final seed =
        options['seed'] == null ? null : int.parse(options['seed']! as String);
    final filename = options['filename']! as String;
    final redMin = int.parse(options['red-min']! as String).clamp(0, 255);
    final redMax = int.parse(options['red-max']! as String).clamp(0, 255);
    final greenMin = int.parse(options['green-min']! as String).clamp(0, 255);
    final greenMax = int.parse(options['green-max']! as String).clamp(0, 255);
    final blueMin = int.parse(options['blue-min']! as String).clamp(0, 255);
    final blueMax = int.parse(options['blue-max']! as String).clamp(0, 255);

    final pareidolia = Pareidolia(seed: seed);
    final image = pareidolia.generate(
      width: width,
      height: height,
      redMin: redMin,
      redMax: redMax,
      greenMin: greenMin,
      greenMax: greenMax,
      blueMin: blueMin,
      blueMax: blueMax,
    );

    final file = File(filename);
    await file.writeAsBytes(encodePng(image));
  } catch (e) {
    stderr.writeln(e.toString());
    exit(1);
  }
}
