//
//  DetailGameView.swift
//  GameStream
//
//  Created by Jairo Jair Toro Novellis on 13/02/23.
//

import SwiftUI
import AVKit
import Kingfisher

struct DetailGameView: View {
    var gameViewObject: GameViewObject? = nil
    
    init(_ gameViewObject: GameViewObject? = nil) {
        self.gameViewObject = gameViewObject
    }
    
    var body: some View {
        ZStack {
            Color(.blue)
            
            VStack {
                VideoShow(gameViewObject!.url)
                
                ScrollView {
                    VideoInfo(title: gameViewObject!.title,
                              studio: gameViewObject!.studio,
                              rating: gameViewObject!.calification,
                              publicYear: gameViewObject!.publicYear,
                              description: gameViewObject!.description,
                              tags: gameViewObject!.tags)
                    
                    Gallery(imgsUrl: gameViewObject!.imageUrl)
                    
                    VStack(alignment: .leading) {
                        Text("Comentaries")
                            .foregroundColor(.white)
                            .font(.title)
                            .padding(.leading)
                        
                        VStack {
                            Commentary(date: "12 minutes")
                            Commentary(date: "7 minutes")
                        }.padding(EdgeInsets(top: 0, leading: 5, bottom: 0, trailing: 5))
                    }.frame(maxWidth: .infinity, alignment: .leading)
                    
                }.frame(maxWidth: .infinity)
            }
        }.ignoresSafeArea()
    }
}

struct VideoInfo: View {
    var title: String
    var studio: String
    var rating: String
    var publicYear: String
    var description: String
    var tags: [String]
    
    init(
        title: String,
        studio: String,
        rating: String,
        publicYear: String,
        description: String,
        tags: [String]
    ) {
        self.title = title
        self.studio = studio
        self.rating = rating
        self.publicYear = publicYear
        self.description = description
        self.tags = tags
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("\(title)")
                .foregroundColor(.white)
                .font(.largeTitle)
                .padding(.leading)
            
            HStack {
                Text("\(studio)")
                    .foregroundColor(.white)
                    .font(.subheadline)
                    .padding(.top, 5)
                    .padding(.leading)
                
                Text("\(rating)")
                    .foregroundColor(.white)
                    .font(.subheadline)
                    .padding(.top, 5)
                
                Text("\(publicYear)")
                    .foregroundColor(.white)
                    .font(.subheadline)
                    .padding(.top, 5)
            }
            
            Text("\(description)")
                .foregroundColor(.white)
                .font(.subheadline)
                .padding(.top, 5)
                .padding(.leading)
            
            HStack {
                ForEach(tags, id: \.self) {
                    tag in Text("#\(tag)")
                        .foregroundColor(.white)
                        .font(.subheadline)
                        .padding(.top, 4)
                        .padding(.leading)
                }
            }
            
        }.frame(maxWidth: .infinity, alignment: .leading)
    }
    
}

struct VideoShow: View {
    var url: String
    
    var body: some View {
        VideoPlayer(player: AVPlayer(url: URL(string: url)!))
            .ignoresSafeArea()
    }
    
    init(_ url: String) {
        self.url = url
    }
}

struct Gallery: View {
    var galleryGrid = [
        GridItem(.flexible())
    ]
    
    var imgsUrl: [String]
    
    init(imgsUrl: [String]) {
        self.imgsUrl = imgsUrl
    }
    var body: some View {
        VStack(alignment: .leading) {
            Text("Gallery")
                .foregroundColor(.white)
                .font(.title)
                .padding(.leading)
            
            ScrollView(.horizontal) {
                HStack {
                    LazyHGrid(rows: galleryGrid, spacing: 8) {
                        ForEach(imgsUrl, id: \.self) { img in
                            KFImage(URL(string: img))
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                        }
                    }
                }.frame(height: 180)
            }
            
        }.frame(maxWidth: .infinity, alignment: .leading)
    }
}

struct Commentary: View {
    var userImg: String = "profile-pic"
    var description: String = "He visto que como media tiene una gran calificación, y estoy completamente de acuerdo. Es el mejor juego que he jugado sin ninguna duda, combina una buena trama con una buenísima experiencia de juego libre gracias a su inmenso mapa y actividades."
    var userName: String = "Jairo Toro"
    var date: String
    
    init(date: String) {
        self.date = date
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Image(userImg)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .clipShape(Circle())
                    .frame(width: 30, height: 30)
                
                Text("\(userName)")
                    .foregroundColor(.white)
                    .fontWeight(.bold)
            }
            
            Text("\(description)")
        }.background(Color(.green))
    }
}

struct DetailGameView_Previews: PreviewProvider {
    static var previews: some View {
        DetailGameView()
    }
}
