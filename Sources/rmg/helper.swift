import Foundation

class Helper {
    let wall: String = "[]"

    //For the calculation of 4 neighbours
    let checksList: [(Int, Int)]

    init(){
        checksList = [( -3, 0), ( 0, -3), ( 0,  3), ( 3,  0)]
    }
    func createGridOf(row: Int, col: Int) -> [[String]] {
        return Array(repeating: Array(repeating: wall, count: col), count: row)
    }

    func printGrid(grid: [[String]]){
        
        print("\u{001B}[H \u{001B}[J") //Clear screen on terminal
        for i in 0..<grid.count {
            for j in 0..<grid[0].count {
                if j == 0 {
                    print("\n\(grid[i][j])", terminator: "")            
                }else {
                    print("\(grid[i][j])", terminator: "")  
                }         
            }        
        }

    }

    func removeWallsBetween(current: (Int, Int), neighbour: (Int, Int), grid: [[String]]) -> [[String]] {
        
        var newGrid = grid

        if (current.0 - neighbour.0) > 0 {
            var i = neighbour.0
            let j = neighbour.1
            for _ in 0..<2 {
                i += 1
                if i >= 0 && j >= 0 && i < grid.count && j < grid[0].count { //Checking for the out of bounds of the array
                    newGrid[i][j] = "  "                              
                }
            }

        }else if (current.0 - neighbour.0) < 0 {
            var i = neighbour.0
            let j = neighbour.1
            for _ in 0..<2 {
                i -= 1
                if i >= 0 && j >= 0 && i < grid.count && j < grid[0].count { //Checking for the out of bounds of the array
                    newGrid[i][j] = "  "                              
                }
            }
        }

        if (current.1 - neighbour.1) > 0 {
            let i = neighbour.0
            var j = neighbour.1
            for _ in 0..<2 {
                j += 1
                if i >= 0 && j >= 0 && i < grid.count && j < grid[0].count { //Checking for the out of bounds of the array
                    newGrid[i][j] = "  "                              
                }
            }

        }else if (current.1 - neighbour.1) < 0 {
            let i = neighbour.0
            var j = neighbour.1
            for _ in 0..<2 {
                j -= 1
                if i >= 0 && j >= 0 && i < grid.count && j < grid[0].count { //Checking for the out of bounds of the array
                    newGrid[i][j] = "  "                              
                }
            }
        }

        return newGrid
    }

    func getNeighboursOf(pos: (Int, Int), grid: [[String]]) -> [(Int, Int)] {

        var neighbours = [(Int, Int)]()     
        
        for check in checksList {
            let i = check.0 + pos.0
            let j = check.1 + pos.1

            if i >= 0 && j >= 0 && i < grid.count && j < grid[0].count //Checking for the out of bounds of the array
            {
                if grid[i][j] != "  " {
                    neighbours.append((i,j))
                }           
            }
        }

        //print("Neighbours: \(neighbours.count)")
        return neighbours
    }    
}