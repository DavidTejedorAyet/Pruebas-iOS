//
//  TabbarViewController.swift
//  Pruebas
//
//  Created by David on 12/8/21.
//

import SwiftUI

enum Page {
     case home
     case liked
     case records
     case user
 }

class TabbarViewController: ObservableObject {
    
    @Published var currentPage: Page = .home

}
