//
//  CTBMain.swift
//  Pruebas
//
//  Created by David on 12/8/21.
//

import SwiftUI

struct CTBMain: View {
    @StateObject var tabbarController: TabbarViewController
    
    var body: some View {
        GeometryReader { geometry in
            
            VStack {
                Spacer()
                switch tabbarController.currentPage {
                case .home:
                    Text("Home")
                case .liked:
                    Text("Liked")
                case .records:
                    Text("Records")
                case .user:
                    Text("User")
                }
                Spacer()
                TabbarView(tabbarController: tabbarController, geometry: geometry)
                
            }
            
            
        }.edgesIgnoringSafeArea(.bottom)
    }
}

struct CTBMain_Previews: PreviewProvider {
    static var previews: some View {
        CTBMain(tabbarController: TabbarViewController())
    }
}


