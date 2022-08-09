//
//  CarListBasicView.swift
//  Car Listing App Challenge
//
//  Created by Jeremy Tompkins on 8/7/22.
//

import SwiftUI

struct CarListBasicExpandableView: View {
    var carListItem: CarListItem
    var geoWidth: CGFloat
    @EnvironmentObject var carListSelection: CarListSelection
    
    var body: some View {
        HStack {
            Spacer()
            ZStack {
                VStack {
                    HStack {
                        Spacer()
                        ZStack() {
                            VStack {
                                Spacer()
                                    .frame(height: 2.0)
                                Text("\(carListItem.rating)")
                                    .fontWeight(.bold)
                                    .multilineTextAlignment(.center)
                                    .padding(/*@START_MENU_TOKEN@*/.all, 5.0/*@END_MENU_TOKEN@*/)
                                    .background(Color(UIColor.systemBlue))
                                    .foregroundColor(Color(UIColor.label))
                                    .clipShape(Star(corners: 15, smoothness: 0.65))
                                Spacer()
                            }
                        }
                    }
                    Spacer()
                }
                
                HStack {
                    Image(String("Car\(carListItem.id)"))
                        .resizable()
                        .scaledToFill()
                        .frame(width: geoWidth * 0.4 )
                        .clipped()
                    VStack {
                        HStack {
                            Text("\(carListItem.model)")
                                .bold()
                                .foregroundColor(Color(UIColor.label))
                            Spacer()
                        }
                        HStack {
                            Text("$\(carListItem.customerPrice)")
                                .foregroundColor(Color(UIColor.systemGray))
                            Spacer()
                        }
                        if carListSelection.id == carListItem.id {
                            if carListItem.prosList.isEmpty == false {
                                Spacer()
                                VStack {
                                    HStack {
                                        Text("Pros:").bold()
                                        Spacer()
                                    }
                                    ForEach(0..<carListItem.prosList.count) { index in
                                        if String("\(carListItem.prosList[index])").isEmpty == false {
                                            HStack {
                                                Text(" • \(carListItem.prosList[index])")
                                                Spacer()
                                            }
                                        }
                                    }
                                    Spacer()
                                }
                            }
                            if carListItem.consList.isEmpty == false {
                                Spacer()
                                VStack {
                                    HStack {
                                        Text("Cons:").bold()
                                        Spacer()
                                    }
                                    ForEach(0..<carListItem.consList.count) { index in
                                        if String("\(carListItem.consList[index])").isEmpty == false {
                                            HStack {
                                                Text(" • \(carListItem.consList[index])")
                                                Spacer()
                                            }
                                        }
                                    }
                                    Spacer()
                                }
                            }
                        }
                        Spacer()
                        HStack {
                            Button(carListSelection.id == carListItem.id ? "Hide Details" : "Show Details") {
                                withAnimation {
                                    if carListSelection.id == carListItem.id {
                                        carListSelection.id = 0
                                    } else {
                                        carListSelection.id = carListItem.id
                                    }
                                }
                            }
                            Spacer()
                        }
                    }
                    Spacer()
                }
                
            }
            .background(Color(UIColor.systemBackground))
            .cornerRadius(15)
            .onTapGesture {
                withAnimation {
                    if carListSelection.id == carListItem.id {
                        carListSelection.id = 0
                    } else {
                        carListSelection.id = carListItem.id
                    }
                }
            }
        Spacer()
        }
    }
}
