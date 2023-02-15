import 'dart:io';

import 'package:logger/logger.dart';

class Voxel {
  double x;
  double y;
  double z;
  double red;
  double green;
  double blue;

  Voxel(
      {required this.x,
      required this.y,
      required this.z,
      required this.red,
      required this.green,
      required this.blue});
}

class PlyParser {
  List<Voxel> voxels = [];

  void parseFile(String fileName) {
    var inputFile = File(fileName);
    var lines = inputFile.readAsLinesSync();

    bool inHeader = true;
    double numVertices = 0;
    double numFaces = 0;

    for (String line in lines) {
      if (inHeader) {
        if (line.startsWith('element vertex')) {
          numVertices = double.parse(line.split(' ')[2]);
        } else if (line.startsWith('element face')) {
          numFaces = double.parse(line.split(' ')[2]);
        } else if (line.startsWith('end_header')) {
          inHeader = false;
        }
      } else if (voxels.length < numVertices) {
        var parts = line.split(' ');
        var x = double.parse(parts[0]);
        var y = double.parse(parts[1]);
        var z = double.parse(parts[2]);
        var red = double.parse(parts[3]);
        var green = double.parse(parts[4]);
        var blue = double.parse(parts[5]);

        voxels.add(Voxel(x: x, y: y, z: z, red: red, green: green, blue: blue));
      }
    }
  }
}

void main() {
  var plyParser = PlyParser();
  plyParser.parseFile('untitled.ply');
  var voxels = plyParser.voxels;
  StackTrace trace = StackTrace.fromString("test");
  print(trace);

  Logger().d(voxels.map((e) {
    if (e.blue == 255 && e.green == 255 && e.red == 255) {
    } else {
      return "${e.blue} ${e.green} ${e.red}";
    }
  }));
}
