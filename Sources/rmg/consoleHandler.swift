import Foundation

class Handler {

    private let controller: Controller

    init(row: Int, col: Int){
        self.controller = Controller(row: row, col: col)
    }

    func homePage(){
        print("\n[#][#] MAZE GENERATION ALGORITHMS VISUALIZER[#][#]")
        print("1. Randomize Itrative Depth First Search")
        print("...more to come :)")        
        setAlgo(readLine() ?? "0")        
    }

    private func setAlgo(_ ch: String){
        switch ch {
        case "1":
            controller.random_Iterative_DFS()
            break
            
        default:
            print("Invalid Option! <_<")
            
        }
    }
}