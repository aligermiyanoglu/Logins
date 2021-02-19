//
//  Address.swift
//  Logins
//
//  Created by CTW00708-Admin on 19/02/2021.
//

import Foundation

struct Address: Decodable {
    let street: String
    let geo: Geo
    let city: String
    let zipcode: String
    let suite: String

    var fullAddress: String {
        "\(street), \(suite), \(zipcode)-\(city)"
    }
}

struct Geo: Decodable {
    let lat: String
    let lng: String
}
