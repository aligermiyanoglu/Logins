//
//  LoginViewModel.swift
//  Logins
//
//  Created by CTW00708-Admin on 19/02/2021.
//

import Foundation

protocol LoginViewModelProtocol: ErrorModel {
    var loginStateObservable: Observable<Bool> { get }
    var authorizedUserObservable: Observable<User?> { get }
    
    func login(mail: String, password: String)
    
    func inputValidation(mail: String?, password: String?)
}

final class LoginViewModel: LoginViewModelProtocol {
    
    private(set) var errorObservable: Observable<Error> = Observable(nil)
    private(set) var loginStateObservable: Observable<Bool> = Observable(false)
    private(set) var authorizedUserObservable: Observable<User?> = Observable(nil)
    
    func login(mail: String, password: String) {
        let address = Address(street: "", geo: Geo(lat: "", lng: ""), city: "", zipcode: "", suite: "")
        authorizedUserObservable.value = User(id: 1,
                                              name: "",
                                              username: "",
                                              email: "",
                                              address: address)
    }
    
    func inputValidation(mail: String?, password: String?) {
        func validate() -> Bool {
            guard let mailText = mail, mailText.isEmpty == false else {
                return false
            }
            
            guard let passwordText = password, passwordText.isEmpty == false else {
                return false
            }
            
            return StringValidator().isValid(email: mailText)
        }
        
        loginStateObservable.value = validate()
    }
}
