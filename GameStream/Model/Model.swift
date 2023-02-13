//
//  Model.swift
//  GameStream
//
//  Created by Jairo Jair Toro Novellis on 13/02/23.
//

import Foundation

struct Results: Codable {
    var results: [Game]
}

struct Games: Codable {
    let games: [Game]
}

struct Game: Codable, Hashable {
    let title, studio, contentRaiting, publicationYear: String
    let description: String
    let platforms, tags: [String]
    let videosUrls: VideosUrls
    let galleryImages: [String]
}

struct VideosUrls: Codable, Hashable {
    let mobile, tablet: String
}
