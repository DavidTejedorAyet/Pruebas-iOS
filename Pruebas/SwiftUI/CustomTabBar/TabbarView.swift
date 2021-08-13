//
//  TabbarView.swift
//  Pruebas
//
//  Created by David on 12/8/21.
//

import SwiftUI

struct TabbarIcon: View {
    @StateObject var tabbarController: TabbarViewController
    let width, height: CGFloat
    let systemIconName, tabName: String
    let assignedPage: Page
    
    var body: some View {
        VStack {
            Image(systemName: systemIconName)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: width, height: height)
                .padding(.top, 10)
            Text(tabName)
                .font(.footnote)
            Spacer()
        }.padding(.horizontal, -4)
        .foregroundColor(tabbarController.currentPage == assignedPage ? Color("TabBarHighlight") : .gray)
        .onTapGesture {
            tabbarController.currentPage = assignedPage
            print("Tocando \(tabbarController.currentPage)")
        }
    }
}

struct TabbarView: View {
    @StateObject var tabbarController: TabbarViewController
    @State var showPopUp = false
    
    var geometry: GeometryProxy
    var body: some View {
        
        ZStack {
            if showPopUp {
                PlusMenu(widthAndHeight: geometry.size.width/8)
                    .offset(y: -geometry.size.height/6)
            }
            HStack {
                TabbarIcon(tabbarController: tabbarController, width: geometry.size.width/5, height: geometry.size.height/28, systemIconName: "homekit", tabName: "Home", assignedPage: .home)
                TabbarIcon(tabbarController: tabbarController, width: geometry.size.width/5, height: geometry.size.height/28, systemIconName: "heart", tabName: "liked", assignedPage: .liked)
                
                ZStack {
                    Circle()
                        .foregroundColor(.white)
                        .frame(width: geometry.size.width/7, height: geometry.size.width/7)
                        .shadow(radius: 4)
                    Image(systemName: "plus.circle.fill")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: geometry.size.width/7-6 , height: geometry.size.width/7-6)
                        .foregroundColor(Color("DarkPurple"))
                        .rotationEffect(Angle(degrees: showPopUp ? 90 : 0))
                }.offset(y: -geometry.size.height/8/2)
                .onTapGesture {
                    withAnimation {
                        showPopUp.toggle()
                    }
                }
                
                TabbarIcon(tabbarController: tabbarController, width: geometry.size.width/5, height: geometry.size.height/28, systemIconName: "waveform", tabName: "Records", assignedPage: .records)
                TabbarIcon(tabbarController: tabbarController, width: geometry.size.width/5, height: geometry.size.height/28, systemIconName: "person.crop.circle", tabName: "Account", assignedPage: .user)
            }
            .frame(width: geometry.size.width, height: geometry.size.height/8)
            .background(Color("TabBarBackground").shadow(radius: 3))
        }
    }
    
}

struct PlusMenu: View {
    
    let widthAndHeight: CGFloat
    
    var body: some View {
        HStack(spacing: 50) {
            ZStack {
                Circle()
                    .foregroundColor(Color("DarkPurple"))
                    .frame(width: widthAndHeight, height: widthAndHeight)
                Image(systemName: "record.circle")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .padding(15)
                    .frame(width: widthAndHeight, height: widthAndHeight)
                    .foregroundColor(.white)
            }
            ZStack {
                Circle()
                    .foregroundColor(Color("DarkPurple"))
                    .frame(width: widthAndHeight, height: widthAndHeight)
                Image(systemName: "folder")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .padding(15)
                    .frame(width: widthAndHeight, height: widthAndHeight)
                    .foregroundColor(.white)
            }
        }.transition(.scale)
    }
}

struct TabbarView_Previews: PreviewProvider {
    static var previews: some View {
        GeometryReader { geometry in
            VStack {
                Spacer()
                Text("Home")
                Spacer()
                TabbarView(tabbarController: TabbarViewController(), geometry: geometry)
                
            }
            
        }.edgesIgnoringSafeArea(.bottom)
    }
}
