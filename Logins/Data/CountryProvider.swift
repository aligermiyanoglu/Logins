//
//  CountryProvider.swift
//  Logins
//
//  Created by CTW00708-Admin on 15/02/2021.
//

import Foundation

class CountryProvider {
    static let countries: [String] = NSLocale.isoCountryCodes.compactMap  { code in
        let id = NSLocale.localeIdentifier(fromComponents: [NSLocale.Key.countryCode.rawValue: code])
        let name = NSLocale(localeIdentifier: "en_UK").displayName(forKey: NSLocale.Key.identifier, value: id)
         
        return name
    }
}