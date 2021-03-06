part of boarding;

class Surface {
  Size size; // in pixels
  Rectangle offset;
  CanvasElement canvas;
  CanvasRenderingContext2D context;
  Color color = new Color('white');
  bool withLines;
  bool avoidCollisions;

  Grid grid;
  MovablePieces movablePieces;

  Surface(this.canvas, 
      {this.grid, this.withLines: false, this.movablePieces, this.avoidCollisions: false}) {
    context = canvas.getContext('2d');
    size = new Size(canvas.width, canvas.height);
    offset = canvas.offset;
    color.border = color.main;
    window.animationFrame.then(gameLoop);
  }
  
  num get width => size.width;
  num get height => size.height;

  gameLoop(num delta) {
    draw();
    window.animationFrame.then(gameLoop);
  }

  clear() {
    if (grid != null) {
      drawRect(canvas, 0, 0, width, height, 
          color: grid.color.main, borderColor: grid.color.border);
    } else {
      drawRect(canvas, 0, 0, width, height, 
          color: color.main, borderColor: color.border);
    }
  }
  
  draw() {
    clear();
    if (grid != null) {
      if (withLines) lines();
      cells();
    }
    if (movablePieces != null) {
      movablePieces.forEach((MovablePiece mp) {
        mp.move();
        if (avoidCollisions) {
          movablePieces.avoidCollisions(mp);
        }
        drawPiece(mp);
      });
    }
  }

  lines() {
    var cellWidth = width / grid.columnCount;
    var cellHeight = height / grid.rowCount;
    var x, y;
    for (var row = 1; row < grid.rowCount; row++) {
      x = 0;
      y = cellHeight * row;
      drawLine(canvas, x, y, x + width, y);
    }
    for (var col = 1; col < grid.columnCount; col++) {
      x = cellWidth * col;
      y = 0;
      drawLine(canvas, x, y, x, y + height);
    }
  }

  cells() {
    var cellWidth = width / grid.columnCount;
    var cellHeight = height / grid.rowCount;
    var cells = grid.cells;
    for (CellPiece cellPiece in cells) {
      cellPiece.width = cellWidth;
      cellPiece.height = cellHeight;
      cellPiece.x = cellPiece.width * cellPiece.column;
      cellPiece.y = cellPiece.height * cellPiece.row;
      drawPiece(cellPiece);
    } 
  }

  drawPiece(Piece piece) {
    if (piece.isVisible) {
      if (piece.isCovered) {
        drawRect(canvas, piece.x, piece.y, piece.width, piece.height,
            lineWidth: piece.line.width, color: piece.color.cover, borderColor: piece.color.border);
        var cx = piece.x + piece.width / 2;
        var cy = piece.y + piece.height / 2;
        var r = 4;
        drawCircle(canvas, cx, cy, r);
      } else {
        switch(piece.shape) {
          case PieceShape.CIRCLE:
            drawCircleWithinSquare(canvas, piece.x, piece.y, piece.width,
                lineWidth: piece.line.width, color: piece.color.main, borderColor: piece.color.border);
            break;
          case PieceShape.ELLIPSE:
            drawEllipseWithinRect(canvas, piece.x, piece.y, piece.width, piece.height,
                lineWidth: piece.line.width, color: piece.color.main, borderColor: piece.color.border);
            break;
          case PieceShape.IMG:
            ImageElement img = document.querySelector('#${piece.imgId}');
            if (img != null) {
              drawImgWithinRect(canvas, piece.x, piece.y, piece.width, piece.height, img);
            }
            break;
          case PieceShape.LINE:
            drawLine(canvas, piece.line.p1.x, piece.line.p1.y, piece.line.p2.x, piece.line.p2.y,
                lineWidth: piece.line.width, color: piece.color.main); // no borderColor
            break;
          case PieceShape.POLYGON:
            var r = piece.width / 2;
            if (piece.line.length > r) {
              piece.line.length = r;
            }
            drawPolygonWithinSquare(canvas, piece.x, piece.y, piece.width, piece.line.length, piece.line.count,
                lineWidth: piece.line.width, color: piece.color.main, borderColor: piece.color.border);
            break;
          case PieceShape.RECT:
            drawRect(canvas, piece.x, piece.y, piece.width, piece.height,
                lineWidth: piece.line.width, color: piece.color.main, borderColor: piece.color.border);
            break;
          case PieceShape.ROUNDED_RECT:
            drawRoundedRect(canvas, piece.x, piece.y, piece.width, piece.height,
                lineWidth: piece.line.width, color: piece.color.main, borderColor: piece.color.border);
            break;
          case PieceShape.SELECTED_RECT:
            drawSelectedRect(canvas, piece.x, piece.y, piece.width, piece.height,
                lineWidth: piece.line.width, color: piece.color.main, borderColor: piece.color.border);
            break;
          case PieceShape.SQUARE:
            drawSquare(canvas, piece.x, piece.y, piece.width,
                lineWidth: piece.line.width, color: piece.color.main, borderColor: piece.color.border);
            break;
          case PieceShape.STAR:
            drawStarWithinSquare(canvas, piece.x, piece.y, piece.width,
                lineWidth: piece.line.width, color: piece.color.main, borderColor: piece.color.border);
            break;
          case PieceShape.TAG:
            drawTag(canvas, piece.x, piece.y, piece.tag.text, font: piece.tag.font, size: piece.tag.size, 
                align: piece.tag.align, maxWidth: piece.tag.maxWidth, color: piece.tag.color.main); 
            break;
          case PieceShape.TRIANGLE:
            drawTriangleWithinSquare(canvas, piece.x, piece.y, piece.width,
                lineWidth: piece.line.width, color: piece.color.main, borderColor: piece.color.border);
            break;
          case PieceShape.VEHICLE:
            drawVehicle(canvas, piece.x, piece.y, piece.width, piece.height,
                lineWidth: piece.line.width, color: piece.color.main, borderColor: piece.color.border);
            break;
        }
      }
    }
    if (piece != PieceShape.TAG && piece.isTagged) {
      var x = piece.x + piece.width / 2 - (piece.width / 2 - piece.tag.size) / 2;
      var y = piece.y + piece.height / 2 + (piece.width / 2 - piece.tag.size) / 2;
      x = x + piece.tag.size / 4;
      drawTag(canvas, x, y, piece.tag.text, size: piece.tag.size, color: piece.tag.color.main);
    }
  }
}

class SquareSurface extends Surface {
  int length; // in pixels

  SquareSurface(CanvasElement canvas, {bool withLines: false, SquareGrid grid}):
    super(canvas, withLines: withLines, grid: grid) {
    length = width;
  }
}