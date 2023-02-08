//
//  HomeView.swift
//  GameStream
//
//  Created by Jairo Jair Toro Novellis on 7/02/23.
//

import SwiftUI

struct HomeView: View {
    @State var tabSelected: Int = 2
    
    init() {
        UITabBar.appearance().backgroundColor = UIColor(Color("tabColor").opacity(0.8))
        print("Starting Home View")
    }
    
    var body: some View {
        TabView(selection: $tabSelected) {
            Text("Perfil").font(.system(size: 30, weight: .bold, design: .rounded)).tabItem {
                Image(systemName: "person")
                Text("Perfil")
            }.tag(0).toolbarBackground(Color.white, for: .tabBar)
            Text("Juegos").font(.system(size: 30, weight: .bold, design: .rounded)).tabItem {
                Image(systemName: "gamecontroller")
                Text("Juegos")
            }.tag(1).toolbarBackground(Color.white, for: .tabBar)
            HomeScreenView().tabItem {
                Image(systemName: "house")
                Text("Inicio")
            }.tag(2).toolbarBackground(Color.white, for: .tabBar)
            Text("Favoritos").font(.system(size: 30, weight: .bold, design: .rounded)).tabItem {
                Image(systemName: "heart")
                Text("Favoritos")
            }.tag(3).toolbarBackground(Color.white, for: .tabBar)
        }.accentColor(.white).navigationBarBackButtonHidden(true)
    }
}

struct HomeScreenView: View {
    @State var searchText: String = ""
    
    func search() {
        print("searching \(searchText)")
    }
    var body: some View {
        ZStack {
            Color(red: 21/255, green: 31/255, blue: 53/255).ignoresSafeArea()
            VStack {
                Image("appLogo").resizable().aspectRatio(contentMode: .fit).frame(width: 250).padding(.vertical, 11)
                HStack {
                    Button {
                        search()
                    } label: {
                        Image(systemName: "magnifyingglass").foregroundColor(searchText.isEmpty ? Color(.yellow) : Color("darkCyan"))
                    }
                    ZStack(alignment: .leading) {
                        if searchText.isEmpty {
                            Text("Buscar un video").foregroundColor(Color(red: 147/255, green: 177/255, blue: 185/255, opacity: 1.0))
                            
                        }
                        TextField("",text: $searchText).foregroundColor(.white)
                        
                    }
                }.padding([.top, .leading, .bottom], 11).background(Color(red: 40/255, green: 55/255, blue: 88/255)).clipShape(Capsule())
            }.padding(.horizontal, 28)
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
