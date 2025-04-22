//
//  MenuItemDetailView.swift
//  Final Project
//
//  Created by Matthew Barghout on 4/22/25.
//

import SwiftUI

struct MenuItemDetailView: View {
    let item: MenuItem
    @ObservedObject var cart: Cart

    var body: some View {
        VStack(spacing: 20) {
            Text(item.name)
                .font(.largeTitle)
                .fontWeight(.bold)
                .multilineTextAlignment(.center)
                .padding(.top)

            Text(item.category)
                .font(.subheadline)
                .foregroundColor(.gray)

            
            Text(item.description)
                    .font(.body)
                    .padding()
                
            

            Text(String(format: "$%.2f", item.price))
                .font(.title2)
                .fontWeight(.semibold)

            Button(action: {
                cart.add(item)
            }) {
                Text("Add to Cart (\(cart.items.count))")
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.green)
                    .foregroundColor(.white)
                    .cornerRadius(12)
            }
            .padding(.horizontal)

            Spacer()
        }
        .padding()
        .background(
            LinearGradient(
                gradient: Gradient(colors: [.white, Color(red: 250/255, green: 210/255, blue: 183/255)]),
                startPoint: .top,
                endPoint: .bottom
            )
            .ignoresSafeArea()
        )
    }
}
