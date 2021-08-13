//
//  BindingView.swift
//  Pruebas
//
//  Created by David on 6/8/21.
//

import SwiftUI

struct BindingView: View {
    
    @Binding var value: Int
    @ObservedObject var user: UserData
    @State private var selection: Int?

    var body: some View {
        VStack {
            Button("Suma 2") {
                value += 2
            }
            
            Button("Actualizar datos") {
                user.name = "Cambiado"
                user.age = 23
            }
            NavigationLink(destination: EnvironmnetView(), tag: 1, selection: $selection) {
                Button("Ir a Environment") {
                    selection = 1
                }
                
            }
        }
    }
    
}

struct BindingView_Previews: PreviewProvider {
    static var previews: some View {
        BindingView(value: .constant(5), user: UserData())
    }
}
