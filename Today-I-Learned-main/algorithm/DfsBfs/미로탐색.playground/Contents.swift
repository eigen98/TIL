import Foundation

//백준
//첫째 줄에 두 정수 N, M(2 ≤ N, M ≤ 100)이 주어진다.
/*
 4 6
 101111
 101010
 101011
 111011
 
 15
 */

func solution(){
    var N = 4
    var M = 6
    var direction = [
        [1,0],
        [-1,0],
        [0,1],
        [0,-1]
    ]
    
    var visited = [[Bool]](repeating: [Bool](repeating: false, count: M), count: N)
    
    var matrix = [[Int]]()
    
    matrix = [
        [1,0,1,1,1,1],
        [1,0,1,0,1,0],
        [1,0,1,0,1,1],
        [1,1,1,0,1,1]
    ]
    
    func bfs(_ row : Int, _ col : Int){
        
        var queue = [[Int]]()
        queue.append([row,col])
        
        while(!queue.isEmpty){
            
            var loc = queue.removeFirst()
            var count = matrix[loc[0]][loc[1]]
            for i in 0..<4{
                var nr = loc[0] + direction[i][0]
                var nc = loc[1] + direction[i][1]
                
                if
                    nr >= 0 &&
                    nr < N &&
                    nc >= 0 &&
                    nc < M &&
                    !visited[nr][nc] &&
                    matrix[nr][nc] != 0{
                    
                    queue.append([nr,nc])
                    visited[nr][nc] = true
                    matrix[nr][nc] += count
                    
                }else{
                    continue
                }
            }
            
        }
        
    }
    
    bfs(0,0)
    print(matrix[N - 1][ M - 1])
    
    
}

solution()
