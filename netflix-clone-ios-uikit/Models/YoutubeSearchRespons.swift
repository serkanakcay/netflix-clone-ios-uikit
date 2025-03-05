//
//  YoutubeSearchResponse.swift
//  netflix-clone-ios-uikit
//
//  Created by serkan on 3.03.2025.
//

import Foundation

struct YoutubeSearchResponse: Codable {
    let items: [VideoElement]
}


struct VideoElement: Codable{
    let id: IdVideoElement
}

struct IdVideoElement: Codable{
    let kind: String
    let videoId: String?
}
