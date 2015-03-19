library drop;

import 'dart:html';
import 'package:boarding/pieces.dart';
import 'package:boarding/boarding.dart';
import 'package:boarding/util.dart' show Direction;

part 'view/board.dart';

main() {
  new Board(querySelector('#canvas')).draw();
}