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
        grid = shared.createGridOf(row: row, col: col)       
    }

    func random_Iterative_DFS(){
        let rdfs = Random_DFS(grid: grid, start: (1,1))
        rdfs.start()
    }

    func random_kruskal() {
        let rka = Random_Kruskal(grid: grid)
        rka.start()
    }

    func random_Prim(){
        let rpa = Random_Prim(grid: grid, start: (1,1))
        rpa.start()
    }
}