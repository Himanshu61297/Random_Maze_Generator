import Foundation

class Random_Prim {
    var grid: [[String]]
    var startCell: (Int, Int)

    init(grid: [[String]], start: (Int, Int)) {
        self.grid = grid
        self.startCell = start
    }

    func start() {
        let pHelper = Prim_Helper()
        let shared = Shared()

        var adjCells = [(Int, Int)]()
        adjCells.append(startCell)

        while adjCells.count > 0 {
            let rand = Int.random(in: 0..<adjCells.count)
            let cell = adjCells[rand]

            grid[cell.0][cell.1] = "   "

            let (notVisitedAdjCells, visitedAdjCells)  = pHelper.getAdjCells(cell: cell, grid: grid)

            for item in notVisitedAdjCells {
                if !adjCells.contains(where: { $0.0 == item.0 && $0.1 == item.1 }) {
                    adjCells.append(item)
                }
            }

            if visitedAdjCells.count > 0 {
                grid = pHelper.removeWallsBetween(current: cell, neighbour: visitedAdjCells.randomElement()!, grid: grid) 
                shared.printGrid(grid: grid)
            }          
            
            adjCells.remove(at: rand)
        }
    }
}