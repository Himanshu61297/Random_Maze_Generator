import Foundation

class Kruskal_Helper {

    func getValidCellsAndWalls(grid: [[String]]) -> ([(Int, Int)],[(Int, Int)]) {
        var validCells = [(Int, Int)]()
        var validWalls = [(Int, Int)]()
        for i in 0..<grid.count {
            for j in 0..<grid[0].count {
                if i%2 != 0 && j%2 != 0 && j != 0 && j != (grid[0].count - 1) {
                    validCells.append((i,j))
                }
                else if i%2 != 0 && j%2 == 0 && j != 0 && j != (grid[0].count - 1){
                    validWalls.append((i,j))
                }
                else if i%2 == 0 && j%2 != 0 && i != 0 && i != (grid.count - 1) {
                    validWalls.append((i,j))
                }
            }
        }

        return (validCells, validWalls)
    }

    func getCells(wall: (Int, Int), grid: [[String]]) -> [(Int, Int)]{
        var cells = [(Int, Int)]()
        
        //Top-down cells
        if wall.0%2 == 0 {
            cells.append(((wall.0 - 1), wall.1)) //Top Cell
            cells.append(((wall.0 + 1), wall.1)) //Bottom Cell
        }
        //left-right cells
        else if wall.1%2 == 0 {
            cells.append((wall.0, (wall.1 - 1))) //Left
            cells.append((wall.0, (wall.1 + 1))) //Right
        }

        return cells
    }  

    func mergeSets(valA: Int, valB: Int, sets: [[(Int, Int)]], grid: [[String]]) -> ([[String]], [[(Int, Int)]]){
        
        var newGrid = grid
        var newSet = sets
        
        if valA < valB {
        newSet[valA].append(contentsOf: newSet[valB]) 
        for (i,j) in newSet[valB] {
            newGrid[i][j] = String(valA)
        }
        }
        else {
            newSet[valB].append(contentsOf: newSet[valA])
            for (i, j) in newSet[valA] {
                newGrid[i][j] = String(valB)
            }
        }

        return (newGrid, newSet)  
   }  

}