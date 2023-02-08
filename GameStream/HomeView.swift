//
//  HomeView.swift
//  GameStream
//
//  Created by Jairo Jair Toro Novellis on 7/02/23.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        TabView {
            Text("Perfil").font(.system(size: 30, weight: .bold, design: .rounded)).tabItem {
                Image(systemName: "person")
                Text("Perfil")
            }
            Text("Juegos").font(.system(size: 30, weight: .bold, design: .rounded)).tabItem {
                Image(systemName: "gamecontroller")
                Text("Juegos")
            }
            Text("Inicio").font(.system(size: 30, weight: .bold, design: .rounded)).tabItem {
                Image(systemName: "house")
                Text("Inicio")
            }
            Text("Favoritos").font(.system(size: 30, weight: .bold, design: .rounded)).tabItem {
                Image(systemName: "heart")
                Text("Favoritos")
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
