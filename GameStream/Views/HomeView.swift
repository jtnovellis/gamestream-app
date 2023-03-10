//
//  HomeView.swift
//  GameStream
//
//  Created by Jairo Jair Toro Novellis on 7/02/23.
//

import SwiftUI
import AVKit

struct HomeView: View {
    @State var tabSelected: Int = 2
    
    init() {
        UITabBar.appearance().backgroundColor = UIColor(Color("tabColor").opacity(0.8))
        UITabBar.appearance().isTranslucent = true
        print("Starting Home View")
    }
    
    var body: some View {
        TabView(selection: $tabSelected) {
            Text("Perfil").font(.system(size: 30, weight: .bold, design: .rounded)).tabItem {
                Image(systemName: "person")
                Text("Perfil")
            }.tag(0).toolbarBackground(Color.black, for: .tabBar)
            GameView().tabItem {
                Image(systemName: "gamecontroller")
                Text("Juegos")
            }.tag(1).toolbarBackground(Color.black, for: .tabBar)
            HomeScreenView().tabItem {
                Image(systemName: "house")
                Text("Inicio")
            }.tag(2).toolbarBackground(Color.black, for: .tabBar)
            Text("Favoritos").font(.system(size: 30, weight: .bold, design: .rounded)).tabItem {
                Image(systemName: "heart")
                Text("Favoritos")
            }.tag(3).toolbarBackground(Color.black, for: .tabBar)
        }.accentColor(.white).navigationBarBackButtonHidden(true)
    }
}

struct HomeScreenView: View {
    var body: some View {
        ZStack {
            Color(red: 21/255, green: 31/255, blue: 53/255).ignoresSafeArea()
            VStack {
                Image("appLogo").resizable().aspectRatio(contentMode: .fit).frame(width: 250).padding(.vertical, 11)
                
                ScrollView(showsIndicators: false) {
                    SubModuloHome()
                }
            }.padding(.horizontal, 28)
        }
    }
}

struct SubModuloHome: View {
    @State var url = VideosUrls(mobile: "", tablet: "")
    @State var title: String = ""
    @State var studio: String = ""
    @State var calification: String = ""
    @State var publicYear: String = ""
    @State var description: String = ""
    @State var tags: [String] = [""]
    @State var imageUrl: [String] = [""]
    @State var platforms: [String] = [""]

    
    let urlVideos: [String] = [
        "https://cdn.cloudflare.steamstatic.com/steam/apps/256658589/movie480.mp4","https://cdn.cloudflare.steamstatic.com/steam/apps/256671638/movie480.mp4","https://cdn.cloudflare.steamstatic.com/steam/apps/256720061/movie480.mp4","https://cdn.cloudflare.steamstatic.com/steam/apps/256814567/movie480.mp4","https://cdn.cloudflare.steamstatic.com/steam/apps/256705156/movie480.mp4","https://cdn.cloudflare.steamstatic.com/steam/apps/256801252/movie480.mp4","https://cdn.cloudflare.steamstatic.com/steam/apps/256757119/movie480.mp4"
    ]
    @State var newUrl: String = ""
    
