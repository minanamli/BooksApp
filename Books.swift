//
//  Books.swift
//  BooksApp
//
//  Created by Mina Namlı on 21.09.2022.
//

import Foundation
import UIKit

struct Response{
    let results : [Books]

    enum CodingKeys: String, CodingKey{
        case results = "results"
    }
}

struct Books{
    var name: String?
    var artistName: String?
    var image: UIImage?
    var releaseDate: String?

    enum CodingKeys: String, CodingKey{
        case name = "name"
        case artistName = "artistName"
        case releaseDate = "releaseDate"
        case artworkUrl100 = "artworkUrl100"
    }
    
}
