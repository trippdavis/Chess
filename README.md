#Chess

This project is Chess built entirely with Ruby to be played in the terminal between two human players.

![Alt text](/images/game.png)

Each type of piece has its own class that defines the characteristics specific to that piece. Most of these piece classes inherit from a sliding piece (queen, rook, bishop) or stepping piece (knight, rook) class which defines the way the piece moves about the board. Pawn is a special case die to the complexity of its movement. The sliding piece, stepping piece, and pawn classes all inherit from a general piece class. The players can move their pieces around the board using the standard chess coordinate system where numbers represent the rows and letters the columns.

![Alt text](/images/move.png)

The game will alert the user with custom messages if the move they attempt to make is illegal and allow the user to move again.

![Alt text](/images/invalid.png)

When pieces are captured, they will be displayed next to the board.

![Alt text](/images/captured.png)

The game will not allow the user to make a move that will put them in check.

![Alt text](/images/checkmove.png)

The game checks all moves for the current player and if it can't find a valid move (one that will keep the current player out of check), it knows that the current player has lost.

![Alt text](/images/gameover.png)
