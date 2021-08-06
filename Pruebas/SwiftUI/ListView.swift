//
//  ListView.swift
//  Pruebas
//
//  Created by David on 5/8/21.
//

import SwiftUI

private let users = [User(id: 1, name: "David", avatar: Image(systemName:"person.fill"), skill: "Cocinar"),
                     User(id: 2, name: "Alfon", avatar: Image(systemName:"person.fill"), skill: "Programar"),
                          User(id: 3, name: "Esther", avatar: Image(systemName:"person.fill"), skill: "Dibujar")]

struct ListView: View {
    var body: some View {
        List(users, id: \.id) {
            user in 
            CellView(user: user)
        }
    }
}

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        ListView()
    }
}
