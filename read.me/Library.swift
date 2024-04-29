//
//  Library.swift
//  read.me
//
//  Created by Jasmine Ben-Whyte on 19/4/24.
//

import Foundation

//struct LibraryResponse: Codable {
//    let entries: [Book]
//}

struct Book {
    let title: String
    let overview: String
    let poster: String
    let bookContents: [[String]]
}

//refactored from a struct conforming to an api request to one used to create mock data
//struct Book: Codable {
//    let title: String
//    let url: String
//    let picture: Picture?
//}

struct Picture: Codable {
    let url: String?
}

struct DescriptionResponse: Codable {
    let description: Description?
}

struct Description: Codable {
    let value: String
}
                            
