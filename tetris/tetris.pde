TetrisBoard tboard;
final int tileSize = 40;
color colors[];
Tile current;

void setup() {
    size(600, 800);
    tboard = new TetrisBoard();
    colors = new color[7];
    colors[Piece.I] = color(200, 50, 50);
    colors[Piece.J] = color(150, 150, 150);
    colors[Piece.L] = color(190, 85, 210);
    colors[Piece.O] = color(0, 0, 200);
    colors[Piece.S] = color(0, 200, 100);
    colors[Piece.T] = color(200, 100, 30);
    colors[Piece.Z] = color(0, 255, 255);

    current = new Tile(5, 0);

    frameRate(5);
    background(0);
}
