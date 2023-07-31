//
//  Cart Manager.swift
//  ODC-Project
//
//  Created by Omar Salem on 30/07/2023.
//

import Foundation

struct CartItem {
    let product: Products
    var quantity: Int
}

class CartManager{
    static let shared = CartManager()
    
    var cartItems : [CartItem] = []
    
    func addToCart(_ product: Products) {
            if let index = cartItems.firstIndex(where: { $0.product.id == product.id }) {
      
                cartItems[index].quantity += 1
            } else {
    
                let cartItem = CartItem(product: product, quantity: 1)
                cartItems.append(cartItem)
            }
        }
}
