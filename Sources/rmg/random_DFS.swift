import Swift
import Foundation

class Random_DFS {
    private var grid: [[String]]
    private var stack: [(Int, Int)]  
    private let start: (Int, Int)

    init(grid: [[String]], start: (Int, Int)){
        self.grid = grid
        self.start = start
        self.stack = [(Int, Int)]()
    }

    func startAlgo() {
        let helper = Helper()

        grid[start.0][start.1] = "  "
        stack.append(start)

        while stack.count > 0 {
            let current = stack.popLast()!
            let neighbours = helper.getNeighboursOf(pos: current, grid: grid)

            if(neighbours.count > 0){

                stack.append(current)

                var rand = Int.random(in: 0..<neighbours.count)
                let randCell = neighbours[rand]
                grid = helper.removeWallsBetween(current: current, neighbour: randCell, grid: grid)
                
                grid[randCell.0][randCell.1] = "  "
                stack.append(randCell)

                helper.printGrid(grid: grid)
                //Thread.sleep(forTimeInterval: 1) // delay in sec
            }            
        }

        //helper.printGrid(grid: grid)

    }    
}