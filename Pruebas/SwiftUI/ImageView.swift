//
//  ImageView.swift
//  Pruebas
//
//  Created by David on 4/8/21.
//

import SwiftUI

struct ImageView: View {
    var body: some View {
        VStack(alignment: .center, spacing: 30) {
            Image("michi").resizable().padding(80).background(Color.gray).scaledToFill().frame(width: 300, height: 300).clipShape(Circle()).overlay(Circle().stroke(Color.blue, lineWidth: 9)).shadow(radius: 10)
            
            
        }
    }
}

struct ImageView_Previews: PreviewProvider {
    static var previews: some View {
        ImageView()
    }
}
