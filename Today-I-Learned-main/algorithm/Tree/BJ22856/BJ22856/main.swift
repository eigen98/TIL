//
//  main.swift
//  BJ22856
//
//  Created by JeongMin Ko on 2023/05/11.
//
/*
 문제
 노드가
 N개인 이진 트리가 있다. 트리를 중위 순회와 유사하게 순회하려고 한다. 이를 유사 중위 순회라고 하자.

 순회의 시작은 트리의 루트이고 순회의 끝은 중위 순회할 때 마지막 노드이다. 이때 루트 노드는 항상 1번 노드이다.

 유사 중위 순회는 루트 노드에서 시작하며, 다음과 같이 진행된다.

 현재 위치한 노드의 왼쪽 자식 노드가 존재하고 아직 방문하지 않았다면, 왼쪽 자식 노드로 이동한다.
 그렇지 않고 현재 위치한 노드의 오른쪽 자식 노드가 존재하고 아직 방문하지 않았다면, 오른쪽 자식 노드로 이동한다.
 그렇지 않고 현재 노드가 유사 중위 순회의 끝이라면, 유사 중위 순회를 종료한다.
 그렇지 않고 부모 노드가 존재한다면, 부모 노드로 이동한다.
 유사 중위 순회를 종료할 때까지 1 ~ 4를 반복한다.


 위 그림에 있는 트리에서 중위 순회를 한다면
 $4 \rightarrow 2 \rightarrow 5 \rightarrow 1 \rightarrow 6 \rightarrow 3 \rightarrow 7$ 순으로 순회를 한다.

 따라서, 유사 중위 순회의 끝은 노드 7이 된다.



 유사 중위 순회는 위 그림과 같이 루트인 노드


 여기서 이동이라는 것은 하나의 노드에서 다른 노드로 한번 움직이는 것을 의미한다. 예를 들면, 노드 1에서 노드 2로 가는 것을 한번 이동하였다고 한다.

 유사 중위 순회를 하면서 이동한 횟수를 구하려고 한다.

 입력
 첫 번째 줄에 트리를 구성하는 노드의 개수
 $N$이 주어진다.

 두 번째 줄부터
 $N + 1$ 번째 줄까지 현재 노드
 $a$, 현재 노드의 왼쪽 자식 노드
 $b$, 현재 노드의 오른쪽 자식 노드
 $c$가 공백으로 구분되어 주어진다. 만약 자식 노드의 번호가 -1인 경우 자식 노드가 없다는 것을 의미한다.

 출력
 유사 중위 순회를 하면서 이동한 총 횟수를 출력한다.


 예제 입력 1
 7
 1 2 3
 2 4 5
 3 6 7
 4 -1 -1
 5 -1 -1
 6 -1 -1
 7 -1 -1
 
 예제 출력 1
 10
  
 예제 입력 2
 1
 1 -1 -1
 예제 출력 2
 0
 */
import Foundation


var ansList = [Int]()
var adjList = [[Int]]()
var parent = [Int]()
var visited = [Bool]()
var parentCount = [Int]()

func solution(){
    let N = Int(readLine()!)!
    adjList = [[Int]](repeating: [Int](), count: N + 1)// 0은 깍두기
    parent = [Int](repeating : 0, count: N + 1) //parent[idx] = idx의 부모
    visited = [Bool](repeating: false, count: N + 1)
    parentCount = [Int](repeating : 0, count: N + 1)//parentCount[idx] = idx의 조회 횟수 -> 2번 조회되면 종료된 것
    //입력
    for _ in 1...N{
        var input = readLine()!.split(separator: " ").map{ Int(String($0))!}
        let root = input[0]
        let left = input[1]
        let right = input[2]
        
        adjList[root].append(left)
        adjList[root].append(right)
        
        if left > 0{
            parent[left] = root
        }
        if right > 0{
            parent[right] = root
        }
        
    }
    dfs(root: 1)
    //우측 깊이 만큼 제거
    let dep = getDepthRight(root: 1, count: 0)
    ansList.removeLast(dep)
    
    print(ansList.count - 1 )
    
    
    
    
    
}

func dfs(root : Int){
    
    //현재 위치한 노드의 왼쪽 자식 노드가 존재하고 아직 방문하지 않았다면, 왼쪽 자식 노드로 이동한다.
    if !visited[root]{
        ansList.append(root)
        visited[root] = true
    }
    
    let left = adjList[root][0]
    if left != -1 && !visited[left]{
        dfs(root: left)
    }
    
    //ansList.append(root)
    
    //그렇지 않고 현재 위치한 노드의 오른쪽 자식 노드가 존재하고 아직 방문하지 않았다면, 오른쪽 자식 노드로 이동한다.
    let right = adjList[root][1]
    if right != -1 && !visited[right]{
        dfs(root: right)
    }
    
    //그렇지 않고 현재 노드가 유사 중위 순회의 끝이라면, 유사 중위 순회를 종료한다.
    
    //그렇지 않고 부모 노드가 존재한다면, 부모 노드로 이동한다.
    if parent[root] != 0{
        ansList.append(parent[root])
       // dfs(root: parent[root])
    }
}

func getDepthRight(root : Int, count : Int) -> Int{
    let right = adjList[root][1]
    var resultCount = count
    
    if right != -1{
        resultCount = getDepthRight(root: right, count: count + 1)
    }
    
    return resultCount
    
}

solution()
