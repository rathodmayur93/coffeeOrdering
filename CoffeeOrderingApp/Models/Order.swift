//
//  Order.swift
//  CoffeeOrderingApp
//
//  Created by ds-mayur on 9/18/19.
//  Copyright © 2019 Mayur Rathod. All rights reserved.
//

import Foundation


struct Order: Codable{
    
    let name, size, coffeeName : String
    let total : Double
}
