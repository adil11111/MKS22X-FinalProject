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
        public int checkCompletions() {
        int numCompleted = 0;
        for (int y = 2; y < 22; y++) {
            if (checkRow(y)) {
                numCompleted++;
                shiftBoard(y);
            }
        }

        if (!emptyRow(1)) {
            return -1;
        }

        if (numCompleted == 0) {
            return 0;
        }
        return 1000 * (int) Math.pow(2, numCompleted - 1);
    }

    private boolean checkRow(int rowNum) {
        for (int x = 0; x < 10; x++) {
            if (board[rowNum][x] == null) {
                return false;
            }
        }
        return true;
    }

    private boolean emptyRow(int rowNum) {
        for (int x = 0; x < 10; x++) {
            if (board[rowNum][x] != null) {
                return false;
            }
        }
        return true;
    }
}
