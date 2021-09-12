import Foundation

class Random_Kruskal {

    private var grid: [[String]]

    init(grid: [[String]]) {
        self.grid = grid
    }

    func start(){
       
        let kHelper = Kruskal_Helper()
        let shared = Shared()  

        var sets = [[(Int,Int)]]()
        var index = 0

        var (allCells, allWalls) = kHelper.getValidCellsAndWalls(grid: grid)

        while allWalls.count > 0 {

            let rand = Int.random(in: 0..<allWalls.count)
            let wall = allWalls[rand]
            
            let cells = kHelper.getCells(wall: wall, grid: grid)
            let cellA = cells[0]
            let cellB = cells[1]                     
          
            if grid[cellA.0][cellA.1] == shared.wall && grid[cellB.0][cellB.1] == shared.wall {  

                grid[cellA.0][cellA.1] = String(index)
                grid[cellB.0][cellB.1] = String(index) 
                grid[wall.0][wall.1] = "   "

                sets.append(cells)
                index += 1
            }
            else if grid[cellA.0][cellA.1] != grid[cellB.0][cellB.1] && grid[cellA.0][cellA.1] != shared.wall && grid[cellB.0][cellB.1] != shared.wall{
                
                let valA: Int = Int(grid[cellA.0][cellA.1]) ?? -1
                let valB: Int = Int(grid[cellB.0][cellB.1]) ?? -1    

                (grid, sets) = kHelper.mergeSets(valA: valA, valB: valB, sets: sets, grid: grid)   

                grid[wall.0][wall.1] = "   " 
            }
            else if grid[cellA.0][cellA.1] == shared.wall && grid[cellB.0][cellB.1] != shared.wall {  

                let valB: Int = Int(grid[cellB.0][cellB.1]) ?? -1  

                if valB >= 0 && valB < sets.count {
                    sets[valB].append(cellA)
                    grid[cellA.0][cellA.1] = String(valB)
                    grid[wall.0][wall.1] = "   " 
                }
            } 
            else if grid[cellA.0][cellA.1] != shared.wall && grid[cellB.0][cellB.1] == shared.wall {

                let valA: Int = Int(grid[cellA.0][cellA.1]) ?? -1 

                if valA >= 0 && valA < sets.count {
                    sets[valA].append(cellB)
                    grid[cellB.0][cellB.1] = String(valA)
                    grid[wall.0][wall.1] = "   " 
                }
            }             
            allWalls.remove(at: rand) 
            shared.printGrid(grid: grid)
        }
    }    
}