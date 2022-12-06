
import Foundation


//원래는 Class 처리가 없으셨지만 내가 임시로 구현했다.
class FileIO {
    @inline(__always) private var buffer: [UInt8] = Array(FileHandle.standardInput.readDataToEndOfFile()) + [0], byteIdx = 0
    
    @inline(__always) private func readByte() -> UInt8 {
        defer { byteIdx += 1 }
        return buffer.withUnsafeBufferPointer { $0[byteIdx] }
    }
    
    @inline(__always) func readInt() -> Int {
        var number = 0, byte = readByte(), isNegative = false
        while byte == 10 || byte == 32 { byte = readByte() }
        if byte == 45 { byte = readByte(); isNegative = true }
        while 48...57 ~= byte { number = number * 10 + Int(byte - 48); byte = readByte() }
        return number * (isNegative ? -1 : 1)
    }
    
    @inline(__always) func readStirngSum() -> Int {
        var byte = readByte()
        while byte == 10 || byte == 32 { byte = readByte() }
        var sum = Int(byte)
        while byte != 10 && byte != 32 && byte != 0 { byte = readByte(); sum += Int(byte) }
        return sum - Int(byte)
    }
    
    @inline(__always) private func write(_ output: String) {
        FileHandle.standardOutput.write(output.data(using: .utf8)!)
    }
}

/*
 첫째 줄에
 도시의 개수 N,
 도로의 개수 M,
 거리 정보 K,
 출발 도시의 번호 X가 주어진다. (2 ≤ N ≤ 300,000, 1 ≤ M ≤ 1,000,000, 1 ≤ K ≤ 300,000, 1 ≤ X ≤ N)
 
 둘째 줄부터 M개의 줄에 걸쳐서 두 개의 자연수 A, B가 공백을 기준으로 구분되어 주어진다.
 
 4 4 2 1
 1 2
 1 3
 2 3
 2 4
 */
func solution(){
    //var input = readLine()!.spl(separatedBy: " ")
   
    var N = 4 //도시 개수
    var M = 3 //도로 개수
    var K = 2 //거리
    var X = 1 //출발도시

    var loadArr = [
        [1, 2],
        [1, 3],
        [1, 4]
    ]
    
    var visited = [Bool](repeating: false, count: N + 1)
    
    var distance = [Int](repeating: 0, count: N + 1)
    
    
//인접 리스트
    var adjList = [Array<Int>](repeating: Array(), count: N + 1)
    for loadInfo in loadArr{
        adjList[loadInfo[0]].append(loadInfo[1])
    }
    
    func bfs(start : Int){
        var count = 0 //거리
        var queue = [Int]()
        queue.append(start)
        
        while(!queue.isEmpty){
            var city = queue.removeFirst()
            count += 1
            for go in adjList[city]{
                if !visited[go]{
                    
                    distance[go] = count
                    visited[go] = true
                    queue.append(go)
                    
                }else{
                    continue
                }
                
            }
            
        }
        
    }
    
    bfs(start: X)
    var resultStr = ""
    var resultIdx = [Int]()
    for (idx, gap) in distance.enumerated(){
        if gap == K {
            resultIdx.append(idx)
            
        }
    }
    if resultIdx.count == 0{
         print(-1)
     }else{
        
         resultIdx = resultIdx.sorted()
         for idx in resultIdx{
             resultStr += "\(idx)\n"
         }
         resultStr = String(resultStr.dropLast(1))
         print(resultStr)
     }
    
    
}

solution()

