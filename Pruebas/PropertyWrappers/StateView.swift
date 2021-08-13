//
//  StateView.swift
//  Pruebas
//
//  Created by David on 6/8/21.
//

import SwiftUI

class UserData: ObservableObject {
    @Published var name = "David"
    @Published var age = 22
}

struct StateView: View {
    
    @State private var value = 0
    @State private var selection: Int?
    @StateObject private var user = UserData()
    var body: some View {
        NavigationView {
            VStack {
                Text("El valor actual es \(value)")
                Button("Suma 1") {
                    value += 1
                }
                Text("Min nombre es \(user.name) y tengo \(user.age) años")
                Button("Actualizar datos") {
                    user.age = value
                }
                NavigationLink(destination: BindingView(value: $value, user: user), tag: 1, selection: $selection) {
                    Button("Ir a BindingView") {
                        selection = 1
                    }
                    
                }
            }.navigationTitle("State")
        }
    }
}

struct StateView_Previews: PreviewProvider {
    static var previews: some View {
        StateView().environmentObject(UserData())
    }
}
