//
//  Products.swift
//  ProductsApp
//
//  Created by Gül Karataş on 5.10.2024.
//

import Foundation

class Products{
   
    var id: Int?
    var name: String?
    var price: String?
    
    init() {
        
    }
    
    init(id: Int, name: String , price: String ) {
        self.id = id
        self.name = name
        self.price = price
    }
    
}
