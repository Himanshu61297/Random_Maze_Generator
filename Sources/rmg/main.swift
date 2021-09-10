import Foundation
import Swift

let row = 18
let col = 18

var stack = [(Int, Int)]()

var grid  = Array(repeating: Array(repeating: "* ", count: col), count: row)
var cells = [(Int, Int)]()

//Generate Grid
for i in 0..<row {
    for j in 0..<col {
        if j == (col - 1) {
            print("\(grid[i][j])")            
        }else {
            print("\(grid[i][j])", terminator: "")  
        }         
    }        
}

for i in stride(from: 1, through: row, by: 3) {
    for j in stride(from: 1, through: col, by: 3) {
        cells.append((i,j))
    }
}


var current = (cells[0].0,cells[0].1)

// Visit

func draw(sRow: Int, sCol: Int){

    var neighbours = [(Int, Int)]()
    var checksList = [(Int, Int)]() //For calculation of 8 neighbours
    checksList.append((-3, 0)) //TOP
    checksList.append((0, -3)) //LEFT
    checksList.append((0, 3)) // RIGHT
    checksList.append((3, 0)) //BOTTOM
    
    for check in checksList {
        let x = check.0 + sRow
        let y = check.1 + sCol

        if x >= 0 && y >= 0 && x < row && y < col //Checking for the out of bounds of the array
        {
            if grid[x][y] == "* " {
                neighbours.append((x,y))
            }           
        }
    }

    grid[sRow][sCol] = "  "

    if neighbours.count > 0 {
        var rand = Int.random(in: 0..<neighbours.count)

        if (sRow - neighbours[rand].0) > 0 {
            var i = neighbours[rand].0
            var j = neighbours[rand].1
            for _ in 0..<2 {
                i += 1
                if i >= 0 && j >= 0 && i < row && j < col { //Checking for the out of bounds of the array
                    grid[i][j] = "  "                              
                }
            }

        }else if (sRow - neighbours[rand].0) < 0 {
            var i = neighbours[rand].0
            var j = neighbours[rand].1
            for _ in 0..<2 {
                i -= 1
                if i >= 0 && j >= 0 && i < row && j < col { //Checking for the out of bounds of the array
                    grid[i][j] = "  "                              
                }
            }
        }

        if (sCol - neighbours[rand].1) > 0 {
            var i = neighbours[rand].0
            var j = neighbours[rand].1
            for _ in 0..<2 {
                j += 1
                if i >= 0 && j >= 0 && i < row && j < col { //Checking for the out of bounds of the array
                    grid[i][j] = "  "                              
                }
            }

        }else if (sCol - neighbours[rand].1) < 0 {
            var i = neighbours[rand].0
            var j = neighbours[rand].1
            for _ in 0..<2 {
                j -= 1
                if i >= 0 && j >= 0 && i < row && j < col { //Checking for the out of bounds of the array
                    grid[i][j] = "  "                              
                }
            }
        }


        
        current = (sRow,sCol)
        stack.append(current)

        //Generate Grid
        for i in 0..<row {
            for j in 0..<col {
                if j == (col - 1) {
                    print("\(grid[i][j])")            
                }else {
                    print("\(grid[i][j])", terminator: "")  
                }         
            }        
        }

        print("\(current.0), \(current.1)")
        print("\(neighbours.count)")        

        draw(sRow: neighbours[rand].0, sCol: neighbours[rand].1)                        
    }
    else if(stack.count > 0) {
        var next = stack.popLast()
        current = next!
        print("\(current.0), \(current.1)")
        draw(sRow: current.0, sCol: current.1)   
    }
}

draw(sRow: current.0, sCol: current.1)

//Generate Grid
for i in 0..<row {
    for j in 0..<col {
        if j == (col - 1) {
            print("\(grid[i][j])")            
        }else {
            print("\(grid[i][j])", terminator: "")  
        }         
    }        
}

