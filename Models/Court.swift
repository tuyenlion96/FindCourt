//
//  Court.swift
//  FindBadmintonMatch
//
//  Created by TuyenDT on 4/6/25.
//

import Foundation

struct Court: Identifiable, Codable {
    let id = UUID()
    let title: String
    let location: String
    let time: String
    let availableSlots: Int
    let cost: Double
    let type: CourtType
    let contactInfo: String
    let latitude: Double?
    let longitude: Double?
}

enum CourtType: String, CaseIterable, Codable {
    case playMatch = "Tuyển giao lưu"
    case rentCourt = "Cho thuê sân"
}
