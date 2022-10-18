//
//  ContentView.swift
//  HelloSwiftUI
//
//  Created by JeongMin Ko on 2022/10/18.
//

import SwiftUI

var member : Member? = nil

struct ContentView: View {
    
    var myTeamMember = ["도현","태영","한호","진표","주희","서현","정민"]
    
    @State var member: Member
    
    
    var body: some View {
        VStack {
            
            Text("12조")
                .font(.largeTitle).foregroundColor(.blue)
            
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            
            Text("\(member.name ?? "Name")").foregroundColor(.black)
                .fontWeight(.bold).font(.system(size: 40.0))
            
            
            HStack{
                Button("\(myTeamMember[0])") {
                    member = Member(name: "\(myTeamMember[0])")
                    
                }.foregroundColor(.blue).foregroundColor(.orange)
                
                Button("\(myTeamMember[1])") {
                    member = Member(name: "\(myTeamMember[1])")
                }.foregroundColor(.blue)
                
                Button("\(myTeamMember[2])") {
                    member = Member(name: "\(myTeamMember[2])")
                }.foregroundColor(.blue)
                
                Button("\(myTeamMember[3])") {
                    member = Member(name: "\(myTeamMember[3])")
                }.foregroundColor(.blue)
                
                Button("\(myTeamMember[4])") {
                    member = Member(name: "\(myTeamMember[4])")
                }.foregroundColor(.blue)
                
                Button("\(myTeamMember[5])") {
                    member = Member(name: "\(myTeamMember[5])")
                }.foregroundColor(.blue)
                
                Button("\(myTeamMember[6])") {
                    member = Member(name: "\(myTeamMember[6])")
                }.foregroundColor(.blue)
                
                
            }
            
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView( member: Member(name: "누구"))
    }
}

class Member{
    var name : String
    
    init(name: String) {
        self.name = name
    }
}
