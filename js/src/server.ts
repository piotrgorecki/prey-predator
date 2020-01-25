import { Board, Cell, PopulationStats } from "prey-predator-js";

import generatePlot from "./generatePlot";
import { makeEmptyBoard, populateBoard } from "./Board";

const BOARD_SIZE = 56;
const PREYS_COUNT = 60;
const PREDATORS_COUNT = 30;
const ITERATIONS = 60;

function interact(board: Board): [number, number] {
  let preys = 0;
  let predators = 0;

  board.forEach(cell => {
    switch (cell) {
      case Cell.prey:
        preys += 2;
        break;
      case Cell.twoPreys:
        preys += 2;
        break;
      case Cell.preyAndPredator:
        predators += 2;
      default:
        break;
    }
  });

  return [preys, predators];
}

async function main(): Promise<void> {
  let populations: PopulationStats = [];

  console.time(`${ITERATIONS} iterations took`);
  let emptyBoard = makeEmptyBoard(BOARD_SIZE);
  let populatedBoard = populateBoard(emptyBoard, PREYS_COUNT, PREDATORS_COUNT);

  for (let i = 0; i < ITERATIONS; i++) {
    const [preys, predators] = interact(populatedBoard);

    populations = [...populations, [preys, predators]];

    emptyBoard = makeEmptyBoard(BOARD_SIZE);
    populatedBoard = populateBoard(emptyBoard, preys, predators);
  }
  console.timeEnd(`${ITERATIONS} iterations took`);

  generatePlot(populations, "./prey_predator", {
    title: "Simple prey predator - cellular automaton",
    width: 820,
    height: 570
  });
}

Promise.all([main()]);
