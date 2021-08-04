//
//  Home.swift
//  E-CommerceApp
//
//  Created by Магомед Ахильгов on 28.07.2021.
//

//someChanges
import SwiftUI

struct Home: View {
    @State var selected = tabs[0]
    @Namespace var animation: Namespace.ID
    
    @State var show = false
    @State var selectedItem: Item = items[0]
    
    var body: some View {
        ZStack {
            VStack{
                HStack{
                    Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                        Image(systemName: "line.horizontal.3.decrease")
                            .font(.system(size: 25, weight: .heavy))
                            .foregroundColor(.black)
                    })
                    Spacer()
                    Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                        Image("profilePic")
                            .resizable()
                            .aspectRatio(contentMode: /*@START_MENU_TOKEN@*/.fill/*@END_MENU_TOKEN@*/)
                            .frame(width: 45, height: 45)
                            .cornerRadius(15)
                    })
                }
                .padding(.vertical, 10)
                .padding(.horizontal)
                Spacer(minLength: 0)
                ScrollView {
                    HStack{
                        VStack (alignment: .leading){
                            Text("Let's")
                                .font(.title)
                                .foregroundColor(.black)
                            Text("Get Started")
                                .font(.largeTitle)
                                .fontWeight(.heavy)
                                .foregroundColor(.black)
                            
                        }
                        .padding(.horizontal)
                        Spacer(minLength: 0)
                    }
                    HStack(spacing: 0){
                        ForEach(tabs,id:\.self){tab in
                            //Tab Button...
                            TabButton(title: tab, selected: $selected, animation: animation)
                            //even spacing...
                            if tabs.last != tab {
                                Spacer(minLength: 0)

                            }
                        }
                    }
                    .padding()
                    .padding(.top,5)
                    
                    LazyVGrid(columns: Array(repeating: GridItem(.flexible(), spacing: 20), count: 2), spacing: 25) {
                        ForEach(items) {item in
                            //Card View...
                            ViewItem(item: item, animation: animation)
                                .onTapGesture {
                                    withAnimation(.spring()) {
                                        selectedItem = item
                                        show.toggle()
                                    }
                                }
                        }
                    }
                    .padding()
                }
                Spacer(minLength: 0)
            }
            .opacity(show ? 0 : 1)
            if show{
                Detail(selectedItem: $selectedItem, show: $show, animation: animation)
            }
        }
        .background(Color.white.ignoresSafeArea())
    }
}

//Tabs...
var tabs = ["Glasses", "Watched", "Shoes", "Parfume"]

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
