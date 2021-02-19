//
//  CountryListViewModel.swift
//  Logins
//
//  Created by CTW00708-Admin on 19/02/2021.
//

import Foundation

final class CountryListViewModel {
    let user: User
    let countryList: [String]
    
    init(user: User, countryList: [String]) {
        self.user = user
        self.countryList = countryList
    }
}
