import UIKit

//var input = readLine()!.split(separator: " ")
var N = 4
var M = 2
var selected = [Int](repeating: 0, count: M)
var visited = [Bool](repeating: false, count: N + 1)

var str = ""


func rec_func(_ k : Int){
    if k == M {
        str += selected.map{String($0)}.joined(separator: " ")
        str += "\n"
        return
    }else{
        for cand in 1...N{
            if !visited[cand] {
                visited[cand] = true
                selected[k] = cand
                rec_func(k + 1)
                
                visited[cand] = false
                selected[k] = 0
            }
            
        }
    }
}

rec_func(0)
str = str.dropLast(1)
print(str)
