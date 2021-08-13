//
//  TBMainView.swift
//  Pruebas
//
//  Created by David on 9/8/21.
//

import SwiftUI

struct TBMainView: View {
    var body: some View {
        NavigationView {
            TabView {
                StateView().tabItem {
                    Label("STATE", systemImage:"list.dash")
                }
                
                MapView().tabItem {
                    Label("MAP", systemImage:"map")
                }
            }
        }
    }
}

struct TBMainView_Previews: PreviewProvider {
    static var previews: some View {
        TBMainView()
    }
}
