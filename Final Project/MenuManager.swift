//
//  MenuManager.swift
//  Final Project
//
//  Created by Matthew Barghout on 4/8/25.
//

import Foundation

class MenuManager {
    static func fetchMenu(completion: @escaping ([MenuItem]) -> Void) {
        guard let url = URL(string: "https://run.mocky.io/v3/a91296fb-6a0c-4432-9fcb-1b4ca9c9e591") else {
            print("Invalid URL")
            return
        }

        URLSession.shared.dataTask(with: url) { data, _, error in
            if let data = data {
                do {
                    let items = try JSONDecoder().decode([MenuItem].self, from: data)
                    print("Decoded \(items.count) items")
                    DispatchQueue.main.async {
                        completion(items)
                    }
                } catch {
                    print("JSON decoding error:", error)
                }
            } else if let error = error {
                print("Network error:", error)
            }
        }.resume()
    }
}


