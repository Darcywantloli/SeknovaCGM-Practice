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
    
    enum Preference: String {
        case email
        case password
        case firstLogin
    }
    
    var email: String {
        get { return userPreference.string(forKey: Preference.email.rawValue) ?? "" }
        set { return userPreference.set(newValue, forKey: Preference.email.rawValue) }
    }
    
    var password: String {
        get { return userPreference.string(forKey: Preference.password.rawValue) ?? "" }
        set { return userPreference.set(newValue, forKey: Preference.email.rawValue) }
    }
    
    var firstLogin: Bool {
        get { return userPreference.bool(forKey: Preference.firstLogin.rawValue) }
        set { return userPreference.set(newValue, forKey: Preference.firstLogin.rawValue) }
    }
}
