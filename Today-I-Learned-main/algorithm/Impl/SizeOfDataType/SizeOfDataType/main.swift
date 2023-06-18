//
//  main.swift
//  SizeOfDataType
//
//  Created by JeongMin Ko on 2023/06/18.
//

import Foundation

func solution(_ param0: [String]) -> String {
    let byte = 8
    let limit = 128
    var memory = ""
    // param0에 저장된 타입 순서대로 메모리를 할당
    func assignData(_ dataSize: Int) {
        while memory.count % dataSize != 0 {
            memory += "."
        }
        for _ in 0..<dataSize {
            memory += "#"
        }
    }
    
    // 메모리에 할당하는 함수를 딕셔너리에 저장. 함수는 각 타입별로 메모리 할당을 담당
    let dataSize: [String: (() -> Void)] = [
        "BOOL": { assignData(1) },
        "SHORT": { assignData(2) },
        "FLOAT": { assignData(4) },
        "INT": { assignData(8) },
        "LONG": {
            assignData(8)
            assignData(8)
        }
    ]

    
    for data in param0 {
        dataSize[data]?()
    }
    // 메모리 크기가 byte 단위가 되도록 패딩 추가
    while memory.count % byte != 0 {
        memory += "."
    }
    
    if memory.count > limit { return "HALT" }
    print(memory.chunked(into: byte).joined(separator: ", "))
    return memory.chunked(into: byte).joined(separator: ", ")
}

// 문자열을 특정 크기의 청크로 분리하는 도우미 메소드
extension String {
    func chunked(into size: Int) -> [String] {
        var result: [String] = []
        var collectedCharacters: [Character] = []
        var count = 0

        for character in self {
            collectedCharacters.append(character)
            count += 1
            if (count == size) {
                // Append the segment and clear for next grouping
                result.append(String(collectedCharacters))
                collectedCharacters.removeAll(keepingCapacity: true)
                count = 0
            }
        }

        // Append the remainder
        if !collectedCharacters.isEmpty {
            result.append(String(collectedCharacters))
        }

        return result
    }
}


solution( ["INT", "INT", "BOOL", "SHORT", "LONG"])
