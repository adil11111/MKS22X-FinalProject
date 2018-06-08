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
    
    public boolean drop(TetrisBoard board) {
        y++;
        if (y >= 22 || board.getTile(x, y) != null) {
            y--;
            board.addTile(x, y, this);
            return true; // true means locked in place
        }
        return false;
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
