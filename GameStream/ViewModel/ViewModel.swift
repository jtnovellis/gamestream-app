//
//  ViewModel.swift
//  GameStream
//
//  Created by Jairo Jair Toro Novellis on 13/02/23.
//

import Foundation

class ViewModel: ObservableObject {
    // public variable that contain all the info from request to server/backend
    @Published var gamesInfo = [Game]()
    // inicialize the petition once app starts
    init() {
        // convert from string to type URL
        let url = URL(string: "https://gamestreamapi.herokuapp.com/api/games")!
        // Generate the Request with the URL
        var request = URLRequest(url: url)
        // Define the http method
        request.httpMethod = "GET"
        // Open a sesion
        URLSession.shared.dataTask(with: request) { data, response, error in
            // the do and catch is to ensure to catch an error inside the request
            do {
                // create a constant if you can obtain data
                if let jsonData = data {
                    print("Size of JSON \(jsonData)")
                    // decode the data from request
                    let decodeData = try JSONDecoder().decode([Game].self, from: jsonData)
                    // make the code async to open another thread
                    DispatchQueue.main.async {
                        // To asign all de decode data to the public variable
                        self.gamesInfo.append(contentsOf: decodeData)
                    }
                }
            } catch {
                print("The error, \(error)")
            }
        }.resume()
    }
}
