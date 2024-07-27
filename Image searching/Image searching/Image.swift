//
//  Image.swift
//  Image searching
//
//  Created by Victoria Samsonova on 27.07.24.
//

import Foundation

struct APIResponse : Codable, Hashable {
    let results: [Result]
}

struct Result : Codable, Hashable, Identifiable {
    let id : Int
    let urls : URLS
}

struct URLS : Codable, Hashable {
    let regular : String
}
