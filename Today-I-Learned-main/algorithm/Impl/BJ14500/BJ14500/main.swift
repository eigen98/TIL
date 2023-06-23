//
//  main.swift
//  BJ14500
//
//  Created by JeongMin Ko on 2023/06/23.
//

import Foundation

var N = 0
var M = 0
var matrix = [[Int]]()
func solution(){
    var answer = 0
    var inputNum = readLine()!.split(separator: " ").map{ Int(String($0))!}
    N = inputNum[0]
    M = inputNum[1]
    
    for _ in 1...N{
        var arr = readLine()!.split(separator: " ").map{ Int(String($0))!}
        matrix.append(arr)
    }
    
    for i in 0..<N{
        for j in 0..<M{
            var total = check(r: i, c: j)
            answer = max(answer, total)
        }
    }
    
    print(answer)
    
}

solution()

func check(r: Int, c: Int) -> Int{
    var result = 0
    
    
    
    //일자 가로
    if c + 3 < M{
        var sum = 0
        for i in 0...3{
            var nr = r
            var nc = c + i
            sum += matrix[nr][nc]
        }
        result = max(sum, result)
    }
   
    //일자 세로
    if r + 3 < N{
        var sum = 0
        for i in 0...3{
            var nr = r + i
            var nc = c
            sum += matrix[nr][nc]
        }
        result = max(sum, result)
    }
    
    //네모.
    
    if r + 1 < N && c + 1 < M {
        var sum = 0
        for i in 0...1{
            for j in 0...1{
                
                var nr = r + i
                var nc = c + j
                sum += matrix[nr][nc]
            }
        }
        result = max(sum, result)
    }
    
    //기역자 세로
    if r + 2 < N{
        var sum = 0
        for i in 0...2{
            var nr = r + i
            var nc = c
            sum += matrix[nr][nc]
        }
        
        //아래 오른쪽
        if c + 1 < M{
            sum += matrix[r + 2][c + 1]
            result = max(sum, result)
            sum -= matrix[r + 2][c + 1]
        }
        
        //아래 왼쪽
        if c - 1 >= 0{
            sum += matrix[r + 2][c - 1]
            result = max(sum, result)
            sum -= matrix[r + 2][c - 1]
        }
        
        //위 오른쪽
        if c + 1 < M{
            sum += matrix[r][c + 1]
            result = max(sum, result)
            sum -= matrix[r][c + 1]
        }
        
        //위 왼쪽
        if c - 1 >= 0{
            sum += matrix[r][c - 1]
            result = max(sum, result)
            sum -= matrix[r][c - 1]
        }
        
        
        
        
    }
    
    //기역자 가로
    if r + 1 < N{
        var sum = 0
        for i in 0...1{
            var nr = r + i
            var nc = c
            sum += matrix[nr][nc]
        }
        
        //아래 오른쪽
        if c + 2 < M{
            var add = 0
            for i in 0...1{
                var nr = r + 1
                var nc = c + 1 + i
                add += matrix[nr][nc]
            }
            sum += add
            result = max(sum, result)
            sum -= add
        }
        
        //위 오른쪽
        if c + 2 < M{
            var add = 0
            for i in 0...1{
                var nr = r
                var nc = c + 1 + i
                add += matrix[nr][nc]
            }
            sum += add
            result = max(sum, result)
            sum -= add
        }
        
        //아래 왼쪽
        if c - 2 >= 0{
            var add = 0
            for i in 0...1{
                var nr = r + 1
                var nc = c - 1 - i
                add += matrix[nr][nc]
            }
            sum += add
            result = max(sum, result)
            sum -= add
        }
        
        //위 왼쪽
        if c - 2 >= 0{
            var add = 0
            for i in 0...1{
                var nr = r
                var nc = c - 1 - i
                add += matrix[nr][nc]
            }
            sum += add
            result = max(sum, result)
            sum -= add
        }
        
    }
    
    //지그재그
    if r + 2 < N && c + 1 < M{
        var sum = 0
        sum = matrix[r][c] +  matrix[r + 1][c] +  matrix[r + 1][c + 1] +  matrix[r + 2][c + 1]
        result = max(sum, result)
    }
    
    if r + 2 < N && c - 1 >= 0{
        var sum = 0
        sum = matrix[r][c] +  matrix[r + 1][c] +  matrix[r + 1][c - 1] +  matrix[r + 2][c - 1]
        result = max(sum, result)
    }
    
    if r - 1 >= 0 && c + 2 < M{
        var sum = 0
        sum = matrix[r][c] +  matrix[r][c + 1] +  matrix[r - 1][c + 1] +  matrix[r - 1][c + 2]
        result = max(sum, result)
    }
    
    if r + 1 < N && c + 2 < M{
        var sum = 0
        sum = matrix[r][c] +  matrix[r][c + 1] +  matrix[r + 1][c + 1] +  matrix[r + 1][c + 2]
        result = max(sum, result)
    }
    
    //ㅜ ㅗ
    if c + 2 < M{
        
        var sum = 0
        for i in 0...2{
            var nr = r
            var nc = c + i
            sum += matrix[nr][nc]
        }
        //ㅜ
        if r + 1 < N{
            sum += matrix[r + 1][c + 1]
            result = max(sum, result)
            sum -= matrix[r + 1][c + 1]
        }
        //ㅗ
        if r - 1 >= 0{
            sum += matrix[r - 1][c + 1]
            result = max(sum, result)
            sum -= matrix[r - 1][c + 1]
        }
        
        
    }
    
    //ㅏ, ㅓ
    if r + 2 < N{
        
        var sum = 0
        for i in 0...2{
            var nr = r + i
            var nc = c
            sum += matrix[nr][nc]
        }
        //ㅏ
        if c + 1 < M{
            sum += matrix[r + 1][c + 1]
            result = max(sum, result)
            sum -= matrix[r + 1][c + 1]
        }
        //ㅓ
        if c - 1 >= 0{
            sum += matrix[r + 1][c - 1]
            result = max(sum, result)
            sum -= matrix[r + 1][c - 1]
        }
        
        
    }
    
    
   
    
    return result
}

