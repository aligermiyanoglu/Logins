//
//  String+Validation.swift
//  Logins
//
//  Created by CTW00708-Admin on 19/02/2021.
//

import Foundation

final class StringValidator {
    func isValid(email: String) -> Bool {
        let mailRegex = "^[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,6}$"
        let mailPredicate = NSPredicate.init(format: "SELF MATCHES %@",mailRegex)
    
        return mailPredicate.evaluate(with: email)
    }
}
