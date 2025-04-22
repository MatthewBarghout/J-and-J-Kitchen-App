//
//  MenuItemRow.swift
//  Final Project
//
//  Created by Matthew Barghout on 4/8/25.
//

import SwiftUI

struct MenuItemRow: View {
    let item: MenuItem

    var body: some View {
        HStack(alignment: .top, spacing: 16) {
          

            VStack(alignment: .leading, spacing: 4) {
                Text(item.name)
                    .font(.headline)

                Text(item.description)
                    .font(.subheadline)
                    .foregroundColor(.gray)
                    .lineLimit(2)

                Text("$\(item.price, specifier: "%.2f")")
                    .font(.subheadline)
                    .bold()
                    .padding(.top, 2)
            }
        }
        .padding(10)
        .background(Color(.systemGray6))
        .cornerRadius(12)
    }
}




