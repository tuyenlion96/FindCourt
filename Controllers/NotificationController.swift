//
//  NotificationController.swift
//  FindBadmintonMatch
//
//  Created by TuyenDT on 4/6/25.
//

import Foundation
import Combine

class NotificationController: ObservableObject {
    @Published var notifications: [AppNotification] = []
    
    init() {
        loadSampleNotifications()
    }
    
    private func loadSampleNotifications() {
        notifications = [
            AppNotification(title: "Đăng ký thành công", message: "Bạn đã đăng ký sân ABC thành công", timestamp: Date(), type: .applicationSuccess),
            AppNotification(title: "Đăng bài thành công", message: "Bài đăng của bạn đã được duyệt", timestamp: Date().addingTimeInterval(-3600), type: .postSuccess),
            AppNotification(title: "Thông báo", message: "Có người mới đăng ký sân của bạn", timestamp: Date().addingTimeInterval(-7200), type: .applicationSuccess)
        ]
    }
    
    func addNotification(_ notification: AppNotification) {
        notifications.insert(notification, at: 0)
    }
    
    func markAsRead(_ id: UUID) {
        if let index = notifications.firstIndex(where: { $0.id == id }) {
            notifications[index].isRead = true
        }
    }
    
    var unreadCount: Int {
        notifications.filter { !$0.isRead }.count
    }
}
