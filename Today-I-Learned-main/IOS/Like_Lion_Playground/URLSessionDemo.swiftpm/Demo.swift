//
//  Demo.swift
//  URLSessionDemo
//
//  Created by JeongMin Ko on 2022/11/21.
//

import Foundation




let url = URL(string: "https://mocki.io/v1/60700dfb-ae0a-451d-816b-637a8c04091c")!
let task = URLSession.shared.dataTask(with: url){
    (data, response, error) in
    //data, response, error를 활용한 데이터 가져온 이후의 작업
    
    //data가 nil 로서 옵셔널 바인딩에서 else 처리 된다면 끝
    guard let data else{
        print("nothing")
        print("\(error)")
        return
    }
    guard error == nil else{
        return
    }
    if let httpResponse = response as? HTTPURLResponse,
       !(200...299).contains(httpResponse.statusCode){
        return
    }
       
    do {
        let hasData = try JSONDecoder().decode([CarInfo].self, from: data)
        printCarInfo(result: hasData)
        
    } catch let error as NSError{
        
    }
    
    
    let showingData = String(data: data, encoding: .utf8)
   // print("\(showingData)")
    
}
task.resume()


struct CarInfo : Decodable {
    var id : String
    var name : String
    var isHybrid : Bool
    
    
    private enum CodingKeys : String, CodingKey {
        case id = "id"
        case name = "name"
        case isHybrid = "isHybrid"
    }
}


func printCarInfo(result : [CarInfo]){
    result.forEach{
        print("모델명 : \($0.name)")
        print("하이브리드 여부:  \($0.isHybrid)")
       
    }
}
