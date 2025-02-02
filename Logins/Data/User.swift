//
//  User.swift
//  Logins
//
//  Created by CTW00708-Admin on 15/02/2021.
//

import Foundation

struct UserCrededentials {
    let email: String
    let password: String
}

struct LoginUser: Decodable {
    let email: String
    let country: Country
}

struct User: Decodable {
    let id: Int
    let name: String
    let username: String
    let email: String
    let address: Address
}
