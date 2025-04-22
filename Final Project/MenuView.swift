//
//  MenuView.swift
//  Final Project
//
//  Created by Matthew Barghout on 4/8/25.
//
import SwiftUI

struct MenuView: View {
    @State private var menuItems: [MenuItem] = []
    @State private var searchText: String = ""
    @StateObject private var cart = Cart()
    @State private var showingCart = false
    
    var filteredItems: [MenuItem] {
        if searchText.isEmpty {
            return menuItems
        } else {
            return menuItems.filter {
                $0.name.localizedCaseInsensitiveContains(searchText)
                || $0.category.localizedCaseInsensitiveContains(searchText)
            }
        }
    }
    
    var groupedMenu: [String: [MenuItem]] {
        Dictionary(grouping: filteredItems, by: { $0.category })
    }
    
    var body: some View {
        NavigationView {
            ZStack {
                LinearGradient(
                    gradient: Gradient(colors: [.white, Color(red: 250/255, green: 210/255, blue: 183/255)]),
                    startPoint: .top,
                    endPoint: .bottom
                )
                .ignoresSafeArea()
                
                VStack(spacing: 0) {
                    VStack {
                        Text("J and J Kitchen and U-Haul")
                            .font(.system(size: 24, weight: .bold))
                            .foregroundColor(Color(red: 90/255, green: 50/255, blue: 20/255))
                            .padding(.top, 20)
                        
                        Text("Hot wings, comfort food, and more!")
                            .font(.subheadline)
                            .foregroundColor(.gray)
                            .padding(.bottom, 10)
                    }
                    
                    TextField("Search menu...", text: $searchText)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding(.horizontal)
                        .padding(.bottom, 5)
                    
                    List {
                        ForEach(groupedMenu.keys.sorted(), id: \.self) { category in
                            Section(header: Text(category).font(.headline)) {
                                ForEach(groupedMenu[category]!) { item in
                                    NavigationLink(destination: MenuItemDetailView(item: item, cart: cart)) {
                                        MenuItemRow(item: item)
                                    }
                                }
                            }
                        }
                    }
                    .listStyle(InsetGroupedListStyle())
                }
            }
            
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {
                        showingCart = true
                    }) {
                        HStack {
                            Image(systemName: "cart")
                            if !cart.items.isEmpty {
                                Text("\(cart.items.count)")
                                    .font(.caption)
                                    .padding(5)
                                    .background(Color.red)
                                    .foregroundColor(.white)
                                    .clipShape(Circle())
                            }
                        }
                    }
                }
            }
            .sheet(isPresented: $showingCart) {
                CartView(cart: cart)
            }

            .onAppear {
                MenuManager.fetchMenu { items in
                    self.menuItems = items
                }
            }
        }
    }
}



#Preview {
    MenuView()
}
