part of breakout;

class Ball extends MovablePiece {
  static const num defaultRadius = 10;
  
  num _radius;
  
  Ball() {
    shape = PieceShape.CIRCLE;
    radius = defaultRadius;
    color.main = 'yellow';
    color.border = 'white';
  }
  
  num get radius => _radius;
  set radius(num r) {
    _radius = r;
    width = 2 * radius;
    height = 2 * radius;
  }
}

class Racket extends MovablePiece {
  static const num defaultWidth = 75;
  static const num defaultHeight = 10;
  
  Racket() {
    shape = PieceShape.RECT;
    width = defaultWidth;
    height = defaultHeight;
    color.main = 'white';
    color.border = 'green';
  }
}