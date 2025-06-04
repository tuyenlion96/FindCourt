//
//  LoginView.swift
//  FindBadmintonMatch
//
//  Created by TuyenDT on 4/6/25.
//

import SwiftUI

struct LoginView: View {
    @StateObject private var userController = UserController()
    @State private var showingLoginOptions = false
    
    var body: some View {
        NavigationView {
            VStack(spacing: 30) {
                if userController.currentUser.isLoggedIn {
                    // Logged in state
                    VStack(spacing: 20) {
                        Image(systemName: "person.circle.fill")
                            .font(.system(size: 80))
                            .foregroundColor(.blue)
                        
                        Text("Xin chào, \(userController.currentUser.name)")
                            .font(.title2)
                            .fontWeight(.semibold)
                        
                        Text("Email: \(userController.currentUser.email)")
                            .foregroundColor(.secondary)
                        
                        Text("SĐT: \(userController.currentUser.phoneNumber)")
                            .foregroundColor(.secondary)
                        
                        Button(action: {
                            userController.logout()
                        }) {
                            Text("Đăng xuất")
                                .frame(maxWidth: .infinity)
                                .padding()
                                .background(Color.red)
                                .foregroundColor(.white)
                                .cornerRadius(10)
                        }
                    }
                } else {
                    // Not logged in state
                    VStack(spacing: 20) {
                        Image(systemName: "person.circle")
                            .font(.system(size: 80))
                            .foregroundColor(.gray)
                        
                        Text("Đăng nhập để sử dụng đầy đủ tính năng")
                            .font(.headline)
                            .multilineTextAlignment(.center)
                        
                        VStack(spacing: 15) {
                            LoginButton(method: .google) {
                                userController.login(method: .google)
                            }
                            
                            LoginButton(method: .phone) {
                                userController.login(method: .phone)
                            }
                            
                            LoginButton(method: .email) {
                                userController.login(method: .email)
                            }
                        }
                    }
                }
            }
            .padding()
            .navigationTitle("Tài khoản")
        }
    }
}

struct LoginButton: View {
    let method: LoginMethod
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            HStack {
                Image(systemName: iconName)
                    .font(.title2)
                Text("Đăng nhập bằng \(method.rawValue)")
                    .fontWeight(.medium)
                Spacer()
            }
            .padding()
            .background(backgroundColor)
            .foregroundColor(.white)
            .cornerRadius(10)
        }
    }
    
    private var iconName: String {
        switch method {
        case .google: return "globe"
        case .phone: return "phone"
        case .email: return "envelope"
        }
    }
    
    private var backgroundColor: Color {
        switch method {
        case .google: return .red
        case .phone: return .green
        case .email: return .blue
        }
    }
}
