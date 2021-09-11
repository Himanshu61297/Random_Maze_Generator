import Foundation
import Swift

let row = 30
let col = 90

let helper = Helper()
var grid = helper.createGridOf(row: row, col: col)

var ch = "0"
repeat {
    let rdfs = Random_DFS(grid: grid, start: (1,1))
    rdfs.startAlgo()

    print("")
    ch = readLine() ?? "0"
} while ch == ""
