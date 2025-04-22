//
//  Cart.swift
//  Final Project
//
//  Created by Matthew Barghout on 4/22/25.
//

import Foundation

class Cart: ObservableObject {
    @Published var items: [MenuItem] = []

    func add(_ item: MenuItem) {
        items.append(item)
        
    }

    func remove(_ item: MenuItem) {
        if let index = items.firstIndex(where: { $0.id == item.id }) {
            items.remove(at: index)
        }
    }

    func clear() {
        items.removeAll()
    }

    var totalPrice: Double {
        items.reduce(0) { $0 + $1.price }
    }
}

