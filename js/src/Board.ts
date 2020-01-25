import { Board, Cell } from "prey-predator-js";

import { getRandomInt } from "./helpers";

/**
 * by default, a board is two-dimension surface, but in this particular case, the simple list is enough.
 */
export function makeEmptyBoard(size: number): Board {
  const board = [];
  for (let i = 0; i < size; i++) {
    board[i] = Cell.empty;
  }

  return board;
}

function getRandomNotFullCell(board: Board): [number, Cell] {
  const size = board.length;
  let i, cell;

  do {
    i = getRandomInt(0, size);
    cell = board[i];
  } while (cell > 2);

  return [i, cell];
}

export function populateBoard(
  board: Board,
  preys: number,
  predators: number
): Board {
  for (let prey = 0; prey < preys; prey++) {
    const [i, cell] = getRandomNotFullCell(board);

    if (cell === Cell.empty) board[i] = Cell.prey;
    else if (cell === Cell.prey) board[i] = Cell.twoPreys;
  }

  for (let predator = 0; predator < predators; predator++) {
    const [j, cell] = getRandomNotFullCell(board);

    if (cell === Cell.empty) board[j] = Cell.predator;
    else if (cell === Cell.predator) board[j] = Cell.twoPredators;
    else if (cell === Cell.prey) board[j] = Cell.preyAndPredator;
  }

  return board;
}
