import UIKit

//var input = readLine()!.split(separator: " ")
var N = 4
var M = 2
var visited = [Bool](repeating: false, count: N + 1)
var selected = [Int](repeating: 0, count: M )
var str = ""


func rec_func(_ k : Int){
    if k == M {
        str += selected.map{ String($0)}.joined(separator: " ")
        str += "\n"
        return
        
    }else{
       
        
        var preNum = 0
        if k == 0 {
            preNum = 1
        }else{
            preNum = selected[k - 1]
        }
        for cand in (preNum)...N{
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
str = String(str.dropLast(1))
print(str)

