//
//  ContentView.swift
//  Pruebas
//
//  Created by David on 4/8/21.
//

import SwiftUI
import CoreData

struct ContentView: View {
    var body: some View {
        VStack(alignment: .trailing, spacing: 23) {
            Text("Hola mundo!").font(.title).padding().background(Color.gray)
            
            Spacer()
            
            HStack {
                Text("Segundo texto ole ole ole").padding().background(Color.gray)
                Spacer()
                
                Text("Tercer texto")
            }
            

        }.background(Color.yellow)
        
        
        
        
    }
}

//Muestra en el canvas la representación grafica de la view
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
