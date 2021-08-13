//
//  DetailView.swift
//  Pruebas
//
//  Created by David on 6/8/21.
//

import SwiftUI

struct DetailView: View {
    
    var user: User
    @Binding var favorite: Bool
    
    var body: some View {
        VStack {
            user.avatar.resizable().frame(width: 200, height: 200).clipShape(Circle()).overlay(Circle().stroke(Color.black, lineWidth: 5)).shadow(color: Color.gray, radius: 5)
            HStack {
                Text(user.name).font(.largeTitle)
                Button {
                    favorite.toggle()
                } label: {
                    Image(systemName: (favorite ? "star.fill" : "star")).foregroundColor(.yellow)
                }
            }
            Text(user.skill)
            Spacer()
        }
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(user: User(id: 3, name: "Esther", avatar: Image(systemName:"person.fill"), skill: "Dibujar", favorite: true), favorite: .constant(false))
    }
}
