import Swift
import Foundation

class Random_DFS {
    private var grid: [[String]]
    private var stack: [(Int, Int)]  
    private let startCell: (Int, Int)

    init(grid: [[String]], start: (Int, Int)){
        self.grid = grid
        self.startCell = start
        self.stack = [(Int, Int)]()
    }

    func start() {
        let helper = Helper()
        let shared = Shared()

        grid[startCell.0][startCell.1] = "   "
        stack.append(startCell)

        while stack.count > 0 {
            let current = stack.popLast()!
            let neighbours = helper.getNeighboursOf(pos: current, grid: grid)

            if(neighbours.count > 0){
                stack.append(current)

                let rand = Int.random(in: 0..<neighbours.count)
                let randCell = neighbours[rand]
                grid = helper.removeWallsBetween(current: current, neighbour: randCell, grid: grid)
                
                grid[randCell.0][randCell.1] = "   "
                stack.append(randCell)

                shared.printGrid(grid: grid)
            }            
        }
    }    
}