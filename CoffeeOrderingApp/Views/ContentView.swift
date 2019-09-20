//
//  ContentView.swift
//  CoffeeOrderingApp
//
//  Created by ds-mayur on 9/18/19.
//  Copyright © 2019 Mayur Rathod. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject private var orderListVM = OrderListViewModel()
    
    @State private var showModal : Bool = false
    
    var body: some View {
        NavigationView{
            OrderListView(orders: self.orderListVM.orders)
            .navigationBarTitle("Coffee Orders")
                .navigationBarItems(leading: Button(action: reloadOrders){
                    Image(systemName: "arrow.clockwise")
                        .foregroundColor(Color.blue)
                }, trailing: Button(action: showAddCoffeeOrderView){
                    Image(systemName: "plus")
                        .foregroundColor(Color.blue)
                })
            
            .sheet(isPresented: $showModal){
                AddCoffeeOrderView(isPresented: self.$showModal)
            }
        }
    }
    
    private func reloadOrders(){
        self.orderListVM.fetchOrders()
    }
    
    private func showAddCoffeeOrderView(){
        self.showModal = true
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
