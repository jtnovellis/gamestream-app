//
//  SearchGameModel.swift
//  GameStream
//
//  Created by Jairo Jair Toro Novellis on 13/02/23.
//

import Foundation

class SearchGameModel: ObservableObject {
    @Published var gameInfo = [Game]()
    
    func search(gameName: String) {
        gameInfo.removeAll()
        var gameNameSpaces = gameName.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
        var url = URL(string: "https://gamestreamapi.herokuapp.com/api/search?contains=\(gameNameSpaces ?? "cuphead")")!
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        URLSession.shared.dataTask(with: request) { data, response, error in
            do {
                if let jsonData = data {
                    print("Size of JSON \(jsonData)")
                    let decodeData = try JSONDecoder().decode(Results.self, from: jsonData)
                    DispatchQueue.main.async {
                        self.gameInfo.append(contentsOf: decodeData.results)
                    }
                }
            } catch {
                print("The error, \(error)")
            }
        }.resume()
        
    }
}
