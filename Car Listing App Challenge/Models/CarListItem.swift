//
//  CarListItem.swift
//  Car Listing App Challenge
//
//  Created by Jeremy Tompkins on 8/7/22.
//

import Foundation

struct CarListItem: Codable, Identifiable {
    var id: Int64
    var consList: [String]
    var customerPrice: Int64
    var make: String
    var marketPrice: Int64
    var model: String
    var prosList: [String]
    var rating: Int64
}

extension CarListItem {
    func contains(_ searchText: String) -> Bool {
        if make.contains(searchText) || model.contains(searchText) {
            return true
        }
        return false
    }
}
