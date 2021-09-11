import Foundation

class Shared {
    let wall: String = "[@]"   

    //
    func createGridOf(row: Int, col: Int) -> [[String]] {
        return Array(repeating: Array(repeating: wall, count: col), count: row)
    }

    //
    func printGrid(grid: [[String]]){
        print("\u{001B}[H \u{001B}[J") //Clear screen on terminal
        for i in 0..<grid.count {
            for j in 0..<grid[0].count {
                if j == 0 {
                    if grid[i][j] != wall && grid[i][j] != "   " {
                        print("\n   ", terminator: "")
                    }else {
                        print("\n\(grid[i][j])", terminator: "")
                    }
                                
                }else {
                    if grid[i][j] != wall && grid[i][j] != "   " {
                        print("   ", terminator: "")
                    }else {
                        print("\(grid[i][j])", terminator: "")
                    }
                }         
            }        
        }
    } 

    //
    func removeItemsBetween(pos: (Int, Int), thickness: Int, grid: [[String]], isRowDiff: Bool, isDiffPositive: Bool) -> [[String]]{
        var i = pos.0
        var j = pos.1
        var newGrid = grid

        for _ in 0..<(thickness - 1) {
            if isRowDiff && isDiffPositive {
                i += 1
            }else if isRowDiff && !isDiffPositive {
                i -= 1
            } else if !isRowDiff && isDiffPositive {
                j += 1
            }else if !isRowDiff && !isDiffPositive {
                j -= 1
            }
            
            //Checking for the out of bounds of the array
            if i >= 0 && j >= 0 && i < grid.count && j < grid[0].count {
                newGrid[i][j] = "   "                              
            }
        }
        return newGrid
    }   
}