import d3nLine from "d3node-linechart";
import output from "d3node-output";

import { PopulationStats } from "prey-predator-js";

export default async function generatePlot(
  population: PopulationStats,
  path: string,
  options: {
    title: string;
    width?: number;
    height?: number;
    lineColors?: [string, string];
  } = { title: "test" }
): Promise<void> {
  const title = options.title;
  const width = options.width || 820;
  const height = options.height || 570;
  const lineColors = options.lineColors || ["steelblue", "darkorange"];

  const preys = population.map((state: [number, number], idx: number) => ({
    key: idx,
    value: state[0]
  }));

  const predators = population.map((state: [number, number], idx: number) => ({
    key: idx,
    value: state[1]
  }));

  const data: any = [preys, predators];

  data.allKeys = Array.from(new Array(population.length).keys());

  return output(
    path,
    d3nLine({
      data: data,
      container: `<div id="container"><h2>${title}</h2><div id="chart" /></div>`,
      lineColors,
      width,
      height
    })
  );
}
