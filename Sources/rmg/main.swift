import Foundation
import Swift

//SIZE OF GRID
let row = 51
let col = 51

let helper = Helper()
var grid = helper.createGridOf(row: row, col: col)

var ch = "0"
repeat {
    let rdfs = Random_DFS(grid: grid, start: (1,1))
    rdfs.startAlgo()

    print("\n\nPress [Enter] to generate a new maze!")
    ch = readLine() ?? "0"
} while ch == ""
