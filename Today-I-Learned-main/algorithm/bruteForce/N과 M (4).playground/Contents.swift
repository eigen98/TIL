import UIKit

//백준
//같은 수를 여러번 골라도 됨. 순서는 상관없음 조합임
//var input = readLine()?.split(separator: " ").map{Int(String($0))!}
var N = 3//input[0]
var M = 3//input[1]

var selected = [Int](repeating: 0, count: M)
var str = ""

func rec_func( _ k : Int){
    if k == M {
        str += selected.map{String($0)}.joined(separator: " ")
        str += "\n"
        return
    }else{
        
        var start = 0
        if k == 0 {
            start = 1
        }else{
            start = selected[ k - 1]
        }
        
        for cand in (start)...N{
            selected[k] = cand
            rec_func(k + 1)
            selected[k] = cand
        }
        
    }
}

rec_func(0)

str = String(str.dropLast(1))
print(str)
