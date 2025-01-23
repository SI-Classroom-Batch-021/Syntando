//
//  DiscoverView.swift
//  Batch21LiefrandoLogin
//
//  Created by Kevin Waltz on 22.01.25.
//

import SwiftUI

struct Restaurant: Identifiable {
    let id = UUID()
    
    var name: String
    var image: String
    var address: String
    var priceLevel: String
    var isDogFriendly: Bool
    var accessible: Bool
}

struct DiscoverView: View {
    
    private let restaurants = [
        Restaurant(
            name: "Bella Italia",
            image: "burger",
            address: "Musterstraße 1, 10115 Berlin",
            priceLevel: "$$",
            isDogFriendly: true,
            accessible: true
        ),
        Restaurant(
            name: "Green Garden Café",
            image: "burger",
            address: "Hauptstraße 45, 80331 München",
            priceLevel: "$",
            isDogFriendly: false,
            accessible: true
        ),
        Restaurant(
            name: "Skyline Diner",
            image: "burger",
            address: "Bahnhofstraße 12, 50667 Köln",
            priceLevel: "$$$",
            isDogFriendly: true,
            accessible: false
        ),
        Restaurant(
            name: "Sushi Paradise",
            image: "burger",
            address: "Marktplatz 20, 70173 Stuttgart",
            priceLevel: "$$$$",
            isDogFriendly: false,
            accessible: true
        ),
        Restaurant(
            name: "Burger Haven",
            image: "burger",
            address: "Ringstraße 33, 20095 Hamburg",
            priceLevel: "$$",
            isDogFriendly: true,
            accessible: false
        )
    ]
    
    private var dogFriendlyRestaurants: [Restaurant] {
        restaurants.filter { $0.isDogFriendly }
    }
    
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(spacing: 36) {
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 20) {
                            ForEach(dogFriendlyRestaurants) { restaurant in
                                VStack(spacing: 0) {
                                    ZStack(alignment: .bottom) {
                                        Image(restaurant.image)
                                            .resizable()
                                        
                                        LinearGradient(colors: [.clear, .gray], startPoint: .top, endPoint: .bottom)
                                            .frame(height: 60)
                                    }
                                    
                                    Text(restaurant.name)
                                        .font(.title)
                                        .fontWeight(.bold)
                                        .frame(maxWidth: .infinity, alignment: .leading)
                                        .padding(12)
                                }
                                .frame(width: 300, height: 250)
                                .background(.gray.opacity(0.3))
                                .clipShape(RoundedRectangle(cornerRadius: 24))
                            }
                        }
                        .padding(.horizontal, 20)
                    }
                    
                    VStack(spacing: 12) {
                        ForEach(restaurants) { restaurant in
                            NavigationLink {
                                RestaurantDetailView(restaurant: restaurant)
                            } label: {
                                HStack(spacing: 16) {
                                    Image(restaurant.image)
                                        .resizable()
                                        .frame(width: 100, height: 100)
                                        .clipShape(RoundedRectangle(cornerRadius: 12))
                                    
                                    VStack(spacing: 8) {
                                        Text(restaurant.name)
                                            .font(.title3)
                                            .fontWeight(.bold)
                                            .foregroundStyle(.syntaxPurple)
                                            .frame(maxWidth: .infinity, alignment: .leading)
                                        
                                        Text(restaurant.address)
                                            .font(.body)
                                            .lineLimit(1)
                                            .foregroundStyle(.black)
                                            .frame(maxWidth: .infinity, alignment: .leading)
                                    }
                                }
                                .padding(.horizontal, 20)
                            }
                        }
                    }
                }
            }
            .navigationTitle("Entdecken")
            .toolbar {
                Button {
                    
                } label: {
                    Image(systemName: "person.circle.fill")
                }
            }
        }
    }
    
}

#Preview {
    DiscoverView()
}
