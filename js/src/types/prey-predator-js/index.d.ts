declare module "prey-predator-js" {
  export type PopulationStats = Array<[number, number]>; // 0: prey, 1: predator

  export const enum Cell {
    empty = 0,
    prey = 1,
    predator = 2,
    twoPreys = 7,
    twoPredators = 8,
    preyAndPredator = 9
  }

  export type Board = Array<Cell>;
}
