import Foundation

class Prim_Helper {

    func getAdjCells(cell: (Int, Int), grid: [[String]]) -> ([(Int, Int)], [(Int, Int)]){
        let dHelper = Helper()
        let notVisitedNeighbours = dHelper.getNeighboursOf(pos: cell, grid: grid, notVisited: true)
        let visitedNeighbours = dHelper.getNeighboursOf(pos: cell, grid: grid, notVisited: false)
        return (notVisitedNeighbours, visitedNeighbours)
    }

    func removeWallsBetween(current: (Int, Int), neighbour: (Int, Int), grid: [[String]]) -> [[String]] {
        let dHelper = Helper()
        let newGrid = dHelper.removeWallsBetween(current: current, neighbour: neighbour, grid: grid)
        return newGrid
    }
    
}