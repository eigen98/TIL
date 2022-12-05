import UIKit
//백준 
//var input = readLine()!.split(separator: " ")
var N = 3 //Int(input[0]) ?? 0
var M = 3 //Int(input[1]) ?? 0
var selected = [Int](repeating: 0, count: M ) // 0...0 M개
var str = ""
//N개중 M개 고르기 K번째 숫자 선택
func rec_func(_ k : Int){
    if k == M  {
        
        
        str += selected.map{String($0)}.joined(separator: " ")
        
        str += "\n"
        
        return
    }else{
        for cand in 1...N{
            selected[k] = cand
            rec_func(k + 1)
            selected[k] = 0
        }
    }
}

rec_func(0)
str = String(str.dropLast(1))
print("\(str)")
