//
//  EnvironmnetView.swift
//  Pruebas
//
//  Created by David on 6/8/21.
//

import SwiftUI

struct EnvironmnetView: View {
    
    @EnvironmentObject var user: UserData
    
    var body: some View {
        Text(user.name)
    }
}

struct EnvironmnetView_Previews: PreviewProvider {
    static var previews: some View {
        EnvironmnetView().environmentObject(UserData())
    }
}
