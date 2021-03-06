
## Version history of [boarding](http://pub.dartlang.org/packages/boarding)

*0.2.4* 2015-03-24

+ add randomRareTrue function to util/random.dart
+ add isTagged property to the Piece class in model/pieces.dart
+ update json methods in Piece
+ use isCovered and isTagged in the randomInit method in Piece
+ in the cells method of the Surface class in the view/surface.dart,
  prepare a cell piece and draw it with the drawPiece method
+ add in drawPiece tests for isVisible, isCovered and isTagged

*0.2.4* 2015-03-23

+ add Color class to util/color.dart
+ rename usedColors to usedColorNames
+ rename colorList to colorNameList
+ rename the getNotUsedColor method to getNotUsedColorName
+ add getNotUsedColor method
+ add Tag class to new util/text.dart
+ rename the randomColor method to randomColorName
+ rename the randomColorCode method to randomColor
+ rename the LinePath class to Line in util/geo.dart
+ add 2 positions to Line
+ add static random method with the Size parameter to Line
+ rename linePath to line in Piece in model/pieces.dart
+ replace color and text String properties in Piece with Color and Text properties
+ update json methods in Piece
+ update the randomInit method in Piece
+ update the drawTagLine and drawOneOfLines functions in view/shapes.dart
+ update the drawTag and drawOneOfTags functions in view/shapes.dart
+ update the drawPiece method in view/surface.dart
+ use Color in view/surface.dart
+ use Size in view/surface.dart
+ use fixed position and size Box in the Piece constructor
+ include random space and random box in the randomInit method in the Piece class
+ rename Cell in model/grid/cell.dart into CellPiece
+ extend CellPiece with Piece
+ add isCovered (former isHidden) in Piece
+ add p_art example
+ update tests
+ update examples
+ add bonhomme example

*0.2.4* 2015-03-21

+ add movablePieces and avoidCollisions properties to Surface in view/surface.dart
+ add movablePieces and avoidCollisions optional named parameters to Surface constructor
+ include movablePieces and conditional avoidCollisions in draw of Surface
+ add (minimal) move example without specific model and view

*0.2.3* 2015-03-21 (Pub)

+ clouds move up in the invaders example
+ replace the creature image by another one

*0.2.3* 2015-03-20

+ add audioId to Piece in model/pieces.dart
+ add usesAudio to Piece in model/pieces.dart
+ update the invaders example to use a sound when a laser hits a creature
+ create a model in the invaders example to initialize moving pieces

+ add videoId to Piece in model/pieces.dart
+ add usesVideo to Piece in model/pieces.dart
+ update the invaders example to show a video at the end of the game

*0.2.3* 2015-03-19

+ add drawPosition to shapes
+ add drawPolygon to shapes
+ add drawPolygonWithinSquare to shapes
+ add POLYGON to enum PieceShape in model/pieces.dart
+ add case PieceShape.POLYGON to Surface in view/surface.dart
+ add LinePath to util/geo.dart
+ use LinePath for linePath property in Piece in model/pieces.dart
+ move lineWidth in Piece to linePath as width
+ add tests

+ add String imageId property to Piece in model/pieces.dart
+ add IMG to enum PieceShape in model/pieces.dart
+ add case PieceShape.IMG to Surface in view/surface.dart
+ move enum Direction from Cell in model/grid/cell.dart to util/geo.dart
+ update import in examples 
+ add invaders example with images

*0.2.3* 2015-03-18

+ add Speed class to util/geo.dart
+ use speed of Speed instead of dx and dy in MovablePiece
+ update the crash example
+ update the dash example
+ update the pingpong example
+ move the Ball and Racket view classes to model/gear.dart in the breakout example
+ add increase, double, decrease and changeDirection in Speed of util/geo.dart
+ add increase, double and decrease in Size of util/geo
+ add increaseWithin, doubleWithin and decreaseWithin in Size of util/geo.dart
+ add stayWithinSpace in Box of util/geo.dart
+ add jump to MovablePiece
+ add changeDirectionIfOutOfSpace to MovablePiece
+ add stars example

*0.2.2* 2015-03-16 (Pub)

+ cleanup function parameters in shapes
+ sort functions in shapes by the following the order in enum PieceShape

*0.2.2* 2015-03-15

+ use only functions in shapes
+ update tests
+ update drawPiece in Surface in surface
+ update examples
+ add a white line in the middle of the table in the pingpong example
+ resolve why some circles are partially out of canvas in the bounce example
+ when the red car is small, hit a car that is not moving to propel it in the crash example
+ add drawEllipseWithinRect in shapes
+ add drawCircleWithinSquare in shapes
+ add drawTriangleWithinSquare in shapes
+ add ELLIPSE and TRIANGLE to enum PieceShape in pieces
+ update tests
+ add lineWidth property to Piece in pieces
+ update drawPiece in Surface in surface

*0.2.2* 2015-03-14

