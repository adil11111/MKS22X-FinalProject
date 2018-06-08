public class Tile {

    private int c;
    private int x;
    private int y;
    
    public Tile(int nx, int ny, int ncolor) {
        c = ncolor;
        x = nx;
        y = ny;
    }
    public Tile(int nx, int ny) {
        this(nx, ny, (int) (Math.random()*7));
    }
    
    boolean drop(TetrisBoard board) {
        y++;
        return y >= 22 || board.getTile(x, y) != null; // true means locked in place
    }

    boolean lift(TetrisBoard board) {
        y--;
        board.addTile(x, y, this);
        return y <= 2; //piece is above screen and game is over
    }

    public boolean goLeft(TetrisBoard board) {
        x--;
        return x < 0 || board.getTile(x, y) != null;
    }

    public boolean goRight(TetrisBoard board) {
        x++;
        return x >= 10 || board.getTile(x, y) != null;
    }
    public void move(int dx, int dy) {
        x += dx;
        y += dy;
    }    
    
    public int getColor() {
        return c;
    }
    
    public int getX() {
        return x;
    }

    public int getY() {
        return y;
    }
}
