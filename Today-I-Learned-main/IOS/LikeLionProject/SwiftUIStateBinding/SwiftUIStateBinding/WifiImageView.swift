//
//  WifiImageView.swift
//  SwiftUIStateBinding
//
//  Created by JeongMin Ko on 2022/10/19.
//

import SwiftUI

struct WifiImageView: View {
    
    @Binding var wifiEnabled : Bool
    
    var body: some View {
        Image(systemName: wifiEnabled ? "wifi" : "wifi.slash")
        Text(wifiEnabled ? "Wi-Fi 켜짐" : "Wi-Fi 꺼짐")
    }
}

