//
//  main.swift
//  BJ9466
//
//  Created by JeongMin Ko on 2023/01/08.
//
/*
 문제
 이번 가을학기에 '문제 해결' 강의를 신청한 학생들은 텀 프로젝트를 수행해야 한다. 프로젝트 팀원 수에는 제한이 없다. 심지어 모든 학생들이 동일한 팀의 팀원인 경우와 같이 한 팀만 있을 수도 있다. 프로젝트 팀을 구성하기 위해, 모든 학생들은 프로젝트를 함께하고 싶은 학생을 선택해야 한다. (단, 단 한 명만 선택할 수 있다.) 혼자 하고 싶어하는 학생은 자기 자신을 선택하는 것도 가능하다.

 학생들이(s1, s2, ..., sr)이라 할 때, r=1이고 s1이 s1을 선택하는 경우나, s1이 s2를 선택하고, s2가 s3를 선택하고,..., sr-1이 sr을 선택하고, sr이 s1을 선택하는 경우에만 한 팀이 될 수 있다.

 예를 들어, 한 반에 7명의 학생이 있다고 하자. 학생들을 1번부터 7번으로 표현할 때, 선택의 결과는 다음과 같다.

 1    2    3    4    5    6    7
 3    1    3    7    3    4    6
 위의 결과를 통해 (3)과 (4, 7, 6)이 팀을 이룰 수 있다. 1, 2, 5는 어느 팀에도 속하지 않는다.

 주어진 선택의 결과를 보고 어느 프로젝트 팀에도 속하지 않는 학생들의 수를 계산하는 프로그램을 작성하라.

 입력
 첫째 줄에 테스트 케이스의 개수 T가 주어진다. 각 테스트 케이스의 첫 줄에는 학생의 수가 정수 n (2 ≤ n ≤ 100,000)으로 주어진다. 각 테스트 케이스의 둘째 줄에는 선택된 학생들의 번호가 주어진다. (모든 학생들은 1부터 n까지 번호가 부여된다.)

 출력
 각 테스트 케이스마다 한 줄에 출력하고, 각 줄에는 프로젝트 팀에 속하지 못한 학생들의 수를 나타내면 된다.

 예제 입력 1
 2
 7
 3 1 3 7 3 4 6
 8
 1 2 3 4 5 6 7 8
 예제 출력 1
 3
 0
 */
 
//사이클이 생기지 않는다면 팀X
import Foundation

func solution(){
    var T = Int(readLine()!)!
    var ans = [Int]()
    
    for i in 1...T{
        var n = Int(readLine()!)!
        var A = readLine()!.split(separator: " ").map{ Int(String($0))!}
        var visited = [Bool](repeating: false, count: n + 1)
        var ansSet = 0
        var adjList = [[Int]](repeating: [Int](), count: n + 1) //0 깍두기
        for (idx, value) in A.enumerated(){
            adjList[idx + 1].append(value)
            
        }
       
        
        //사이클 확인
        var count = 0
        func dfs(start: Int, team : [Int]){
            
            if start == team.first ?? 0{
                count += team.count
                print(team)
                return
            }
            
            if visited[start]{
                return
            }
            
            visited[start] = true
            var members = team
            members.append(start)
            
            if let next = adjList[start].first{
                
                    dfs(start: next, team: members)
                
                
            }
            
        }
        
        for i in 1...n{
            if !visited[i]{
                dfs(start: i, team: [Int]())
            }
            
        }
        
        ans.append(n - count)
        
        
    }
    
    
    for i in ans{
        print(i)
    }
}

solution()


let t = Int(readLine()!)!
var results = [Int]()

for _ in 0..<t {
  let r = Int(readLine()!)!

  let choice = [0] + readLine()!.split(separator: " ").map { Int($0)! }

  if choice == Array(0...r) {
    results.append(0)
    continue
  }

  var visited = Array(repeating: false, count: r + 1)
  var done = Array(repeating: false, count: r + 1)
  var count = 0

  func dfs(start: Int) {
    visited[start] = true
    var n = choice[start]

    if !visited[n] {
      dfs(start: n)
    } else if !done[n] {
      while n != start {
        count += 1
        n = choice[n]
      }
      count += 1
    }
    done[start] = true
  }

  for i in 1...r {
    if !visited[i] {
      dfs(start: i)
    }
  }
  results.append(r - count)
}

results.forEach {
  print($0)
}
