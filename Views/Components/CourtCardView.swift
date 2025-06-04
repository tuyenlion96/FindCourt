//
//  CourtCardView.swift
//  FindBadmintonMatch
//
//  Created by TuyenDT on 4/6/25.
//

import SwiftUI

struct CourtCardView: View {
    let court: Court
    let onApply: () -> Void
    
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            HStack {
                Text(court.title)
                    .font(.headline)
                    .foregroundColor(.primary)
                
                Spacer()
                
                Text(court.type.rawValue)
                    .font(.caption)
                    .padding(.horizontal, 8)
                    .padding(.vertical, 4)
                    .background(court.type == .playMatch ? Color.green.opacity(0.2) : Color.blue.opacity(0.2))
                    .foregroundColor(court.type == .playMatch ? .green : .blue)
                    .cornerRadius(8)
            }
            
            VStack(alignment: .leading, spacing: 8) {
                InfoRow(icon: "location", text: court.location)
                InfoRow(icon: "clock", text: court.time)
                
                if court.type == .playMatch {
                    InfoRow(icon: "person.2", text: "\(court.availableSlots) slot còn lại")
                }
                
                InfoRow(icon: "dollarsign.circle", text: "\(Int(court.cost))K VND")
            }
            
            Button(action: onApply) {
                Text(court.type == .playMatch ? "Đăng ký" : "Liên hệ")
                    .frame(maxWidth: .infinity)
                    .padding(.vertical, 10)
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(8)
            }
        }
        .padding()
        .background(Color.white)
        .cornerRadius(12)
        .shadow(color: .gray.opacity(0.2), radius: 5, x: 0, y: 2)
    }
}

struct InfoRow: View {
    let icon: String
    let text: String
    
    var body: some View {
        HStack {
            Image(systemName: icon)
                .foregroundColor(.secondary)
                .frame(width: 20)
            Text(text)
                .foregroundColor(.primary)
        }
    }
}
