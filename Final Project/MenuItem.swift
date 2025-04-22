//
//  MenuItem.swift
//  Final Project
//
//  Created by Matthew Barghout on 4/8/25.
//

import Foundation

struct MenuItem: Identifiable, Codable {
    let id: Int
    let name: String
    let description: String
    let price: Double
    let category: String
   
}

