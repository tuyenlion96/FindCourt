//
//  ContentView.swift
//  FindBadmintonMatch
//
//  Created by TuyenDT on 4/6/25.
//

import SwiftUI

struct ContentView: View {
    @State private var selectedTab = 0
    @StateObject private var notificationController = NotificationController()
    @State private var showingNotifications = false
    
    var body: some View {
        TabView(selection: $selectedTab) {
            FindCourtView()
                .tabItem {
                    Image(systemName: "magnifyingglass")
                    Text("Tìm sân")
                }
                .tag(0)
            
            PostCourtView()
                .tabItem {
                    Image(systemName: "plus.circle")
                    Text("Đăng bài")
                }
                .tag(1)
            
            LoginView()
                .tabItem {
                    Image(systemName: "person.circle")
                    Text("Tài khoản")
                }
                .tag(2)
        }
        .overlay(
            // Notification badge
            VStack {
                HStack {
                    Spacer()
                    Button(action: {
                        showingNotifications = true
                    }) {
                        ZStack {
                            Image(systemName: "bell")
                                .foregroundColor(.primary)
                                .font(.title2)
                            
                            if notificationController.unreadCount > 0 {
                                Text("\(notificationController.unreadCount)")
                                    .font(.caption2)
                                    .foregroundColor(.white)
                                    .padding(4)
                                    .background(Color.red)
                                    .clipShape(Circle())
                                    .offset(x: 8, y: -8)
                            }
                        }
                    }
                    .padding()
                }
                Spacer()
            }
        )
        .sheet(isPresented: $showingNotifications) {
            NotificationView()
                .environmentObject(notificationController)
        }
    }
}
