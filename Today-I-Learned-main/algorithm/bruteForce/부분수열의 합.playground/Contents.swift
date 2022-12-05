import UIKit
//N개의 정수로 이루어진 수열이 있을 때, 크기가 양수인 부분수열 중에서
//그 수열의 원소를 다 더한 값이 S가 되는 경우의 수를 구하는 프로그램을 작성하시오

//var input1 = readLine()!.split(separator: " ")
//var input2 = readLine()!.split(separator: " ")
var N = 5 //배열 개수
var S = 0 //다 더한 수 결과 정수

var count = 0

var arr = [Int]()
var selected = [Bool](repeating: false, count: N)
var calResult = 0
arr = [-7, -3, -2, 5, 8]

//k + 1 번째 원소 더하기
func rec_func(_ k : Int){
    if k == N {
        
        return
    }else{

        for cand in k..<N{
            var num = arr[cand]
            if !selected[cand]{
                selected[cand] = true
                calResult += num
                print("calResult : \(calResult)")
                if calResult == S{
                    print("count 증가 : \(calResult)")
                    count += 1
                }
                rec_func(k + 1)
                selected[cand] = false
                calResult -= num
                
            }
            
        }
        
    }
}
rec_func(0)
print(count)
