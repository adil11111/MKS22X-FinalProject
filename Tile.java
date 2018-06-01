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
}
