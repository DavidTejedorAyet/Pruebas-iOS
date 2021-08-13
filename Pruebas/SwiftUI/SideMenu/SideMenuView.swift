//
//  SideMenuView.swift
//  Pruebas
//
//  Created by David on 9/8/21.
//

import SwiftUI

struct SideMenuView: View {
    
    enum views: String, CaseIterable {
        case calendarList = "CalendarList"
        case profile = "Profile"
        case settings = "Settings"
    }
    
    @State var show: Bool = false
    @State var viewToShow: String = views.calendarList.rawValue
    
    
    var body : some View{
        ZStack{
            (self.show ? Color.black.opacity(0.05) : Color.clear).edgesIgnoringSafeArea(.all)
            
            ZStack(alignment: .leading) {
                VStack(alignment : .leading,spacing: 25){
                    HStack(spacing: 15){
                        Image(systemName: "person")
                            .resizable()
                            .frame(width: 70, height: 70)
                        VStack(alignment: .leading, spacing: 12) {
                            Text("Título")
                                .fontWeight(.bold)
                            Text("Subtitle")
                        }
                    }
                    .padding(.bottom, 50)
                    
                    ForEach(views.allCases,id: \.self){i in
                        Button(action: {
                            self.viewToShow = i.rawValue
                            withAnimation(.spring()){
                                self.show.toggle()
                            }
                        }) {
                            HStack{
                                Capsule()
                                    .fill(self.viewToShow == i.rawValue ? Color.orange : Color.clear)
                                    .frame(width: 5, height: 30)
                                
                                Text(i.rawValue)
                                    .padding(.leading)
                                    .foregroundColor(.black)
                                
                            }
                        }
                    }
                    
                    Spacer()
                }.padding(.leading)
                .padding(.top)
                .scaleEffect(self.show ? 1 : 0)
                
                
                
                
                ZStack(alignment: .topTrailing) {
                    
                    VStack(spacing: 0){
                        ZStack{
                            HStack{
                                Button(action: {
                                    withAnimation(.spring()){
                                        self.show.toggle()
                                    }
                                    
                                }) {
                                    Image(systemName: "list.bullet")
                                        .resizable()
                                        .frame(width: 20, height: 20)
                                        .foregroundColor(.black)
                                }
                                
                                Spacer()
                                
                                Button(action: {
                                }) {
                                    Image("menudot")
                                        .resizable()
                                        .frame(width: 18, height: 18)
                                        .foregroundColor(.black)
                                }
                            }
                            
                            
                        }
                        .padding(.horizontal)
                        .padding(.vertical, 10)
                        
                        NavigationView {
                            ZStack{
                                Text("").opacity(self.viewToShow == views.calendarList.rawValue ? 1 : 0)
                                Text("").opacity(self.viewToShow == views.profile.rawValue ? 1 : 0)
                                SettingsView().opacity(self.viewToShow == views.settings.rawValue ? 1 : 0)
                                
                            }
                        }
                        
                    }
                    .scaleEffect(self.show ? 0.85 : 1)
                    .offset(x: self.show ? 150 : 0,y : self.show ? 50 : 0)
                    .disabled(self.show ? true : false)
                    
                    
                    
                    Button(action: {
                        
                        withAnimation(.spring()){
                            self.show.toggle()
                        }
                        
                    }) {
                        
                        Image(systemName: "xmark")
                            .resizable()
                            .frame(width: 25, height: 25)
                            .foregroundColor(.black)
                        
                    }.padding()
                    .opacity(self.show ? 1 : 0)
                }
                
            }
            .padding(.top, 20)
            
        }.background(Color.yellow)
        
        
        
        
    }
}

struct SideMenuView_Previews: PreviewProvider {
    static var previews: some View {
        ForEach(ColorScheme.allCases, id: \.self, content: SideMenuView().preferredColorScheme)
    }
}
