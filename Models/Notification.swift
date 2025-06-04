//
//  Notification.swift
//  FindBadmintonMatch
//
//  Created by TuyenDT on 4/6/25.
//

import Foundation

struct AppNotification: Identifiable, Codable {
    let id = UUID()
    let title: String
    let message: String
    let timestamp: Date
    let type: NotificationType
    var isRead: Bool = false
}

enum NotificationType: String, Codable {
    case applicationSuccess = "Đăng ký thành công"
    case applicationFailed = "Đăng ký thất bại"
    case postSuccess = "Đăng bài thành công"
    case postFailed = "Đăng bài thất bại"
}
