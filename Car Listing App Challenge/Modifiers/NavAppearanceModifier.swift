//
//  NavAppearanceModifier.swift
//  Car Listing App Challenge
//
//  Created by Jeremy Tompkins on 8/7/22.
//

import SwiftUI

struct NavAppearanceModifier: ViewModifier {
    init(backgroundColor: UIColor, foregroundColor: UIColor, tintColor: UIColor?, hideSeparator: Bool) {
        let navBarSettings = UINavigationBarAppearance()
        navBarSettings.largeTitleTextAttributes = [.foregroundColor: foregroundColor]
        navBarSettings.titleTextAttributes = [.foregroundColor: foregroundColor]
        navBarSettings.backgroundColor = backgroundColor
        if (hideSeparator) {
            navBarSettings.shadowColor = .clear
        }
        UINavigationBar.appearance().standardAppearance = navBarSettings
        UINavigationBar.appearance().compactAppearance = navBarSettings
        UINavigationBar.appearance().scrollEdgeAppearance = navBarSettings
        if let tintColor = tintColor {
            UINavigationBar.appearance().tintColor = tintColor
        } else {
            UINavigationBar.appearance().tintColor = UIColor.systemBlue
        }
    }
    
    func body(content: Content) -> some View {
        content
    }
}

extension View {
    func navigationAppearance(backgroundColor: UIColor, foregroundColor: UIColor, tintColor: UIColor? = nil, hideSeparator: Bool = false) -> some View {
        self.modifier(NavAppearanceModifier(backgroundColor: backgroundColor, foregroundColor: foregroundColor, tintColor: tintColor, hideSeparator: hideSeparator))

    }
}
