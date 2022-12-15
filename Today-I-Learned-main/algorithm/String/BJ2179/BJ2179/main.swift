//
//  main.swift
//  BJ2179
//
//  Created by JeongMin Ko on 2022/12/15.
//
/*
 문제
 N개의 영단어들이 주어졌을 때, 가장 비슷한 두 단어를 구해내는 프로그램을 작성하시오.

 두 단어의 비슷한 정도는 두 단어의 접두사의 길이로 측정한다. 접두사란 두 단어의 앞부분에서 공통적으로 나타나는 부분문자열을 말한다. 즉, 두 단어의 앞에서부터 M개의 글자들이 같으면서 M이 최대인 경우를 구하는 것이다. "AHEHHEH", "AHAHEH"의 접두사는 "AH"가 되고, "AB", "CD"의 접두사는 ""(길이가 0)이 된다.

 접두사의 길이가 최대인 경우가 여러 개일 때에는 입력되는 순서대로 제일 앞쪽에 있는 단어를 답으로 한다. 즉, 답으로 S라는 문자열과 T라는 문자열을 출력한다고 했을 때, 우선 S가 입력되는 순서대로 제일 앞쪽에 있는 단어인 경우를 출력하고, 그런 경우도 여러 개 있을 때에는 그 중에서 T가 입력되는 순서대로 제일 앞쪽에 있는 단어인 경우를 출력한다.

 입력
 첫째 줄에 N(2 ≤ N ≤ 20,000)이 주어진다. 다음 N개의 줄에 알파벳 소문자로만 이루어진 길이 100자 이하의 서로 다른 영단어가 주어진다.

 출력
 첫째 줄에 S를, 둘째 줄에 T를 출력한다. 단, 이 두 단어는 서로 달라야 한다. 즉, 가장 비슷한 두 단어를 구할 때 같은 단어는 제외하는 것이다.

 예제 입력 1
 9
 noon
 is
 lunch
 for
 most
 noone
 waits
 until
 two
 */

import Foundation

import Foundation
/*
 이 문제를 풀기 위해서는 다음과 같은 절차를 따르면 됩니다.

 단어들을 하나씩 읽어들이면서, 접두사의 길이가 점점 커지는 방향으로 다른 단어들과 비교합니다.

 비교하는 단어들의 접두사의 길이가 같은 경우, 그 중에서 제일 앞에 입력된 단어를 출력합니다.

 접두사의 길이가 최대가 되면 답을 출력하고 종료합니다.
 */

func solution(){
    let n = Int(readLine()!)!
    var words = [String]()
    var origin = [String]()
    for _ in 0..<n {
        let word = readLine()!
        if words.contains(word){
            continue
        }
        words.append(word)
        origin.append(word)
    }


    for i in 0..<n {
        for j in 0..<i {
            let len = min(words[i].count, words[j].count)
            
            var k = 0
            while k < len &&
                    words[i][words[i].index(words[i].startIndex, offsetBy: k)] == words[j][words[j].index(words[j].startIndex, offsetBy: k)] {
                k += 1
            }
            
            if k == len {
                
                if origin.firstIndex(of: words[i])! > origin.firstIndex(of: words[j])!{
                    print(words[j])
                    print(words[i])
                }else{
                    print(words[i])
                    print(words[j])
                }
               
                exit(0)
            }
        }
    }

}
