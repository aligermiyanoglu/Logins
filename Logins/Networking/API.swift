//
//  API.swift
//  Logins
//
//  Created by CTW00708-Admin on 15/02/2021.
//

import Foundation

enum API {
    case users
    
    var requestURL: URL? {
        switch self {
        case .users:
            return URL(string: "https://jsonplaceholder.typicode.com/users")
        }
    }
}
