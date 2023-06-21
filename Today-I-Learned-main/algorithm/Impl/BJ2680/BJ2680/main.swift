//
//  main.swift
//  BJ2680
//
//  Created by JeongMin Ko on 2023/06/21.


import Foundation

let alphanum: String = "0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ $%*+-./:"
let binary: [String] = ["0000", "0001", "0010", "0011", "0100",
                         "0101", "0110", "0111", "1000", "1001",
                         "0", "0", "0", "0", "0", "0",
                         "1010", "1011", "1100", "1101", "1110", "1111"]

func solution(){
    var T = Int(readLine()!)!

    for _ in 1...T{
        //10 20 7B 72 27 10 14 E7 73 90 90 0D 16 4A 8C 00 EC 11 EC
        //19개의 데이터 블록이며, 38개의 16진수 문자
        var input = readLine()!
        decodeStr(str: input)
    }
}
var padding = ["", "0", "00", "000", "0000", "00000", "000000", "0000000", "00000000"]
func decodeStr(str: String){
    let arr = str.map{ String($0)}
    var binaryArr = [String]()
    for i in 0..<arr.count / 2{
        let nowHex = arr[i * 2] + arr[i * 2 + 1]
        //-> 10 20 7B 72 27 10 14 E7 73 90 90 0D 16 4A 8C 00 EC 11 EC
        let nowInt = Int(nowHex, radix: 16)!
        var nowBinary = String(nowInt, radix: 2)
        
        let paddingCount =  8 - nowBinary.count
        nowBinary =  "\(padding[paddingCount])\(nowBinary)"
        binaryArr.append(nowBinary)
        // -> 00010000 00100000 01111011 01110010 00100111 00010000 00010100 11100111 01110011 10010000 10010000 00001101 00010110 01001010 10001100 00000000 11101100 00010001 11101100
    }
    
    var binaryStr = binaryArr.joined().map{ String($0)}
    
//    Numeric    0001    10
//    Alphanumeric    0010    9
//    8 bit byte    0100    8
//    Kanji    1000    8
//    Termination    0000    0
    
    var pointer = 0
    let modeDic = ["0001" : 9, "0010" : 9, "0100" : 8,  "1000" : 8]
    
    
    while(true){
        //Mode bits 확인
        let modeBits = Array(binaryStr[pointer...pointer + 3]).joined()
        pointer += 4
        
        //0001
        guard let nextGap = modeDic[modeBits] else{
            return
        }
        
        //0000001000 -> 8개
        let countBits = Array(binaryStr[pointer...pointer + nextGap]).joined()
        pointer += (nextGap + 1)
        
        //숫자 -> 10비트씩 3개 -> 7비트 2개, -> 4비트 1개.
        var resultStr = ""
        if modeBits == "0001"{
            let totalCount = Int(countBits, radix: 2)!
            let tenBitCount = totalCount/3
            let lastCount = totalCount % 3
            
            
            for _ in 0..<tenBitCount{
                let nowNum = binaryStr[pointer...pointer + 9].joined()
                let convertNum = Int(nowNum, radix: 2)!
                resultStr += "\(convertNum)"
                pointer += 10
            }
            
            switch lastCount{
            case 2:
                let nowNum = binaryStr[pointer...pointer + 6].joined()
                let convertNum = Int(nowNum, radix: 2)!
                resultStr += "\(convertNum)"
                pointer += 7
                break
            case 1:
                var nowNum = binaryStr[pointer...pointer + 3].joined()
                var convertNum = Int(nowNum, radix: 2)!
                resultStr += "\(convertNum)"
                pointer += 4
                break
            default:
                break
                
            }
            print(resultStr)
            return
        }
        return
        //영어 기호 -> 11비트씩 2개 알파벳. -> 1개 남는 경우 6비트
        if modeBits == "0010"{
            
        }
        //8비트 -> 8비트씩
        if modeBits == "0100"{
            
        }
        //한자 -> 13비트씩
        if modeBits == "1000"{
            
        }
    }
    print(binaryArr)
    
}
solution()
//
//}


// -> 문자의 수를 나타내는 정수 하나
// -> 공백으로 구분하여, 디코딩된 문자열
