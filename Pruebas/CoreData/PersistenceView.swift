//
//  ContentView.swift
//  Pruebas
//
//  Created by David on 4/8/21.
//

import SwiftUI
import CoreData

struct PersistenceView: View {
    
    @Environment(\.managedObjectContext) var managedObjectContext
    
    @FetchRequest(entity: Film.entity(), sortDescriptors: [NSSortDescriptor(keyPath: \Film.name, ascending: true)]
    ) var films: FetchedResults<Film>
    
    
    var body: some View {
        VStack(alignment: .trailing, spacing: 23) {
            Button(action: {
                let film = Film(context: managedObjectContext)
                film.name = "Peli"
                film.desc = "pelicula numero \(1...5)"
                PersistenceController.shared.save()
            }, label: {
                Text("Add film")
            }).padding()
            
            
            List {
                ForEach(films, id: \.self) { film in
                    Text("\(film.name ?? "Unknown")")
                    Text("\(film.desc ?? "")")
                }
            }
        }
        
        
        
        
    }
}

//Muestra en el canvas la representación grafica de la view
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        PersistenceView()
    }
}
