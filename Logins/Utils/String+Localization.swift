//
//  String+Localization.swift
//  Logins
//
//  Created by CTW00708-Admin on 19/02/2021.
//

import Foundation

extension String {
    var localized: String {
        return NSLocalizedString(self, comment: self)
    }
}
