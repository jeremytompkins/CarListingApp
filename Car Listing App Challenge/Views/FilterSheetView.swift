//
//  FilterSheetView.swift
//  Car Listing App Challenge
//
//  Created by Jeremy Tompkins on 8/8/22.
//

import SwiftUI

struct FilterSheetView: View {
    @Environment(\.dismiss) var dismiss
    @EnvironmentObject var carListSelection: CarListSelection
    var carList: [CarListItem]

    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Filters")) {
                    Picker("Make", selection: $carListSelection.searchMake) {
                        Text("").tag("")
                        ForEach(carList.filter({carListSelection.searchModel.isEmpty || carListSelection.searchModel == $0.model})) { car in
                            Text(car.make).tag(car.make)
                        }
                    }
                    if false == carListSelection.searchMake.isEmpty {
                        Picker("Model", selection: $carListSelection.searchModel) {
                            Text("").tag("")
                            ForEach(carList.filter({false == carListSelection.searchMake.isEmpty && carListSelection.searchMake == $0.make})) { car in
                                Text(car.model).tag(car.model)
                            }
                        }
                    }
                }
            }
            .navigationTitle("Filters")
            .navigationBarTitleDisplayMode(.inline)
            .navigationAppearance(backgroundColor: .systemBackground, foregroundColor: .label)
            .toolbar {
                Button("Close") {
                    dismiss()
                }
            }
        }
    }
    
}
