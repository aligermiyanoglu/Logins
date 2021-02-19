//
//  APIClient.swift
//  Logins
//
//  Created by CTW00708-Admin on 15/02/2021.
//

import Foundation

protocol APIService {
    func fetchUsers(completion: @escaping ResponseTypedCompletion<[User]>)
}

final class APIClient: APIService {
    private let consumer: HTTPConsumer
    
    init(consumer: HTTPConsumer = AFConsumer()) {
        self.consumer = consumer
    }
    
    func fetchUsers(completion: @escaping ResponseTypedCompletion<[User]>) {
        guard let url = API.users.requestURL else { assert(false, "Unexpected url content in API") }
        
        consumer.response(of: URLRequest(url: url), completionHandler: completion)
    }
}
