//
//  Item.swift
//  E-CommerceApp
//
//  Created by Магомед Ахильгов on 29.07.2021.
//

import SwiftUI

//Item Model and Sample Data...

struct Item: Identifiable {
    
    var id = UUID().uuidString
    var title: String
    var subtitle: String
    var price: String
    var rating: String
    var image: String
}

//Colors names and Pics are same
var items = [
    Item(title: "Vincent Chase", subtitle: "Black Full Rim", price: "$3.8", rating: "3.8", image: "p1"),
    Item(title: "John Jacobs", subtitle: "Brown Tortoise", price: "$45", rating: "4.9", image: "p2"),
    Item(title: "Wood Black", subtitle: "Office Glasses", price: "$4.9", rating: "4.2", image: "p3"),
    Item(title: "Vu Abstact", subtitle: "Fashion U", price: "$65", rating: "3.5", image: "p4")
]

