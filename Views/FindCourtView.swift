//
//  FindCourtView.swift
//  FindBadmintonMatch
//
//  Created by TuyenDT on 4/6/25.
//

import SwiftUI

struct FindCourtView: View {
    @StateObject private var courtController = CourtController()
    @State private var showingFilter = false
    @State private var searchText = ""
    @State private var selectedLocation = "Tất cả"
    
    var filteredCourts: [Court] {
        courtController.courts.filter { court in
            (searchText.isEmpty || court.location.lowercased().contains(searchText.lowercased())) &&
            (selectedLocation == "Tất cả" || court.location.contains(selectedLocation))
        }
    }
    
    var body: some View {
        NavigationView {
            VStack {
                // Search and Filter Bar
                HStack {
                    TextField("Tìm kiếm theo địa điểm...", text: $searchText)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                    
                    Button(action: {
                        // Request location access
                        requestLocationAccess()
                    }) {
                        Image(systemName: "location")
                            .foregroundColor(.blue)
                            .font(.title2)
                    }
                    
                    Button(action: {
                        showingFilter = true
                    }) {
                        Image(systemName: "slider.horizontal.3")
                            .foregroundColor(.blue)
                            .font(.title2)
                    }
                }
                .padding()
                
                // Courts List
                ScrollView {
                    LazyVStack(spacing: 12) {
                        ForEach(filteredCourts) { court in
                            CourtCardView(court: court) {
                                applyForCourt(court)
                            }
                        }
                    }
                    .padding()
                }
            }
            .navigationTitle("Tìm sân cầu lông")
            .sheet(isPresented: $showingFilter) {
                SearchFilterView(selectedLocation: $selectedLocation)
            }
        }
    }
    
    private func requestLocationAccess() {
        // Implement location access request
        print("Requesting location access...")
    }
    
    private func applyForCourt(_ court: Court) {
        // Handle court application
        print("Applied for court: \(court.title)")
    }
}
