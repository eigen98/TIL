//
//  main.swift
//  BJ12919
//
//  Created by JeongMin Ko on 2022/12/14.
//A
//BABA

import Foundation

func solution(){
    
    var S = readLine()!
    
    var T = readLine()!
    var ans = 0
    //첫번째
    func addA(str : String) -> String{
        var str = str
        
        str += "A"
        return str
    }
    //두번째
    func addB(str : String) -> String{
        var str = str
        
        str += "B"
        str = String(str.reversed())
        return str
    }
    
    func rec_func(str : String, count : Int){
        //print(str)
        if T.count <= str.count {
            if T == str{
               ans = 1
                return
            }else{
                ans = max(ans, 0)
                return
            }
            
            
        }else{
            
            var str = str
            var caseA = addA(str: str)
            var caseB = addB(str: str)
            
            rec_func(str: caseB, count: count + 1)
            rec_func(str: caseA, count: count + 1)
        }
    }
    
    rec_func(str: S, count: 1)
    
    print(ans)
    
}
solution()

