import Foundation

class Handler {

    private let controller: Controller

    init(row: Int, col: Int){

        self.controller = Controller(row: ((row * 2) + 1), col: ((col * 2) + 1))
    }

    func homePage(){
        print("\n[#][#] MAZE GENERATION ALGORITHMS VISUALIZER[#][#]")
        print("1. Randomized Itrative Depth First Search")
        print("2. Randomized Kruskal's Algorithm")
        print("...more to come :)")        
        setAlgo(readLine() ?? "0")        
    }

    private func setAlgo(_ ch: String){
        switch ch {
        case "1":
            controller.random_Iterative_DFS()
            break
        
        case "2":
            controller.random_kruskal()
            break
            
        default:
            print("Invalid Option! <_<")
            
        }
    }
}