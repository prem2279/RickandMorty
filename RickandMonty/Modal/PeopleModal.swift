//
//  PeopleModal.swift
//  Zoho People
//
//  Created by Prem Kumar Gundu on 5/29/26.
//

struct PeopleApiResponse: Codable {
    let info: Info
    let results: [People]
}

struct People: Codable {
    let id: Int
    let name: String
    let status: String
    let species: String
    let type: String
    let gender: String
    let origin: Location
    let location: Location
    let image: String
    let episode: [String]
    let url: String
    let created: String
    
    
}

struct Location: Codable {
    let name: String
    let url: String
}

struct Info: Codable {
    let count: Int
    let pages: Int
    let next: String?
    let prev: String?
}
