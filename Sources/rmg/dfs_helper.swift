import Foundation

class Helper {  

    //
    func removeWallsBetween(current: (Int, Int), neighbour: (Int, Int), grid: [[String]]) -> [[String]] {        
        var newGrid = grid

        let i = neighbour.0
        let j = neighbour.1

        let shared = Shared()

        if (current.0 - neighbour.0) > 0 {           
            newGrid = shared.removeItemsBetween(pos: (i, j), thickness: 2, grid: newGrid, isRowDiff: true, isDiffPositive: true)

        }else if (current.0 - neighbour.0) < 0 {
            newGrid = shared.removeItemsBetween(pos: (i, j), thickness: 2, grid: newGrid, isRowDiff: true, isDiffPositive: false)
        }

        if (current.1 - neighbour.1) > 0 {
            newGrid = shared.removeItemsBetween(pos: (i, j), thickness: 2, grid: newGrid, isRowDiff: false, isDiffPositive: true)

        }else if (current.1 - neighbour.1) < 0 {
            newGrid = shared.removeItemsBetween(pos: (i, j), thickness: 2, grid: newGrid, isRowDiff: false, isDiffPositive: false)
        }

        return newGrid
    }

    //
    func getNeighboursOf(pos: (Int, Int), grid: [[String]], notVisited: Bool = true) -> [(Int, Int)] {
        var neighbours = [(Int, Int)]()  
        
        //For the calculation of 4 neighbours
        let checksList = [( -2, 0), ( 0, -2), ( 0,  2), ( 2,  0)]   
        
        for check in checksList {
            let i = check.0 + pos.0
            let j = check.1 + pos.1
            
            //Checking for the out of bounds of the array
            if i >= 0 && j >= 0 && i < grid.count && j < grid[0].count 
            {
                if grid[i][j] != "   "  && notVisited == true {
                    neighbours.append((i,j))
                } else if grid[i][j] == "   "  && notVisited == false {
                    neighbours.append((i,j))
                }          
            }
        }
        return neighbours
    }    
}