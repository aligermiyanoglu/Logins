//
//  StorageAPI.swift
//  Locations
//
//  Created by Ali Germiyanoglu on 02.09.2019.
//  Copyright © 2019 Ali Germiyanoglu. All rights reserved.
//

import Foundation

typealias ModelResult<T: Codable> = Result<T?, StorageHandler.StorageError>
typealias ModelResultHandler<T: Codable> = (_ result: ModelResult<Bool>) -> Void

protocol StorageAPI: class {
    func save(_ user: UserCrededentials)

    func validate(for user: UserCrededentials,
                  completion: @escaping ModelResultHandler<Bool>)
}
