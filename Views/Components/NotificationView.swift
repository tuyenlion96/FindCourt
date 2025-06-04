//
//  NotificationView.swift
//  FindBadmintonMatch
//
//  Created by TuyenDT on 4/6/25.
//

import SwiftUI

struct NotificationView: View {
    @StateObject private var notificationController = NotificationController()
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        NavigationView {
            VStack {
                if notificationController.notifications.isEmpty {
                    // Empty state
                    VStack(spacing: 20) {
                        Image(systemName: "bell.slash")
                            .font(.system(size: 60))
                            .foregroundColor(.gray)
                        
                        Text("Không có thông báo")
                            .font(.title2)
                            .foregroundColor(.secondary)
                        
                        Text("Các thông báo về đăng ký sân và đăng bài sẽ hiển thị tại đây")
                            .font(.body)
                            .foregroundColor(.secondary)
                            .multilineTextAlignment(.center)
                            .padding(.horizontal)
                    }
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                } else {
                    // Notifications list
                    ScrollView {
                        LazyVStack(spacing: 12) {
                            ForEach(notificationController.notifications) { notification in
                                NotificationRowView(notification: notification) {
                                    notificationController.markAsRead(notification.id)
                                }
                            }
                        }
                        .padding()
                    }
                }
            }
            .navigationTitle("Thông báo")
            .navigationBarItems(
                leading: Button("Đóng") {
                    presentationMode.wrappedValue.dismiss()
                },
                trailing: Button("Đánh dấu tất cả") {
                    markAllAsRead()
                }
                .disabled(notificationController.notifications.allSatisfy { $0.isRead })
            )
        }
    }
    
    private func markAllAsRead() {
        for notification in notificationController.notifications {
            notificationController.markAsRead(notification.id)
        }
    }
}

struct NotificationRowView: View {
    let notification: AppNotification
    let onTap: () -> Void
    
    var body: some View {
        Button(action: onTap) {
            HStack(alignment: .top, spacing: 12) {
                // Icon based on notification type
                Image(systemName: iconName)
                    .font(.title2)
                    .foregroundColor(iconColor)
                    .frame(width: 24, height: 24)
                
                VStack(alignment: .leading, spacing: 6) {
                    HStack {
                        Text(notification.title)
                            .font(.headline)
                            .foregroundColor(.primary)
                        
                        Spacer()
                        
                        if !notification.isRead {
                            Circle()
                                .fill(Color.blue)
                                .frame(width: 8, height: 8)
                        }
                    }
                    
                    Text(notification.message)
                        .font(.body)
                        .foregroundColor(.secondary)
                        .multilineTextAlignment(.leading)
                    
                    Text(formatTime(notification.timestamp))
                        .font(.caption)
                        .foregroundColor(.secondary)
                }
                
                Spacer()
            }
            .padding()
            .background(notification.isRead ? Color.clear : Color.blue.opacity(0.05))
            .cornerRadius(12)
            .overlay(
                RoundedRectangle(cornerRadius: 12)
                    .stroke(Color.gray.opacity(0.2), lineWidth: 1)
            )
        }
        .buttonStyle(PlainButtonStyle())
    }
    
    private var iconName: String {
        switch notification.type {
        case .applicationSuccess:
            return "checkmark.circle.fill"
        case .applicationFailed:
            return "xmark.circle.fill"
        case .postSuccess:
            return "plus.circle.fill"
        case .postFailed:
            return "exclamationmark.circle.fill"
        }
    }
    
    private var iconColor: Color {
        switch notification.type {
        case .applicationSuccess, .postSuccess:
            return .green
        case .applicationFailed, .postFailed:
            return .red
        }
    }
    
    private func formatTime(_ date: Date) -> String {
        let formatter = RelativeDateTimeFormatter()
        formatter.unitsStyle = .short
        return formatter.localizedString(for: date, relativeTo: Date())
    }
}

// Extension to show notification view as a sheet
extension View {
    func notificationSheet(isPresented: Binding<Bool>) -> some View {
        self.sheet(isPresented: isPresented) {
            NotificationView()
        }
    }
}
