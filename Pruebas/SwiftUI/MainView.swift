//
//  MainView.swift
//  Pruebas
//
//  Created by David on 5/8/21.
//

import SwiftUI

struct MainView: View {
    var body: some View {
        ScrollView {
            VStack {
                MapView().frame(height: 400)
                ImageView().offset(y: -150)
                Divider()
                PersistenceView()
            }
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
