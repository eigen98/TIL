//
//  SafariView.swift
//  WebMapDemo
//
//  Created by JeongMin Ko on 2022/11/02.
//

import SwiftUI
import SafariServices;

struct SafariView: UIViewControllerRepresentable {
    func makeUIViewController(context: UIViewControllerRepresentableContext<SafariView>) ->  SFSafariViewController {
        let view = SFSafariViewController(url: URL(string: "https://naver.com")!)
        return view
    }
    
    func updateUIViewController(_ uiViewController: SFSafariViewController, context: UIViewControllerRepresentableContext<SafariView>) {
        
    }
}

struct SafariView_Previews: PreviewProvider {
    static var previews: some View {
        SafariView()
    }
}
