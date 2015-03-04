part of d2048;

class Board extends SquareSurface {
  static const String d2048 = 'd2048';
  static const String d2048Best = 'd2048Best';
  
  LabelElement bestLabel = querySelector('#best');
  
  Board(CanvasElement canvas, TileGrid tileGrid) : super(canvas, grid: tileGrid) { 
    querySelector('#save').onClick.listen((e) {
      save();
    });
    querySelector('#load').onClick.listen((e) {
      load();
    });
    querySelector('#new').onClick.listen((e) {
      newGame();
    });
    document.onKeyDown.listen((KeyboardEvent event) {
      switch(event.keyCode) {
        case KeyCode.UP: 
          tileGrid.cells.move(Direction.UP);
          tileGrid.cells.merge(Direction.UP); 
          break;
        case KeyCode.DOWN: 
          tileGrid.cells.move(Direction.DOWN);
          tileGrid.cells.merge(Direction.DOWN); 
          break;
        case KeyCode.LEFT: 
          tileGrid.cells.move(Direction.LEFT);
          tileGrid.cells.merge(Direction.LEFT); 
          break;
        case KeyCode.RIGHT: 
          tileGrid.cells.move(Direction.RIGHT);
          tileGrid.cells.merge(Direction.RIGHT); 
      }
      if (tileGrid.randomAvailableCell() == null) {
        // game over
        bestLabel.text = saveBest(tileGrid.cells.maxCell().number).toString(); 
        tileGrid.cells.forEach((Cell c) => c.color = 'white'); 
      } 
    });
    bestLabel.text = loadBest().toString();
    window.animationFrame.then(gameLoop);
  }

  gameLoop(num delta) {
    draw();
    window.animationFrame.then(gameLoop);
  }
  
  save() {
    window.localStorage[d2048] = grid.cells.toJsonString();
  }
  
  num saveBest(num current) {
    var best = loadBest();
    if (current > best) {
      window.localStorage[d2048Best] = bestLabel.text;
      return current;
    } 
    return best;
  }
  
  load() {
    String gameString = window.localStorage[d2048];
    if (gameString != null) {
      grid.cells.empty(); 
      grid.cells.fromJsonString(gameString);
    }
  }
  
  num loadBest() {
    var best = window.localStorage[d2048Best];
    if (best != null) {
      return num.parse(best);
    }
    return 0;
  }
  
  newGame() {
    grid.cells.empty(); 
    grid.addTwoRandomAvailableCells();
    //(grid as TileGrid).addTwoRandomAvailableCells();
  }
}