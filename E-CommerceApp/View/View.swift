//
//  View.swift
//  E-CommerceApp
//
//  Created by Магомед Ахильгов on 29.07.2021.
//

import SwiftUI

struct ViewItem: View {
    var item: Item
    var animation: Namespace.ID
    
    var body: some View {
        VStack{
            HStack{
                Spacer(minLength: 0)
                Text(item.price)
                    .fontWeight(.heavy)
                    .foregroundColor(.black)
                    .padding(.vertical, 8)
                    .padding(.horizontal, 10)
                    .background(Color.white.opacity(0.5))
                    .cornerRadius(10)
            }
            Image(item.image)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .padding(.top,30)
                .padding(.bottom)
                .padding(.horizontal, 10)
            Text(item.title)
                .fontWeight(.bold)
                .foregroundColor(.black)
            Text(item.subtitle)
                .font(.caption)
                .foregroundColor(.gray)
            //Using Matched Geometry Effect For Hero Animation
            HStack{
                Button(action: {}) {
                    Image(systemName: "suit.heart")
                        .font(.title2)
                        .foregroundColor(.black)
                }
                .matchedGeometryEffect(id: "heart\(item.id)", in: animation)
                
                Spacer(minLength: 0)
                Text(item.rating)
                    .fontWeight(.heavy)
                    .foregroundColor(.black)
                    .matchedGeometryEffect(id: "rating\(item.id)", in: animation)
                
            }
            .padding()
        }
        //Giving hero effect for colors also...
        .background(
            Color(item.image)
                .matchedGeometryEffect(id: "color\(item.id)", in: animation))
        .cornerRadius(15)
    }
}

