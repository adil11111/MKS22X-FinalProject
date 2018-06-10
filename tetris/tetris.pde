TetrisBoard tboard;
final int tileSize = 40;
color colors[];
Piece current, next;
int score;

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

    current = new Piece();
    next = new Piece();
    score = 0;

    frameRate(30);
    textSize(48);
    paint();
}

void draw() {
    //update
    if (frameCount % 30 == 0 && current.drop(tboard)) {
        current = next;
        next = new Piece();
        int completion = tboard.checkCompletions();
        if (completion < 0) {
            //game over
            background(0);
            fill(255);
            text("Game Over\nScore:\n" + score, 200, 400);
            noLoop();
            return;
        }
        score += completion;
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

    //fill(colors[current.getColor()]);
    //rect(current.getX()*tileSize, (current.getY()-2)*tileSize, tileSize, tileSize);

    Tile[][] p = current.getP();
    for (int y = 0; y < 4; y++) {
        for (int x = 0; x < 4; x++) {
            if (p[y][x] != null) {
                Tile t = p[y][x];
                fill(colors[t.getColor()]);
                rect(t.getX()*tileSize, (t.getY()-2)*tileSize, tileSize, tileSize);
            }
        }
    }

    fill(255);
    text("Score:\n" + score, 410, 600);
    text("Next:", 410, 200);
    p = next.getP();
    for (int y = 0; y < 4; y++) {
        for (int x = 0; x < 4; x++) {
            if (p[y][x] != null) {
                Tile t = p[y][x];
                fill(colors[t.getColor()]);
                rect(410 + tileSize*x, 300 + tileSize*y, tileSize, tileSize);
            }
        }
    }

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