+ remove Point, Dimension and Distance classes from pieces
+ remove optional distance parameter in MovablePiece constructor
+ remove randomPosition based on random distance in MovablePiece
+ remove optional distance parameter in MovablePieces constructor
+ remove optional distance parameter in createMovablePieces in MovablePieces
+ add util/geo.dart
+ add Position, Size, Box, MinMaxSize and MinMaxSpace classes to geo.dart
+ remove x, y and dimension properties in Piece
+ use box, minMaxSize and minMaxSpace properties in Piece
+ update json methods in Piece 
+ update the randomInit method in Piece
+ add get and set for x, y, width and height derived properties in Piece
+ remove distance property in MovablePiece
+ add _space property in Piece
+ update json methods in Piece and MovablePiece 
+ add get and set for _space property in Piece
+ validate positions in set space
+ update the randomInit method in Piece
+ add the randomPosition method in Piece
+ update the randomInit method in MovablePiece
+ update the move method in MovablePiece

*0.2.2* 2015-03-13

+ add Dimension and Distance classes to pieces
+ use Dimension in Piece
+ use Distance in MovablePiece
+ add optional distance parameter to MovablePiece constructor
+ add randomPosition based on random distance in MovablePiece
+ add optional distance parameter to MovablePieces constructor
+ add optional distance parameter to createMovablePieces in MovablePieces
+ rename randomSequence to randomCommandSequence in programs in the art_pen model
+ update examples to use distance
+ improve the move method in RedCar in the crash example
+ add star as a new shape in pieces and shapes
+ add Point class in pieces

*0.2.2* 2015-03-12

+ make speed a derived property in MovablePiece
+ remove spped from json
+ rename colorCode to color in Piece
+ add borderColor to Piece
+ add color to Surface
+ include border color in draw piece in Surface
+ add distance function in pieces
+ add accelerate function in pieces
+ add drawRandomStars and drawStar in shapes
+ add prepareStars and drawStars in shapes
+ add drawDistanceLine in shapes
+ replace surface by canvas in shapes
+ rename shape.dart to shapes.dart
+ add gameLoop to Surface
+ window.animationFrame.then(gameLoop); to Surface
+ add attract example
+ correct bug in getSelectedCarAfterOrBeforeCell of Cars in the rush example

*0.2.1* 2015-03-10 (Pub)

+ move the accident method from RedCar in the crash example to MovablePiece
+ rename the accident method to hit
+ remove the FallingPiece class in pieces
+ remove the FallingPieces class in pieces
+ replace the move method with move([Direction direction]) of MovablePiece in pieces
+ replace FallingPiece with MovablePiece in Board of the drop example
+ show Direction in import in the crash and drop examples
+ add 'black' and 'white' to color list in util
+ rename randomNumber to randomSignNum in util
+ add more random tests
+ add dash example
+ rename distanceWidth to distanceMaxWidth of MovablePiece in pieces
+ rename distanceHeight to distanceMaxHeight of MovablePiece in pieces
+ add distanceMinWidth to MovablePiece 
+ add distanceMinHeight to MovablePiece

*0.2.1* 2015-03-08

+ add drawPiece method in Surface 
+ use drawPiece in Bricks of the breakout example
+ use drawPiece in Board of the crash example
+ use drawPiece in Board of the drop example
+ square hit changes only the square shape to rounded rectangle in the drop example
+ use Tag for the win message in Board of the memory example 
+ rename random range to random range num in util
+ rename the grids library to grid
+ simplify random functions
+ rename RECTANGLE to RECT in PieceShape enum
+ rename ROUNDED_RECTANGLE to ROUNDED_RECT in PieceShape enum
+ add SELECT_RECT to PieceShape enum
+ update drawPiece method in Surface

*0.2.1* 2015-03-07

+ add bounce example
+ add drawPiece in Board of the chaos example
+ correct the load method in Board of the drop example
+ use enum values in json for random shape in pieces
+ add random range in util
+ use random range in random init of pieces

*0.2.0* 2015-03-05 (Pub)

+ save (and load) pieces to (from) the local storage

*0.1.9* 2015-03-04

+ save (and load) grid cells to (from) the local storage
+ save (and load) the best score to (from) the local storage

*0.1.8* 2015-03-03

+ add d2048 example

*0.1.7* 2015-02-25

+ add rush example
+ add breakout example
+ add pingpong example

*0.1.6* 2015-02-24

+ add crash example

*0.1.5* 2015-02-23

+ add falling pieces
+ add drop example

*0.1.4* 2015-02-23

+ add avoid collisions
+ add art pen (with dartling)
+ add run programs and random commands
+ reorganize libraries

*0.1.3* 2015-02-19

+ add moving pieces in the model
+ add abstract class Shape in the view
+ add Chaos example

*0.1.2* 2015-01-27

+ const names are not any more in capital letters

*0.1.1* 2014-02-14 (Pub)

+ move return false to the end of the intersects method in the model/Cell class
+ use var for a local variable in the ttt example

*0.1.0* 2014-02-10 (Pub)

+ create the initial boarding package

