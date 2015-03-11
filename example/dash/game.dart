library dash;

import 'dart:html';
import 'package:boarding/grid.dart' show Direction;
import 'package:boarding/pieces.dart';
import 'package:boarding/boarding.dart';

part 'view/board.dart';

main() {
  new Board(querySelector('#canvas')).draw();
}