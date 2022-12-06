import UIKit
//백준
// 암호 만들기
//서로 다른 L개의 알파벳 소문자들로 구성되며 최소 한 개의 모음(a, e, i, o, u)과 최소 두 개의 자음
//알파벳이 암호에서 증가하는 순서로 배열되었을 것이라고 추측된
//var input1 = readLine()!.split(separator: " ")
//var input2 = readLine()!.split(separator: " ")

var L = 4
var C = 6
var selected : [String] = []
var visited : [Bool] = [Bool](repeating: false, count: C)
var str = ""
var arr = ["a", "t", "c", "i", "s", "w"]
arr = arr.sorted()
var vowel = 0
                   
