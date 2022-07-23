//
//  Response.swift
//  MovieDatabase
//
//  Created by Maksim Turkin on 23.07.2022.
//

import Foundation

struct ResponseData : Codable {
    let page : Int?
    let results : [Movie]?
    let total_pages : Int?
    let total_results : Int?

    enum CodingKeys: String, CodingKey {

        case page = "page"
        case results = "results"
        case total_pages = "total_pages"
        case total_results = "total_results"
    }
}

