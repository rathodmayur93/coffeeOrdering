//
//  OrderListViewModel.swift
//  CoffeeOrderingApp
//
//  Created by ds-mayur on 9/19/19.
//  Copyright © 2019 Mayur Rathod. All rights reserved.
//

import Foundation

class OrderListViewModel : ObservableObject{
    
    @Published var orders = [OrderViewModel]()
    
    init() {
        fetchOrders()
    }
    
    func fetchOrders(){
        WebService().getAllOrders { orders in
            if let ordersObj = orders{
                self.orders = ordersObj.map(OrderViewModel.init)
                print("Orders \(orders)")
            }
        }
    }
    
}


class OrderViewModel : Identifiable{
    
    let ID = UUID()
    
    var order : Order
    
    init(order : Order) {
        self.order = order
    }
    
    var name : String{
        return self.order.name
    }
    
    var size : String{
        return self.order.size
    }
    
    var coffeeName : String{
        return self.order.coffeeName
    }
    
    var total : Double{
        return self.order.total
    }
}
