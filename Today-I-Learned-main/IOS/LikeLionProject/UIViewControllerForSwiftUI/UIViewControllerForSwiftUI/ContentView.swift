//
//  ContentView.swift
//  UIViewControllerForSwiftUI
//
//  Created by JeongMin Ko on 2022/11/02.
//

import SwiftUI

struct ContentView: View {
    
    @State var imagePickerVisible : Bool = false
    @State var selectedImage : Image? = Image(systemName: "photo")
    var body: some View {
        
        ZStack{
            VStack {
                selectedImage?
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                
                Button(action: {
                    imagePickerVisible = false
                }){
                    Text("Select an Image")
                        .font(.largeTitle)
                }
               
            }
            .padding()
            if (!imagePickerVisible){
                MyImagePicker(imagePickerVisible: $imagePickerVisible, selectedImage: $selectedImage)
            }
          
        }
      
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
