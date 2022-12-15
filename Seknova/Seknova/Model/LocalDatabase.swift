//
//  UserInformation.swift
//  Seknova
//
//  Created by imac on 2022/12/12.
//

import Foundation
import RealmSwift

class LocalDatabase: NSObject {
    static let shared = LocalDatabase()
    
    func addUserInformation(userInformation: UserInformationTable) {
        let realm = try! Realm()
        let user = UserInformation()
        
        user.UserID = userInformation.UserID
        
        try! realm.write {
            realm.add(user)
        }
    }
}

class UserInformation: Object {
    @Persisted var UserID: String = ""
    @Persisted var FirstName: String = ""
    @Persisted var LastName: String = ""
    @Persisted var Birthday: String = ""
    @Persisted var Email: String = ""
    @Persisted var Phone: String = ""
    @Persisted var Address: String = ""
    @Persisted var Gender: String = ""
    @Persisted var Height: Int = 0
    @Persisted var Weight: Int = 0
    @Persisted var Race: String = ""
    @Persisted var Liquor: String = ""
    @Persisted var Smoke: String = ""
    @Persisted var Check: Bool = false
    @Persisted var PhoneVerified: Bool = false
    
    convenience init(UserID: String,
                     FirstName: String,
                     LastName: String,
                     Birthday: String,
                     Email: String,
                     Phone: String,
                     Address: String,
                     Gender: String,
                     Height: Int,
                     Weight: Int,
                     Race: String,
                     Liquor: String,
                     Smoke: String,
                     Check: Bool,
                     PhoneVerified: Bool) {
        self.init()

        self.UserID = UserID
        self.FirstName = FirstName
        self.LastName = LastName
        self.Birthday = Birthday
        self.Email = Email
        self.Phone = Phone
        self.Address = Address
        self.Gender = Gender
        self.Height = Height
        self.Weight = Weight
        self.Race = Race
        self.Liquor = Liquor
        self.Smoke = Smoke
        self.Check = Check
        self.PhoneVerified = PhoneVerified
    }
}
