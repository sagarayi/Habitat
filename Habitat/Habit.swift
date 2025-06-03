//
//  Habit.swift
//  Habitat
//
//  Created by Sagar Ayi on 6/2/25.
//

import Foundation
import SwiftData

@Model
final class Habit {
    var name: String
    var startDate: Date
    var currentStreak: Int
    var longestStreak: Int
    var isActive: Bool
    
    init(name: String, startDate: Date, currentStreak: Int = 0, longestStreak: Int = 0, isActive: Bool = true) {
        self.name = name
        self.startDate = startDate
        self.currentStreak = currentStreak
        self.longestStreak = longestStreak
        self.isActive = isActive
    }
}
