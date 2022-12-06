import UIKit
var direction = [[1, 0],
                 [-1, 0],
                 [0, 1],
                 [0, -1],
                 [1, 1],
                 [1, -1],
                 [-1, 1],
                 [-1, -1]
]

while(true){
    var input1 = readLine()!.split(separator: " ")
    
    var w = Int(input1[0]) ?? 0
    var h = Int(input1[1]) ?? 0

    var matrix : [[Int]] = [[Int]]()
    for _ in 1...h{
        var numLine = readLine()!.split(separator: " ").map{Int(String($0)) ?? 0}
        matrix.append(numLine)
    }


    var visited = [[Bool]](Array(repeating: [Bool](Array(repeating: false, count: w)), count: h))
    //섬개수
    var count = 0
    //bfs(시작좌표)
    func bfs(_ row : Int, _ cow : Int){
        count += 1
        var queue : Array<[Int]> = Array()
        queue.append([row, cow])// 시작점 큐에 넣기
        visited[row][cow] = true
        
        while(!queue.isEmpty){
            var loc = queue.removeFirst()
            for i in 0..<8{
                var nr = loc[0] + direction[i][0]
                var nc = loc[1] + direction[i][1]
                
                if nr >= 0 &&
                    nr < h &&
                    nc >= 0 &&
                    nc < w  &&
                    !visited[nr][nc] &&
                    matrix[nr][nc] == 1
                {
                    
                    
                    visited[nr][nc] = true
                    //print("\(visited)")
                    queue.append([nr, nc])
                }else{
                    continue
                }
            }
        }
    }
    func solsution(){
        //인접 행렬 리스트
        var adjMatrix = Array<[Int]>()
        adjMatrix = matrix
        
        for i in 0..<h{
            for j in 0..<w{
                if matrix[i][j] == 1 && !visited[i][j]{
                    bfs(i,j)
                }
            }
        }
        
        print(count)
    }
    
    solsution()

}





