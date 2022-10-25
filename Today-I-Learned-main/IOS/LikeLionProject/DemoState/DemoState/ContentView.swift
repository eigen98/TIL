//
//  ContentView.swift
//  DemoState
//
//  Created by JeongMin Ko on 2022/10/24.
//

import SwiftUI
import Combine
//ObservableObject -> '지켜봐줘'라는 의미
class DemoData : ObservableObject {
    
    //Published -> 다음의 값이 바뀌면 알려주겠다.
    //지켜보는데 바뀌면 알려줄 대상은 이거야.(내용은 바뀔건데 어떤 게 바뀌느냐? 이거야)
    @Published var userCount : Int = 0
    @Published var currentUser : String = ""
    
    init(){
        //시작하자마자 업데이트할 수 있게끔
        updateData()
    }
    func updateData(){
        userCount = 12
        currentUser = "ned"
    }
}

struct ContentView: View {
    //여기서 초기화 해주지 않으려면 프리뷰에서 인자에 초기화해서 넣어주도록 하면 가능.
    @ObservedObject var demoData : DemoData // = DemoData()
    
    var body: some View {
        NavigationView{
            VStack {
                
                
                Text("\(demoData.currentUser)")
                Text("\(demoData.userCount)")
                
                Button(action : {
                    demoData.updateData()
                }){
                    Text("Update Data")
                }
                NavigationLink(destination: SecondView()){
                    Text("도착")
                }
            }
            .padding()
            .navigationTitle("Master")
        }
      
        
    }
}

struct SecondView : View{
    var body: some View{
        NavigationView{
            VStack{
                Text("Detail")
            }
            .navigationTitle("Detail")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(demoData : DemoData())
    }
}
