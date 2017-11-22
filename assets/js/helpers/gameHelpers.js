export const calculateNumberOfMoves = (board) => {
  // Takes in a board
  // Find all spots that are not empty. This is the amount of turns that have already been taken.
  return Object.values(board).filter(spotValue => spotValue !== '').length;
}