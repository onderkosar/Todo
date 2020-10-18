//
//  ThemeSettings.swift
//  Todo
//
//  Created by Önder Koşar on 18.10.2020.
//

import SwiftUI

// MARK: - THEME CLASS
final public class ThemeSettings: ObservableObject {
    @Published public var themeSettings: Int = UserDefaults.standard.integer(forKey: "Theme") {
        didSet {
            UserDefaults.standard.set(self.themeSettings, forKey: "Theme")
        }
    }
    
    private init() {}
    public static let shared = ThemeSettings()
}
