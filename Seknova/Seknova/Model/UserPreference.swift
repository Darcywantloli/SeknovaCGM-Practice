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
        case lowSuger
        case highSuger
        case deviceID
        case sensorID
    }
    
    var email: String {
        get { return userPreference.string(forKey: Preference.email.rawValue) ?? "" }
        set { return userPreference.set(newValue, forKey: Preference.email.rawValue) }
    }
    
    var password: String {
        get { return userPreference.string(forKey: Preference.password.rawValue) ?? "" }
        set { return userPreference.set(newValue, forKey: Preference.password.rawValue) }
    }
    
    var firstLogin: Bool {
        get { return userPreference.bool(forKey: Preference.firstLogin.rawValue) }
        set { return userPreference.set(newValue, forKey: Preference.firstLogin.rawValue) }
    }
    
    var lowSuger: Int {
        get { return userPreference.integer(forKey: Preference.lowSuger.rawValue) }
        set { return userPreference.set(newValue, forKey: Preference.lowSuger.rawValue) }
    }
    
    var highSuger: Int {
        get { return userPreference.integer(forKey: Preference.highSuger.rawValue) }
        set { return userPreference.set(newValue, forKey: Preference.highSuger.rawValue) }
    }
    
    var deviceID: String {
        get { return userPreference.string(forKey: Preference.deviceID.rawValue) ?? "" }
        set { return userPreference.set(newValue, forKey: Preference.deviceID.rawValue) }
    }
    
    var sensorID: String {
        get { return userPreference.string(forKey: Preference.sensorID.rawValue) ?? "" }
        set { return userPreference.set(newValue, forKey: Preference.sensorID.rawValue) }
    }
}
