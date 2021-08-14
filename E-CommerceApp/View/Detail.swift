//
//  Detail.swift
//  E-CommerceApp
//
//  Created by Магомед Ахильгов on 31.07.2021.
//

import SwiftUI

struct Detail: View {
    @Binding var selectedItem: Item
    @Binding var show: Bool
    
    var animation: Namespace.ID
    
    @State var loadContent = false
   
    var body: some View {
    
            VStack{
                HStack(spacing: 25){
                    Button(action: {
                        //Closing View animation...
                        withAnimation(.spring()) {show.toggle()}
                    }) {
                        Image(systemName: "chevron.left")
                            .font(.title)
                            .foregroundColor(.black)
                    }
                    Spacer()
                    Button(action: {}) {
                        Image(systemName: "magnifyingglass")
                            .font(.title)
                            .foregroundColor(.black)
                    }
                    Button(action: {}) {
                        Image(systemName: "bag")
                            .font(.title)
                            .foregroundColor(.black)
                    }
                }
                .padding()
                
                VStack(spacing: 10) {
                    Image(selectedItem.image)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        //Since id is common
                        .matchedGeometryEffect(id: "image\(selectedItem.id)", in: animation)
                        .padding()
                    Text(selectedItem.title)
                        .font(.title)
                        .fontWeight(.heavy)
                        .foregroundColor(.black)
                    Text(selectedItem.subtitle)
                        .foregroundColor(.black)
                        .padding(.top, 4)

                    HStack{
                    
                        Text(selectedItem.rating)
                            .fontWeight(.heavy)
                            .foregroundColor(.black)
                            .matchedGeometryEffect(id: "rating\(selectedItem.id)", in: animation)
                        
                        Spacer(minLength: 0)
                        
                        Button(action: {}) {
                            Image(systemName: "suit.heart")
                                .font(.title2)
                                .foregroundColor(.black)
                        }
                        .matchedGeometryEffect(id: "heart\(selectedItem.id)", in: animation)
                    }
                    .padding()
                }
                .padding(.top,35)
                .background(Color(selectedItem.image)
                                .clipShape(CustomShape())
                                .matchedGeometryEffect(id: "color\(selectedItem.id)", in: animation))
                .cornerRadius(15)
                .padding()
                
                //Delay loading the content for smooth animation
                
                VStack{
                    VStack(spacing: 8){
                        Text("Exclusive Offer")
                            .fontWeight(.heavy)
                            .foregroundColor(.black)
                        
                        Text("Frame + Lens for(it's 50% off")
                            .foregroundColor(.gray)
                    }
                    .padding(.vertical)
                    .frame(width: UIScreen.main.bounds.width - 30, alignment: .leading)
                }
                .padding([.horizontal, .bottom])
                .frame(width: loadContent ? nil : 0)
                .opacity(loadContent ? 1 : 0)
                
                //for smooth trancition...
                
                
                Spacer(minLength: 0)
        }
            .onAppear {
                withAnimation(Animation.spring().delay(0.45)){
                    loadContent.toggle()
                }
            }
    }
}


