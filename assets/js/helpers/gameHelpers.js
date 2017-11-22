// Takes a board as only argument, returns number of moves that have already occurred.
export const calculateNumberOfMoves = (board) => {
  return Object.values(board).filter(spotValue => spotValue !== '').length;
}

// Returns the number of possible moves for a board. 
export const calculateTotalPossibleMoves = (board) => {
  return Object.values(board).length;
}

export const gameIsOver = (board) => {
  return calculateNumberOfMoves(board) === calculateTotalPossibleMoves(board);
}