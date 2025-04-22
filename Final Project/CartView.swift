//
//  CartView.swift
//  Final Project
//
//  Created by Matthew Barghout on 4/22/25.
//

import SwiftUI

struct CartView: View {
    @ObservedObject var cart: Cart
    @Environment(\.dismiss) var dismiss
    @State private var showCheckoutAlert = false


    var body: some View {
        NavigationView {
            VStack {
                if cart.items.isEmpty {
                    Text("Your cart is empty.")
                        .font(.title2)
                        .foregroundColor(.gray)
                        .padding()
                } else {
                    List {
                        ForEach(cart.items) { item in
                            VStack(alignment: .leading, spacing: 4) {
                                Text(item.name)
                                    .font(.headline)
                                Text(String(format: "$%.2f", item.price))
                                    .font(.subheadline)
                                    .foregroundColor(.secondary)
                            }
                        }
                        .onDelete(perform: deleteItem)
                    }

                    HStack {
                        Text("Total:")
                            .font(.headline)
                        Spacer()
                        Text(String(format: "$%.2f", cart.totalPrice))
                            .font(.headline)
                    }
                    .padding()

                    Button("Clear Cart") {
                        cart.clear()
                    }
                    .foregroundColor(.red)
                    .padding(.bottom)
                }
                Button("Checkout") {
                    showCheckoutAlert = true
                }
                .font(.headline)
                .foregroundColor(.white)
                .padding()
                .background(Color.blue)
                .cornerRadius(12)
                .padding(.horizontal)

            }
            .alert("Order Placed!", isPresented: $showCheckoutAlert) {
                Button("OK") {
                    cart.clear()
                    dismiss()
                }
            } message: {
                Text("Your order has been successfully placed.")
            }

            .navigationTitle("Your Cart")
            .toolbar {
                ToolbarItem(placement: .cancellationAction) {
                    Button("Close") {
                        dismiss()
                    }
                }
            }
        }
    }

    private func deleteItem(at offsets: IndexSet) {
        cart.items.remove(atOffsets: offsets)
    }
}
