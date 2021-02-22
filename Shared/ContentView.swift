//
//  ContentView.swift
//  Shared
//
//  Created by Motonari NAKASHIMA on 2021/02/22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            NavigationView {
                NestableView()
            }
            .tabItem {
                Text("NestableView")
            }
            
            NavigationView {
                UnNestableView()
            }
            .tabItem {
                Text("UnNestableView")
            }
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
