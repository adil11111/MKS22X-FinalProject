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

void draw() {
    //update
    if (current.drop(tboard)) {
        current = new Tile(5, 0);
    }

    //draw
    paint();
}

void paint() {
    background(0);
    noStroke();

    for (int y = 0; y < tboard.getBoard().length; y++) {
        for (int x = 0; x < tboard.getBoard()[0].length; x++) {
            if (tboard.getTile(x, y) != null) {
                fill(colors[tboard.getTile(x, y).getColor()]);
                rect(x*tileSize, (y-2)*tileSize, tileSize, tileSize);
            }
        }
    }

    fill(colors[current.getColor()]);
    rect(current.getX()*tileSize, (current.getY()-2)*tileSize, tileSize, tileSize);

    stroke(255);
    line(10*tileSize, 0, 10*tileSize, height);
}
void keyPressed() {
    if (keyCode == LEFT) {
        current.goLeft(tboard);
    } else if (keyCode == RIGHT) {
        current.goRight(tboard);
    } 
    paint();
}
