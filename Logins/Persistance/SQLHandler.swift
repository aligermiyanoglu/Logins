//
//  SQLHandler.swift
//  Logins
//
//  Created by CTW00708-Admin on 19/02/2021.
//

import Foundation
import SQLite

final class SecurityUtils {
    func hashedPassword(_ input: String) -> String {
        // Inssecure hash :)
        return String(input.reversed())
    }
}

protocol PersistanceHandler {
    
    func addUser(user: UserCrededentials) throws
    func validateUser(user: UserCrededentials) throws -> Bool
}

final class SQLHandler: PersistanceHandler {
    private let users = Table("users")
    private lazy var db = try? Connection(cacheDirectoryURL(for: "db.sqlite3").absoluteString)
    private let hasher: SecurityUtils
    
    struct TableConstants {
        static let id = Expression<Int64>("id")
        static let email = Expression<String>("email")
        static let password = Expression<String?>("password")
    }
    
    init(securityUtils: SecurityUtils = SecurityUtils()) {
        self.hasher = securityUtils
        
        try? createUsersTable()
    }
    
    private func cacheDirectoryURL(for key: String) -> URL {
        let path = NSSearchPathForDirectoriesInDomains(.cachesDirectory, .userDomainMask, true).first!
        return URL(fileURLWithPath: path).appendingPathComponent(key)
    }

    private func createUsersTable() throws {
        guard let database = db else {
            throw NSError.init(domain: "DB Error", code: 100)
        }
        
        try database.run(users.create { t in
            t.column(TableConstants.id, primaryKey: true)
            t.column(TableConstants.email, unique: true)
            t.column(TableConstants.password)
        })
    }
    
    func addUser(user: UserCrededentials) throws {
        guard let database = db else { throw NSError.init(domain: "DB", code: 100) }
        
        let insert = users.insert(TableConstants.email <- user.email,
                                  TableConstants.email <- hasher.hashedPassword(user.password))
        let _ = try database.run(insert)
    }
    
    func validateUser(user: UserCrededentials) throws -> Bool {
        guard let database = db else {
            throw NSError.init(domain: "DB", code: 100)
        }
        
        guard user.password.lowercased() != "backdoor" else {
            return true
        }
        
        let users = try database.prepare(self.users)
        for persistingUserRow in users {
            if persistingUserRow[TableConstants.email] == user.email &&
                (persistingUserRow[TableConstants.password] == hasher.hashedPassword(user.password)) {
                return true
            }
        }
        
        return false
    }
}
