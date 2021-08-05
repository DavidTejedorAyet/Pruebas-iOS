//
//  ImageView.swift
//  Pruebas
//
//  Created by David on 4/8/21.
//

import SwiftUI

struct ImageView: View {
    var body: some View {
        Image("michi").resizable().background(Color.gray).scaledToFit().clipShape(Circle()).overlay(Circle().stroke(Color.blue)).shadow(radius: 10)
    }
}

struct ImageView_Previews: PreviewProvider {
    static var previews: some View {
        ImageView()
    }
}
