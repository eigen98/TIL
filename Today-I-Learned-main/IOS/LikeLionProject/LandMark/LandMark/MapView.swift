//
//  MapView.swift
//  LandMark
//
//  Created by JeongMin Ko on 2022/11/25.
//

import SwiftUI
import MapKit

struct MapView: View {
    @State var region : MKCoordinateRegion = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 0, longitude: 0), span: MKCoordinateSpan(latitudeDelta: 1.0, longitudeDelta: 1.0))
                                                                
    var body: some View {
       Map(coordinateRegion: $region)
    }
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView()
    }
}
