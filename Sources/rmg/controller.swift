import Foundation

class Controller {

    private let row: Int
    private let col: Int
    private let shared: Shared
    private var grid: [[String]]

    init(row: Int, col: Int){
        self.row = row
        self.col = col
        self.shared = Shared()
        self.grid = [[String]]()       
    }

    func random_Iterative_DFS(){
        grid = shared.createGridOf(row: row, col: col)

        let rdfs = Random_DFS(grid: grid, start: (1,1))
        rdfs.start()
    }
}