//
//  UserPreference.swift
//  Seknova
//
//  Created by imac on 2022/11/18.
//

import Foundation

class UserPreference {
    static let shared = UserPreference()
    
    private let userPreference: UserDefaults
    private init() {
        userPreference = UserDefaults.standard
    }
    
    enum preference: String {
        case email
        case password
    }
    
    var email: String {
        get { return userPreference.string(forKey: preference.email.rawValue) ?? "" }
        set { return userPreference.set(newValue, forKey: preference.email.rawValue) }
    }
    
    var password: String {
        get { return userPreference.string(forKey: preference.password.rawValue) ?? "" }
        set { return userPreference.set(newValue, forKey: preference.email.rawValue) }
    }
}
