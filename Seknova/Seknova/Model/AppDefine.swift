//
//  AppDefine.swift
//  Seknova
//
//  Created by imac on 2022/12/7.
//

import Foundation

class AppDefine {

    enum PersonalInformation: Int, CaseIterable {
        case firstName = 0, lastName, birthday, email, phone, address
        
        var title: String {
            switch self {
            case .firstName:
                return "名"
            case .lastName:
                return "姓"
            case .birthday:
                return "出生日期"
            case .email:
                return "電子郵件"
            case .phone:
                return "手機號碼"
            case .address:
                return "地址"
            }
        }
    }
    
    enum BodyInformation: Int, CaseIterable {
        case gender = 0, height, weight, race, drink, smoke
        
        var title: String {
            switch self {
            case .gender:
                return "性別"
            case .height:
                return "身高"
            case .weight:
                return "體重"
            case .race:
                return "種族"
            case .drink:
                return "飲酒"
            case .smoke:
                return "抽菸"
            }
        }
        
        var array: [String] {
            switch self {
            case .gender:
                return ["生理男", "生理女"]
            case .height:
                return []
            case .weight:
                return []
            case .race:
                return ["亞洲", "非洲", "高加索", "拉丁", "其他"]
            case .drink:
                return ["無", "偶爾", "頻繁", "每天"]
            case .smoke:
                return ["有", "無"]
            }
        }
    }
    
}
