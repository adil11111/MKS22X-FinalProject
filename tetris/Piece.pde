public class Piece {
    public static final int I = 0;
    public static final int J = 1;
    public static final int L = 2;
    public static final int O = 3;
    public static final int S = 4;
    public static final int T = 5;
    public static final int Z = 6;

    private Tile[][] p;
    private int pieceID;
    
public Piece() {
        p = new Tile[4][4];
        pieceID = (int)(Math.random()*7);
        switch (pieceID) {
            case I:
                p[0][1] = new Tile(5, 0, pieceID);
                p[1][1] = new Tile(5, 1, pieceID);
                p[2][1] = new Tile(5, 2, pieceID);
                p[3][1] = new Tile(5, 3, pieceID);
                break;
            case J:
                p[0][1] = new Tile(5, 0, pieceID);
                p[1][1] = new Tile(5, 1, pieceID);
                p[2][1] = new Tile(5, 2, pieceID);
                p[2][0] = new Tile(4, 2, pieceID);
                break;
            case L:
                p[0][1] = new Tile(5, 0, pieceID);
                p[1][1] = new Tile(5, 1, pieceID);
                p[2][1] = new Tile(5, 2, pieceID);
                p[2][2] = new Tile(6, 2, pieceID);
                break;
            case O:
                p[0][0] = new Tile(4, 0, pieceID);
                p[0][1] = new Tile(5, 0, pieceID);
                p[1][0] = new Tile(4, 1, pieceID);
                p[1][1] = new Tile(5, 1, pieceID);
                break;
            case S:
                p[0][2] = new Tile(6, 0, pieceID);
                p[0][1] = new Tile(5, 0, pieceID);
                p[1][1] = new Tile(5, 1, pieceID);
                p[1][0] = new Tile(4, 1, pieceID);
                break;
            case T:
                p[0][1] = new Tile(5, 0, pieceID);
                p[1][1] = new Tile(5, 1, pieceID);
                p[1][0] = new Tile(4, 1, pieceID);
                p[1][2] = new Tile(6, 1, pieceID);
                break;
            case Z:
                p[0][0] = new Tile(4, 0, pieceID);
                p[0][1] = new Tile(5, 0, pieceID);
                p[1][1] = new Tile(5, 1, pieceID);
                p[1][2] = new Tile(6, 1, pieceID);
                break;
        }
    }
    public void goLeft(TetrisBoard board) {
        boolean valid = true;
        for (int y = 0; y < 4; y++) {
            for (int x = 0; x < 4; x++) {
                if (p[y][x] != null) {
                    if (p[y][x].goLeft(board)) {
                        valid = false;
                    }
                }
            }
        }

        if (!valid) {
            for (int y = 0; y < 4; y++) {
                for (int x = 0; x < 4; x++) {
                    if (p[y][x] != null) {
                        p[y][x].goRight(board);
                    }
                }
            }
        }
    }
    public void goRight(TetrisBoard board) {
        boolean valid = true;
        for (int y = 0; y < 4; y++) {
            for (int x = 0; x < 4; x++) {
                if (p[y][x] != null) {
                    if (p[y][x].goRight(board)) {
                        valid = false;
                    }
                }
            }
        }

        if (!valid) {
            for (int y = 0; y < 4; y++) {
                for (int x = 0; x < 4; x++) {
                    if (p[y][x] != null) {
                        p[y][x].goLeft(board);
                    }
                }
            }
        }
    }
}
