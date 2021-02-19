//
//  StorageHandler.swift
//  Locations
//
//  Created by Ali Germiyanoglu on 02.09.2019.
//  Copyright © 2019 Ali Germiyanoglu. All rights reserved.
//

import Foundation

final class StorageHandler: StorageAPI {
    private static let modelQueue = DispatchQueue(label: "com.aeg.cache.storage.model")
    
    enum StorageError: Error {
        case notFound
        case codingError
    }
    
    private let persistance: PersistanceHandler
    
    init(persistance: PersistanceHandler = SQLHandler()) {
        self.persistance = persistance
    }
    
    // MARK: StorageAPI Methods
    
    func save(_ user: UserCrededentials) {
        StorageHandler.modelQueue.async {
            do {
                try self.persistance.addUser(user: user)
                
            } catch { }
        }
    }
    
    func validate(for user: UserCrededentials,
                  completion: @escaping ModelResultHandler<Bool>) {
        StorageHandler.modelQueue.async {
            do {
                let data = try self.persistance.validateUser(user: user)

                completion(.success(data))
            } catch {
                completion(.failure(StorageError.codingError))
            }
        }
    }
}
