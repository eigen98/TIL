//
//  main.swift
//  BJ2800
//
//  Created by JeongMin Ko on 2023/05/15.
//
/*
 문제
 어떤 수식이 주어졌을 때, 괄호를 제거해서 나올 수 있는 서로 다른 식의 개수를 계산하는 프로그램을 작성하시오.

 이 수식은 괄호가 올바르게 쳐져 있다. 예를 들면, 1+2, (3+4), (3+4*(5+6))와 같은 식은 괄호가 서로 쌍이 맞으므로 올바른 식이다.

 하지만, 1+(2*3, ((2+3)*4 와 같은 식은 쌍이 맞지 않는 괄호가 있으므로 올바른 식이 아니다.

 괄호를 제거할 때는, 항상 쌍이 되는 괄호끼리 제거해야 한다.

 예를들어 (2+(2*2)+2)에서 괄호를 제거하면, (2+2*2+2), 2+(2*2)+2, 2+2*2+2를 만들 수 있다. 하지만, (2+2*2)+2와 2+(2*2+2)는 만들 수 없다. 그 이유는 쌍이 되지 않는 괄호를 제거했기 때문이다.

 어떤 식을 여러 쌍의 괄호가 감쌀 수 있다.

 입력
 첫째 줄에 음이 아닌 정수로 이루어진 수식이 주어진다. 이 수식은 괄호가 올바르게 쳐져있다. 숫자, '+', '*', '-', '/', '(', ')'로만 이루어져 있다. 수식의 길이는 최대 200이고, 괄호 쌍은 적어도 1개, 많아야 10개이다.

 출력
 올바른 괄호 쌍을 제거해서 나올 수 있는 서로 다른 식을 사전 순으로 출력한다.

 예제 입력 1
 (0/(0))
 예제 출력 1
 (0/0)
 0/(0)
 0/0
 예제 입력 2
 (2+(2*2)+2)
 예제 출력 2
 (2+2*2+2)
 2+(2*2)+2
 2+2*2+2
 예제 입력 3
 (1+(2*(3+4)))
 예제 출력 3
 (1+(2*3+4))
 (1+2*(3+4))
 (1+2*3+4)
 1+(2*(3+4))
 1+(2*3+4)
 1+2*(3+4)
 1+2*3+4
 */

import Foundation

var resultList = [String]()
var openStack = [Int]()
var closeStack = [Int]()
var inputStr = [String]()
var resultSet = Set<String>()
func solution(){
    var input = readLine()!.map{ String($0) }
    inputStr = input
    for idx in 0..<input.count{
        if input[idx] == "("{
            openStack.append(idx)
        }
        if input[idx] == ")"{
            closeStack.append(idx)
        }
    }
    closeStack.reverse()
    dfs(idx: 0, strArr: inputStr)
    resultList = Array(resultSet)
    //resultList.removeLast()
    resultList.sort()
    for str in resultList{
        print(str)
    }
   
}

func dfs(idx : Int, strArr : [String]){
    if idx >= openStack.count{
        var result = strArr.joined()
        if result.count != inputStr.count{
            resultSet.insert(result)
            //resultList.append(result)
        }
        return
    }
    
    var openIdx = openStack[idx]
    var closeIdx = closeStack[idx]
    var removedArr = strArr
    removedArr[openIdx] = ""
    removedArr[closeIdx] = ""
    //포함 시킬지 안 시킬지
    dfs(idx: idx + 1, strArr: removedArr)
    dfs(idx: idx + 1, strArr: strArr)
}


solution()
