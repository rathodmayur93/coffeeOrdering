//
//  CoffeeService.swift
//  CoffeeOrderingApp
//
//  Created by ds-mayur on 9/18/19.
//  Copyright © 2019 Mayur Rathod. All rights reserved.
//

import Foundation


class WebService{
    
    func createCoffeeOrder(order : Order, completion: @escaping( (CreateOrderResponse?) -> ())){
        
        guard let url = URL(string: AppConstants.orders) else {
            fatalError("Invalid URL")
        }
        
        var request             = URLRequest(url: url)
        request.httpMethod      = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpBody = try? JSONEncoder().encode(order)
        
        URLSession.shared.dataTask(with: request){ data, response, error in
            
            guard let responseData = data, error == nil else{
                DispatchQueue.main.async {
                    completion(nil)
                }
                return
            }
            
            let createOrderResponse = try? JSONDecoder().decode(CreateOrderResponse.self, from: responseData)
            DispatchQueue.main.async {
                completion(createOrderResponse)
            }
        }.resume()
    }
    
    
    func getAllOrders(completion: @escaping ([Order]?) -> ()) {
        guard let url = URL(string: AppConstants.orders) else{
            DispatchQueue.main.async {
                completion(nil)
            }
            return
        }
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            
            guard let responseData = data, error == nil else{
                DispatchQueue.main.async {
                    completion(nil)
                }
                
                return
            }
            
            let orders = try? JSONDecoder().decode([Order].self, from: responseData)
            DispatchQueue.main.async {
                completion(orders)
            }
        }.resume()
    }
}
