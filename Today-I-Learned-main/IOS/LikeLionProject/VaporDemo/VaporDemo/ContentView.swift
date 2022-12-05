//
//  ContentView.swift
//  VaporDemo
//
//  Created by JeongMin Ko on 2022/12/05.
//

import SwiftUI

struct ContentView: View {
    @State private var newMessage = ""
    @State private var messages = [
           "Hello, how are you?",
           "I'm good, how are you?",
           "I'm doing well, thank you."
       ]

       var body: some View {
           VStack {
               // Use a List to display the chat messages
               List {
                   ForEach(messages, id: \.self) { message in
                       Text(message)
                   }
               }
               
               HStack{
                   // Use a TextField to allow users to enter their own messages
                   TextField("Enter your message", text: $newMessage)
                       .textFieldStyle(RoundedBorderTextFieldStyle())
                       .padding()
                   Button( "보내기", action: {
                       
                       let webService: WebService = WebService()
                       let url: String = "http://127.0.0.1:8080/user/\(newMessage)"
                       Task{
                        
                           var info = try await webService.fetchData(url: url)
                           messages.append("이름 : \(info?.name ?? "") \n 팔로워 : \(info?.followers ?? 0) ")
                       }
                       newMessage = ""
                       
                       
                      
                   }).padding(.trailing, 16)
               }

               
           }
       }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
