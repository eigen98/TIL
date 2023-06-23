//
//  main.swift
//  BJ20210
//
//  Created by JeongMin Ko on 2023/06/23.
//

import Foundation


func solution(){
    var num = Int(readLine()!)!
    var list = [String]()
    var splitedArr = [[String]]()
    for _ in 1...num{
        //Foo00012Bar
        var input = readLine()!
        
        var arr = input.map{ String($0)}
        var splited = [String]()
        var preType = "Nothing"
        
        var buffer = ""
        for idx in 0..<arr.count{
            //숫자인지
            if arr[idx] <= "9" && arr[idx] >= "0" {
                //연달아 숫자가 나옴.
                if preType == "Number"{
                    
                    buffer += arr[idx]
                }else{
                    //이전과 다름.
                    if preType != "Nothing"{
                        splited.append(buffer)
                        buffer = ""
                    }
                    buffer += arr[idx]
                }
                
                preType = "Number"
            }else{
                //문자인지
                //연달아 문자가 나옴.
                if preType == "Alphabet"{
                    buffer += arr[idx]
                }else{
                    //이전과 다름.
                    if preType != "Nothing"{
                        splited.append(buffer)
                        buffer = ""
                    }
                    buffer += arr[idx]
                }
                
                preType = "Alphabet"
            }
            
        }
        if buffer.count > 0{
            splited.append(buffer)
        }
        splitedArr.append(splited)
        list.append(input)
    }
    
    
    splitedArr = splitedArr.sorted{
        
        var idx = 0
        
        while(true){
            //두개 다 문자인경우.
            if $0[idx].first!.isLetter && $1[idx].first!.isLetter{
                if $0[idx] != $1[idx]{
                    return $0[idx] < $1[idx]
                }
            }
            //두개 다 숫자인 경우.
            
            else if !$0[idx].first!.isLetter && !$1[idx].first!.isLetter{
                
                if $0[idx] != $1[idx]{
                    return Int($0[idx])! < Int($1[idx])!
                }
                //같은 숫자인 경우
                //앞의 0이 적은 것 먼저.
                if Int($0[idx])! == Int($1[idx])! && $0[idx].count != $1[idx].count{
                    return $0[idx].count < $1[idx].count
                }
            }else{
                //문자와 숫자 각각인 경우. 숫자열이 먼저
                var first = $0[idx].first!.isLetter ? 1 : 0
                var second =  $1[idx].first!.isLetter ? 1 : 0
                return first < second
            }
            
            idx += 1
            
        }
        
        
        
    }
    print()
    for idx in 0..<splitedArr.count{
        
        print(splitedArr[idx].joined())
    }
}

solution()
