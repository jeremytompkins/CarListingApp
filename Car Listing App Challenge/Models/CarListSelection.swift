//
//  CarList.swift
//  Car Listing App Challenge
//
//  Created by Jeremy Tompkins on 8/7/22.
//

import Foundation

class CarListSelection: ObservableObject {
    @Published var id: Int64 = 1
    @Published var searchMake: String = "" {
        didSet (oldValue) {
            if searchMake == "" {
                searchModel = ""
            }
        }
    }
    @Published var searchModel: String = ""
}
