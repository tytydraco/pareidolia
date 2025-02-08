# Pareidolia

A library to generate random noise images.

# Usage

```dart

final pareidolia = Pareidolia(seed: 12345);
final image = pareidolia.generate(
  width: 1024,
  height: 512,
  redMin: 0,
  redMax: 255,
  greenMin: 0,
  greenMax: 255,
  blueMin: 0,
  blueMax: 255,
);

final png = encodePng(image);

File
('image.png
'
)
.writeAsBytesSync(
png
);
```