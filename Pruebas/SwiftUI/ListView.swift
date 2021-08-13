//
//  ListView.swift
//  Pruebas
//
//  Created by David on 5/8/21.
//

import SwiftUI

final class UsersModelData: ObservableObject {
    @Published var users = [User(id: 0, name: "David", avatar: Image(systemName:"person.fill"), skill: "Cocinar", favorite: true),
                            User(id: 1, name: "Alfon", avatar: Image(systemName:"person.fill"), skill: "Programar", favorite: false),
                            User(id: 2, name: "Esther", avatar: Image(systemName:"person.fill"), skill: "Dibujar", favorite: true)]
}


struct ListView: View {
    
    @EnvironmentObject var usersModelData: UsersModelData
    @State private var showFavorites = false
    private var filteredUsers: [User] {
        return usersModelData.users.filter { user in
            return !showFavorites || user.favorite
        }
    }
    
    var body: some View {
        NavigationView {
            VStack {
                Toggle(isOn: $showFavorites) {
                    Text("Mostrar favoritos")
                }.padding()
                
                
                
                List(filteredUsers, id: \.id) {
                    user in
                    NavigationLink(destination: DetailView(user: user, favorite: $usersModelData.users[user.id].favorite)) {
                        CellView(user: user)
                    }
                }
                
            }.navigationTitle("Usuarios")
        }
    }
}

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        ListView().environmentObject(UsersModelData())
    }
}
