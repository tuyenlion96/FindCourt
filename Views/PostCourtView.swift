//
//  PostCourtView.swift
//  FindBadmintonMatch
//
//  Created by TuyenDT on 4/6/25.
//

import SwiftUI

struct PostCourtView: View {
    @State private var selectedType: CourtType = .playMatch
    @State private var title = ""
    @State private var location = ""
    @State private var time = ""
    @State private var slots = 1
    @State private var cost = ""
    @State private var contactInfo = ""
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(alignment: .leading, spacing: 20) {
                    // Court Type Selection
                    VStack(alignment: .leading) {
                        Text("Loại đăng bài")
                            .font(.headline)
                        
                        Picker("Loại", selection: $selectedType) {
                            ForEach(CourtType.allCases, id: \.self) { type in
                                Text(type.rawValue).tag(type)
                            }
                        }
                        .pickerStyle(SegmentedPickerStyle())
                    }
                    
                    // Form Fields
                    VStack(alignment: .leading, spacing: 15) {
                        TextField("Tiêu đề", text: $title)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                        
                        TextField("Địa điểm", text: $location)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                        
                        TextField("Thời gian", text: $time)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                        
                        if selectedType == .playMatch {
                            HStack {
                                Text("Số slot cần:")
                                Stepper("\(slots)", value: $slots, in: 1...10)
                            }
                        }
                        
                        TextField(selectedType == .playMatch ? "Chi phí/người" : "Giá thuê", text: $cost)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .keyboardType(.numberPad)
                        
                        TextField("Thông tin liên hệ", text: $contactInfo)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                    }
                    
                    // Post Button
                    Button(action: {
                        postCourt()
                    }) {
                        Text("Đăng bài")
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(Color.blue)
                            .foregroundColor(.white)
                            .cornerRadius(10)
                    }
                    .disabled(title.isEmpty || location.isEmpty || time.isEmpty || cost.isEmpty)
                }
                .padding()
            }
            .navigationTitle("Đăng bài")
        }
    }
    
    private func postCourt() {
        // Handle posting court
        print("Posting court: \(title)")
        // Clear form after posting
        clearForm()
    }
    
    private func clearForm() {
        title = ""
        location = ""
        time = ""
        slots = 1
        cost = ""
        contactInfo = ""
    }
}
