//
//  AddCoffeeOrderViewModel.swift
//  CoffeeOrderingApp
//
//  Created by ds-mayur on 9/20/19.
//  Copyright © 2019 Mayur Rathod. All rights reserved.
//

import Foundation

class AddCoffeeOrderViewModel : ObservableObject{
    
    private var webService : WebService
    
    //MARK:- Variables
    var name                    : String = ""
    @Published var size         : String = "Medium"
    @Published var coffeeName   : String = ""
    
    var coffeeList : [CoffeeViewModel]{
        return Coffee.all().map(CoffeeViewModel.init)
    }
    
    var total : Double{
        return calculateTotalPrice()
    }
    
    //MARK: Initializatino
    init() {
        self.webService = WebService()
    }
    
    //MARK: Functions
    
    private func prizeForSize() -> Double{
        let prices = ["Small" : 2.0, "Medium" : 3.0, "Large" : 4.0]
        return prices[self.size] ?? 0.0
    }
    
    private func calculateTotalPrice() -> Double{
        let coffeeVM = coffeeList.first { $0.name == coffeeName }
        if let coffee = coffeeVM{
            return coffee.price * prizeForSize()
        }else{
            return 0.0
        }
    }
    
    //MARK: API Call
    func placeOrder(){
        
        let order = Order(name: self.name, size: self.size, coffeeName: self.coffeeName, total: self.total)
        self.webService.createCoffeeOrder(order: order) { (createOrderResponse) in
            if (!createOrderResponse!.success){
                print("Failed To Place AN Order")
            }
        }
    }
    
}

