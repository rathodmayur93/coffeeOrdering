//
//  CoffeeViewModel.swift
//  CoffeeOrderingApp
//
//  Created by ds-mayur on 9/20/19.
//  Copyright © 2019 Mayur Rathod. All rights reserved.
//

import Foundation

class CoffeeListViewModel{
    var coffeeList : [CoffeeViewModel] = [CoffeeViewModel]()
}

struct CoffeeViewModel {
    
    var coffeeVM : Coffee
    
    init(coffee : Coffee) {
        self.coffeeVM = coffee
    }
    
    var name : String{
        return self.coffeeVM.name
    }
    
    var imageUrl : String{
        return self.coffeeVM.imageUrl
    }
    
    var price : Double{
        return self.coffeeVM.price
    }
    
}
