public class TetrisBoard {

    private Tile[][] board;

    public TetrisBoard() {
        board = new Tile[22][10];
    }

    public Tile[][] getBoard() {
        return board;
    }

    public Tile getTile(int x, int y) {
        return board[y][x];
    }

    public void addTile(int x, int y, Tile t) {
        board[y][x] = t;
    }
}
