//
//  ContentView.swift
//  Car Listing App Challenge
//
//  Created by Jeremy Tompkins on 8/6/22.
//

import SwiftUI

struct ContentView: View {
    var carList = [CarListItem]()
    @EnvironmentObject var carListSelection: CarListSelection
    @State private var animationAmount = 0.0
    @State private var showingFilter = false
    var searchResults: [CarListItem] {
        if carListSelection.searchMake.isEmpty && carListSelection.searchModel.isEmpty {
            return carList
        } else {
            return carList.filter {
                var isFound = true
                if "" != carListSelection.searchMake && false == $0.contains(carListSelection.searchMake) {
                    isFound = false
                }
                if "" != carListSelection.searchModel && false == $0.contains(carListSelection.searchModel) {
                    isFound = false
                }
                return isFound
            }
        }
    }

    var body: some View {
        GeometryReader { geo in
            NavigationView {
                ScrollView {
                    VStack(alignment: .leading, spacing: 10) {
                        ForEach(searchResults) { carListItem in
                            CarListBasicExpandableView(carListItem: carListItem, geoWidth: geo.size.width)
                                .environmentObject(carListSelection)
                                .shadow(radius: 1)
                                .transition(.scale)
                        }
                    }
                
                }
                .padding(Edge.Set.top, 15)
                .background(Color(UIColor.systemGray6))
                .navigationTitle("CarListing")
                .navigationViewStyle(StackNavigationViewStyle())
                .navigationAppearance(backgroundColor: .systemBackground, foregroundColor: .systemBlue)
                .toolbar {
                    Button("Filter") {
                        showingFilter.toggle()
                    }
                    .sheet(isPresented: $showingFilter) {
                        FilterSheetView(carList: carList)
                            .environmentObject(carListSelection)
                    }
                }
            }
        }
    }
}
