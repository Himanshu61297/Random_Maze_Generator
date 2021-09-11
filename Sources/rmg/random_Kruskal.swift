import Foundation

class Random_Kruskal {

    private var sets: [[(Int,Int)]]
    private var grid: [[String]]
    private var index: Int

    init(grid: [[String]]) {
        self.grid = grid
        self.sets = [[(Int,Int)]]()
        self.index = 0
    }

    func start(){
        let kHelper = Kruskal_Helper()
        let cellsAndWalls = kHelper.getValidCellsAndWalls(grid: grid)
        let allCells = cellsAndWalls.0
        var allWalls = cellsAndWalls.1

        while allWalls.count > 0 {
            let rand = Int.random(in: 0..<allWalls.count)
            let wall = allWalls[rand]
            let cells = kHelper.getCells(wall: wall, grid: grid)
            let cellA = cells[0]
            let cellB = cells[1]

            let shared = Shared()            
          
            if grid[cellA.0][cellA.1] == shared.wall && grid[cellB.0][cellB.1] == shared.wall {
                
                var str = String(index)
        
                grid[cellA.0][cellA.1] = str
                grid[cellB.0][cellB.1] = str   

                grid[wall.0][wall.1] = "   "  

                sets.append(cells)
                index += 1
            }
            else if grid[cellA.0][cellA.1] != grid[cellB.0][cellB.1] && grid[cellA.0][cellA.1] != shared.wall && grid[cellB.0][cellB.1] != shared.wall{
                var valA: Int = Int(grid[cellA.0][cellA.1]) ?? -1
                var valB: Int = Int(grid[cellB.0][cellB.1]) ?? -1    

                print("A: \(valA), B: \(valB)")          

                if valA >= 0 && valB >= 0 && valA < sets.count && valB < sets.count {
                    if valA < valB {
                        sets[valA].append(contentsOf: sets[valB]) 
                        for (i,j) in sets[valB] {
                            grid[i][i] = String(valA)
                        }
                    }
                    else {
                        sets[valB].append(contentsOf: sets[valA])
                        for (i, j) in sets[valA] {
                            grid[i][j] = String(valB)
                        }
                    }

                    grid[wall.0][wall.1] = "   " 
                }
            } else if grid[cellA.0][cellA.1] == shared.wall && grid[cellB.0][cellB.1] != shared.wall {
                var valB: Int = Int(grid[cellB.0][cellB.1]) ?? -1  
                 print("B: \(valB)")  
                if valB >= 0 && valB < sets.count {
                    sets[valB].append(cellA)
                    grid[cellA.0][cellA.1] = String(valB)
                    grid[wall.0][wall.1] = "   " 
                }



            } else if grid[cellA.0][cellA.1] != shared.wall && grid[cellB.0][cellB.1] == shared.wall {
                var valA: Int = Int(grid[cellA.0][cellA.1]) ?? -1  
                 print("A: \(valA)")  
                if valA >= 0 && valA < sets.count {
                    sets[valA].append(cellB)
                    grid[cellB.0][cellB.1] = String(valA)
                    grid[wall.0][wall.1] = "   " 
                }
            }            
            
            allWalls.remove(at: rand)                        

            shared.printGrid(grid: grid)
            //print("\ncount: \(allWalls.count)")
            //Thread.sleep(forTimeInterval: 2)
        }
    }    
}