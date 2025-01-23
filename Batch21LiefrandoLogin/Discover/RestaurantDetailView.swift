//
//  RestaurantDetailView.swift
//  Batch21LiefrandoLogin
//
//  Created by Kevin Waltz on 22.01.25.
//

import SwiftUI

struct RestaurantDetailView: View {
    
    // MARK: - Properties
    
    let restaurant: Restaurant
    
    
    
    // MARK: - Body
    
    var body: some View {
        ScrollView {
            VStack(spacing: 0) {
                ZStack(alignment: .bottom) {
                    Image(restaurant.image)
                        .resizable()
                        .frame(height: 400)
                    
                    UnevenRoundedRectangle(topLeadingRadius: 24, bottomLeadingRadius: 0, bottomTrailingRadius: 0, topTrailingRadius: 24, style: .circular)
                        .frame(height: 30)
                        .foregroundStyle(.white)
                }
                
                VStack(spacing: 36) {
                    VStack(spacing: 8) {
                        HStack(spacing: 12) {
                            Text(restaurant.name)
                                .font(.title)
                                .fontWeight(.bold)
                                .foregroundStyle(.syntaxPurple)
                                .frame(maxWidth: .infinity, alignment: .leading)
                            
                            Button {
                                
                            } label: {
                                Text("6.5km")
                                    .font(.headline)
                                    .tint(.syntaxDeepPurple)
                                    .padding(.vertical, 6)
                                    .padding(.horizontal, 12)
                                    .background(.syntaxYellow)
                                    .clipShape(Capsule())
                            }
                        }
                        
                        Text(restaurant.address)
                            .font(.body)
                            .lineLimit(1)
                            .foregroundStyle(.black)
                            .frame(maxWidth: .infinity, alignment: .leading)
                    }
                    .padding(.horizontal, 20)
                    
                    HStack(spacing: 30) {
                        VStack {
                            Text(restaurant.priceLevel)
                                .foregroundStyle(.white)
                                .frame(width: 72, height: 72)
                                .background(.syntaxPurple)
                                .clipShape(Circle())
                            
                            Text("Preislevel")
                        }
                        
                        VStack {
                            Image(systemName: "dog.fill")
                                .foregroundStyle(.white)
                                .rotationEffect(.degrees(restaurant.isDogFriendly ? 0 : 180))
                                .frame(width: 72, height: 72)
                                .background(.syntaxPurple)
                                .clipShape(Circle())
                            
                            Text("Hundefreundlich")
                        }
                        
                        VStack {
                            Text(restaurant.accessible ? "👩‍🦽" : "😭")
                                .foregroundStyle(.white)
                                .frame(width: 72, height: 72)
                                .background(.syntaxPurple)
                                .clipShape(Circle())
                            
                            Text("Barrierefrei")
                        }
                    }
                }
            }
        }
        .ignoresSafeArea(edges: .top)
    }
    
}

#Preview {
    RestaurantDetailView(restaurant:
                            Restaurant(
                                name: "Burger Haven",
                                image: "burger",
                                address: "Ringstraße 33, 20095 Hamburg",
                                priceLevel: "$$",
                                isDogFriendly: true,
                                accessible: false
                            ))
}
