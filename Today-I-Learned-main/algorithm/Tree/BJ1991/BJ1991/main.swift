//
//  main.swift
//  BJ1991
//
//  Created by JeongMin Ko on 2022/12/11.
//
/*\
 
 
 입력
 첫째 줄에는 이진 트리의 노드의 개수 N(1 ≤ N ≤ 26)이 주어진다. 둘째 줄부터 N개의 줄에 걸쳐 각 노드와 그의 왼쪽 자식 노드, 오른쪽 자식 노드가 주어진다. 노드의 이름은 A부터 차례대로 알파벳 대문자로 매겨지며, 항상 A가 루트 노드가 된다. 자식 노드가 없는 경우에는 .으로 표현한다.

 출력
 첫째 줄에 전위 순회, 둘째 줄에 중위 순회, 셋째 줄에 후위 순회한 결과를 출력한다. 각 줄에 N개의 알파벳을 공백 없이 출력하면 된다.
 
 7
 A B C
 B D .
 C E F
 E . .
 F . G
 D . .
 G . .
 전위 순회한 결과 : ABDCEFG // (루트) (왼쪽 자식) (오른쪽 자식)
 중위 순회한 결과 : DBAECFG // (왼쪽 자식) (루트) (오른쪽 자식)
 후위 순회한 결과 : DBEGFCA // (왼쪽 자식) (오른쪽 자식) (루트)
 
 */
import Foundation

func solution(){
    var N = Int(readLine()!)!
    var adjList = [String : [String]]()//[[String]](repeating: [String](), count: N)
  
    var firstAns = ""
    var secondAns = ""
    var thirdAns = ""
    
    //입력
    for i in 1...N{
        var input = readLine()!.split(separator: " ").map{ String($0)}
        adjList[input[0]] = [String]()
        
        adjList[input[0]]!.append(input[1])
       
        adjList[input[0]]!.append(input[2])
        
    }
    
    func dfs(start : String , par : String){
        if start == "."{
            return
        }
        firstAns += start
        dfs(start: adjList[start]![0], par: start)
        secondAns += start
        dfs(start: adjList[start]![1], par: start)
        thirdAns += start
    }
    
    dfs(start: "A", par: "")
    
    print(firstAns)
    print(secondAns)
    print(thirdAns)
    
}

solution()
