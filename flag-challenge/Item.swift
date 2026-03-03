//
//  Item.swift
//  flag-challenge
//
//  Created by Macbook on 2026-01-30.
//  Author: El Houssein Navaa
//

import Foundation
import SwiftData

@Model
final class Item {
    var timestamp: Date
    
    init(timestamp: Date) {
        self.timestamp = timestamp
    }
}
