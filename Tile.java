public class Tile {

    private int color;
    private int x;
    private int y;
    
    public Tile(int nx, int ny, int ncolor) {
        color = ncolor;
        x = nx;
        y = ny;
    }
    public Tile(int nx, int ny) {
        this(nx, ny, (int) (Math.random()*7));
    }
    
    public int getColor() {
        return color;
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
}
