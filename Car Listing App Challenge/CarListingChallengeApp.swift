//
//  Car_Listing_App_ChallengeApp.swift
//  Car Listing App Challenge
//
//  Created by Jeremy Tompkins on 8/6/22.
//

import SwiftUI

@main
struct CarListingChallengeApp: App {
    @StateObject private var carListSelection = CarListSelection()
    var body: some Scene {
        let carListing = getCarList()
        WindowGroup {
            ContentView(carList: carListing)
                .environmentObject(carListSelection)
        }
    }
    
    func getCarList() -> [CarListItem] {
        let decoder = JSONDecoder()
        var carList: [CarListItem] = []
        do {
            var jsonString: String = "[]"
            if let filepath = Bundle.main.path(forResource: "car_list", ofType: "json") {
                do {
                    jsonString = try String(contentsOfFile: filepath)
                } catch {
                }
            }
            let jsonData = Data(jsonString.utf8)
            carList = try decoder.decode([CarListItem].self, from: jsonData)
        } catch {
            print(error.localizedDescription)
        }
        return carList
    }
}
