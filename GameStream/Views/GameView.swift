//
//  GameView.swift
//  GameStream
//
//  Created by Jairo Jair Toro Novellis on 13/02/23.
//

import SwiftUI
import Kingfisher

struct GameView: View {
    @ObservedObject var allGames = ViewModel()
    @State var gameviewIsActive: Bool = false
    @State var url: String = ""
    @State var title: String = ""
    @State var studio: String = ""
    @State var calification: String = ""
    @State var publicYear: String = ""
    @State var description: String = ""
    @State var tags: [String] = [""]
    @State var imageUrl: [String] = [""]
    
    let formGird = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    var body: some View {
        
        ZStack {
            Color(.blue).ignoresSafeArea()
            VStack {
                Text("Games")
                    .font(.title2)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .padding(EdgeInsets(top: 16, leading: 0, bottom: 64, trailing: 0))
                
                ScrollView {
                    LazyVGrid(columns: formGird, spacing: 8) {
                        ForEach(allGames.gamesInfo, id: \.self) {
                            game in Button {
                                url = game.videosUrls.mobile
                                title = game.title
                                studio = game.studio
                                calification = game.contentRaiting
                                publicYear = game.publicationYear
                                description = game.description
                                tags = game.tags
                                imageUrl = game.galleryImages
                                
                                print("Touch the \(game.title)")
                            } label: {
                                KFImage(URL(string: game.galleryImages[0])!)
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .clipShape(RoundedRectangle(cornerRadius: 4))
                                    .padding(.bottom, 12)
                            }

                        }
                    }
                }
            }.padding(.horizontal, 6)
        }.navigationBarBackButtonHidden(true)
            .onAppear(
                perform: {
                    print("\(allGames.gamesInfo[0].title)")
                    print("\(allGames.gamesInfo[1].title)")
                    print("\(allGames.gamesInfo[2].title)")
                }
            )
        
    }
}

struct GameView_Previews: PreviewProvider {
    static var previews: some View {
        GameView()
    }
}
