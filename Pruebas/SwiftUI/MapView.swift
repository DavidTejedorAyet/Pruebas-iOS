//
//  MapView.swift
//  Pruebas
//
//  Created by David on 5/8/21.
//

import SwiftUI
import MapKit

struct MapView: UIViewRepresentable {
    func makeUIView(context: Context) -> MKMapView {
            MKMapView(frame: .zero)
        }
    
    func updateUIView(_ uiView: MKMapView, context: Context) {
        
        let coordinate = CLLocationCoordinate2D(latitude: 40.130176, longitude: -8.2012655)
        let span = MKCoordinateSpan(latitudeDelta: 2, longitudeDelta: 20)
        let region = MKCoordinateRegion(center: coordinate, span: span)
        
        uiView.setRegion(region, animated: true)
    }
        
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView()
    }
}
