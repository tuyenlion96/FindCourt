//
//  CourtController.swift
//  FindBadmintonMatch
//
//  Created by TuyenDT on 4/6/25.
//

import Foundation
import Combine

class CourtController: ObservableObject {
    @Published var courts: [Court] = []
    
    init() {
        loadSampleData()
    }
    
    private func loadSampleData() {
        courts = [
            Court(title: "Sân ABC - Cầu Giấy", location: "Hà Nội", time: "19:00 - 21:00", availableSlots: 2, cost: 150, type: .playMatch, contactInfo: "0912345678", latitude: 21.0285, longitude: 105.8542),
            Court(title: "Sân XYZ - Quận 1", location: "Hồ Chí Minh", time: "18:00 - 20:00", availableSlots: 4, cost: 200, type: .playMatch, contactInfo: "0987654321", latitude: 10.7769, longitude: 106.7009),
            Court(title: "Cho thuê sân DEF", location: "Hà Nội", time: "Cả ngày", availableSlots: 0, cost: 300, type: .rentCourt, contactInfo: "0901234567", latitude: 21.0245, longitude: 105.8412)
        ]
    }
    
    func addCourt(_ court: Court) {
        courts.append(court)
    }
    
    func searchCourts(by location: String) -> [Court] {
        return courts.filter { $0.location.lowercased().contains(location.lowercased()) }
    }
}
