//
//  UserController.swift
//  FindBadmintonMatch
//
//  Created by TuyenDT on 4/6/25.
//

import Foundation
import Combine

class UserController: ObservableObject {
    @Published var currentUser = User(name: "", email: "", phoneNumber: "")
    
    func login(method: LoginMethod) {
        // Simulate login process
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            self.currentUser = User(
                name: "Người dùng",
                email: "user@example.com",
                phoneNumber: "0123456789",
                isLoggedIn: true,
                loginMethod: method
            )
        }
    }
    
    func logout() {
        currentUser.isLoggedIn = false
        currentUser.loginMethod = nil
        currentUser.name = ""
        currentUser.email = ""
        currentUser.phoneNumber = ""
    }
}