    @State var searchText: String = ""
    @State var isPlayerActive = false
    @State var isGameInfoEmpty = false
    @ObservedObject var gameFound = SearchGameModel()
    @State var isGameViewActive = false
    
    
    func searchGame(name: String) {
        gameFound.search(gameName: name)
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.3) {
            print("amount E: \(gameFound.gameInfo.count)")
            
            if gameFound.gameInfo.count == 0 {
                isGameInfoEmpty = true
            } else {
                url = gameFound.gameInfo[0].videosUrls
                title = gameFound.gameInfo[0].title
                studio = gameFound.gameInfo[0].studio
                calification = gameFound.gameInfo[0].contentRaiting
                publicYear = gameFound.gameInfo[0].publicationYear
                description = gameFound.gameInfo[0].description
                tags = gameFound.gameInfo[0].tags
                imageUrl = gameFound.gameInfo[0].galleryImages
                platforms = gameFound.gameInfo[0].platforms
                
                isGameInfoEmpty = true
            }
        }
    }
    
    var body: some View {
        VStack {
            HStack {
                Button {
                    searchGame(name: searchText)
                } label: {
                    Image(systemName: "magnifyingglass").foregroundColor(searchText.isEmpty ? Color(.yellow) : Color("darkCyan"))
                }.alert("Important!",isPresented: $isGameInfoEmpty) {
                    Button("OK", role: .cancel) {}
                } message: {
                    Text("Game not found")
                }
                
                ZStack(alignment: .leading) {
                    if searchText.isEmpty {
                        Text("Buscar un video").foregroundColor(Color(red: 147/255, green: 177/255, blue: 185/255, opacity: 1.0))
                        
                    }
                    TextField("",text: $searchText).foregroundColor(.white)
                    
                }
            }.padding([.top, .leading, .bottom], 11).background(Color(red: 40/255, green: 55/255, blue: 88/255)).clipShape(Capsule())
            
            Text("LOS M??S POPULARES")
                .font(.title3)
                .foregroundColor(.white)
                .bold()
                .frame(minWidth: 0,maxWidth: .infinity, alignment: .leading)
                .padding(.top)
        }
        NavigationLink {
            DetailGameView(GameViewObject(game: Game(title: title, studio: studio, contentRaiting: calification, publicationYear: publicYear, description: description, platforms: platforms, tags: tags, videosUrls: url, galleryImages: imageUrl)))
        } label: {
            ZStack {
                Button {
                    newUrl = urlVideos[0]
                    print("url: \(newUrl)")
                    isPlayerActive = true
                } label: {
                    VStack(spacing: 0) {
                        Image("thewitcher")
                            .resizable()
                            .scaledToFill()
                        Text("The Witcher 3")
                            .foregroundColor(.white)
                            .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                            .background(Color(red: 40/255, green: 55/255, blue: 88/255))
                    }
                }
                Image(systemName: "play.circle.fill")
                    .resizable()
                    .foregroundColor(.white)
                    .frame(width: 42, height: 42)
                
            }.frame(minWidth: 0,maxWidth: .infinity, alignment: .center)
                .padding(.vertical)
        }
        Text("CATEGORIAS SUGERIDAS")
            .foregroundColor(.white)
            .font(.title3)
            .bold()
            .frame(minWidth: 0,maxWidth: .infinity, alignment: .leading)
        ScrollView(.horizontal, showsIndicators: false) {
            HStack {
                Button {
                    newUrl = urlVideos[0]
                    print("url: \(newUrl)")
                    isPlayerActive = true
                } label: {
                    ZStack {
                        RoundedRectangle(cornerRadius: 8)
                            .fill(Color(red: 40/255, green: 55/255, blue: 88/255))
                            .frame(width: 160, height: 90)
                        Image("fps")
                            .resizable()
                            .scaledToFill()
                            .frame(width: 32, height: 22)
                    }
                }
                Button {
                    newUrl = urlVideos[0]
                    print("url: \(newUrl)")
                    isPlayerActive = true
                } label: {
                    ZStack {
                        RoundedRectangle(cornerRadius: 8)
                            .fill(Color(red: 40/255, green: 55/255, blue: 88/255))
                            .frame(width: 160, height: 90)
                        Image("rpg-icon")
                            .resizable()
                            .scaledToFill()
                            .frame(width: 32, height: 22)
                    }
                }
                Button {
                    newUrl = urlVideos[0]
                    print("url: \(newUrl)")
                    isPlayerActive = true
                } label: {
                    ZStack {
                        RoundedRectangle(cornerRadius: 8)
                            .fill(Color(red: 40/255, green: 55/255, blue: 88/255))
                            .frame(width: 160, height: 90)
                        Image("open-world-icon")
                            .resizable()
                            .scaledToFill()
                            .frame(width: 32, height: 22)
                    }
                }
            }
        }
        
        Text("RECOMENDADOS PARA TI")
            .foregroundColor(.white)
            .font(.title3)
            .bold()
            .frame(minWidth: 0,maxWidth: .infinity, alignment: .leading)
            .padding(.top)
        ScrollView(.horizontal, showsIndicators: false) {
            HStack {
                Button {
                    newUrl = urlVideos[1]
                    isPlayerActive = true
                    print("this is the category")
                } label: {
                    ZStack {
                        Image("battkefield")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 240, height: 135)
                    }
                }
                Button {
                    newUrl = urlVideos[2]
                    isPlayerActive = true
                    print("this is the category")
                } label: {
                    ZStack {
                        Image("rectangle5")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 240, height: 135)
                    }
                }
            }
        }
        
        Text("VIDEOS QUE PODR??AN GUSTARTE")
            .foregroundColor(.white)
            .font(.title3)
            .bold()
            .frame(minWidth: 0,maxWidth: .infinity, alignment: .leading)
            .padding(.top)
        ScrollView(.horizontal, showsIndicators: false) {
            HStack {
                Button {
                    newUrl = urlVideos[3]
                    isPlayerActive = true
                    print("this is the category")
                } label: {
                    ZStack {
                        Image("assassins_creed")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 240, height: 135)
                    }
                }
                Button {
                    newUrl = urlVideos[4]
                    isPlayerActive = true
                    print("this is the category")
                } label: {
                    ZStack {
                        Image("uncharted4")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 240, height: 135)
                    }
                }
            }
        }
    }
}


struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
