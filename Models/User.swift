//
//  User.swift
//  FindBadmintonMatch
//
//  Created by TuyenDT on 4/6/25.
//

import Foundation

struct User: Identifiable, Codable {
    let id = UUID()
    var name: String
    var email: String
    var phoneNumber: String
    var isLoggedIn: Bool = false
    var loginMethod: LoginMethod?
}

enum LoginMethod: String, CaseIterable, Codable {
    case google = "Google"
    case phone = "Số điện thoại"
    case email = "Email"
}
