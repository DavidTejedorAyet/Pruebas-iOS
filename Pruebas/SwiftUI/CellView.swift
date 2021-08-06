//
//  CellView.swift
//  Pruebas
//
//  Created by David on 5/8/21.
//

import SwiftUI

struct CellView: View {
    
    var user: User
    
    var body: some View {
        HStack {
            user.avatar.resizable().frame(width: 40, height: 40, alignment: .center)
            VStack(alignment: .leading) {
                Text(user.name)
                    .font(.title)
                Text(user.skill)
                    .font(.subheadline)
            }
            Spacer()
        }
    }
}

struct CellView_Previews: PreviewProvider {
    static var previews: some View {
        CellView(user: User(id: 1, name: "David", avatar: Image(systemName:"person.fill"), skill: "Cocinar"))
    }
}
