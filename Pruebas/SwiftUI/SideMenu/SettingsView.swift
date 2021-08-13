//
//  SettingsView.swift
//  Pruebas
//
//  Created by David on 7/8/21.
//

import SwiftUI

struct SettingsView: View {
    var body: some View {
        ZStack {
            Color.purple.ignoresSafeArea()

            VStack{
                List {
                    Text("Hello, World!")
                        .padding()
                        .background(Color.red)
                }
            }
            

        }
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
