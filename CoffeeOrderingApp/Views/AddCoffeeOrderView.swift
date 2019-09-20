//
//  AddCoffeeOrderView.swift
//  CoffeeOrderingApp
//
//  Created by ds-mayur on 9/20/19.
//  Copyright © 2019 Mayur Rathod. All rights reserved.
//

import SwiftUI

struct AddCoffeeOrderView: View {
    
    @Binding var isPresented : Bool
    @ObservedObject private var addCoffeeOrderVM = AddCoffeeOrderViewModel()
    
    
    var body: some View {
        NavigationView{
            
            VStack{
                Form{
                    //Information Section
                    Section(header: Text("INFORMATION").font(.body)){
                        TextField("Enter Name", text: $addCoffeeOrderVM.name)
                    }
                    
                    //Coffee List Section
                    Section(header: Text("SELECT COFFEE").font(.body)){
                        
                        ForEach(addCoffeeOrderVM.coffeeList, id: \.name){ coffee in
                            CoffeeCellView(coffee: coffee,
                                           selection: self.$addCoffeeOrderVM.coffeeName)
                        }
                    }
                    
                    //Coffee Size Section
                    Section(header: Text("SELECT COFFEE SIZE").font(.body),
                            footer: OrderTotalView(total: self.addCoffeeOrderVM.total))
                    {
                        
                        Picker("", selection: self.$addCoffeeOrderVM.size){
                            Text("Small").tag("Small")
                            Text("Medium").tag("Medium")
                            Text("Large").tag("Large")
                        }.pickerStyle(SegmentedPickerStyle())
                    }
                }
                
                //Place Order Button
                Button("Place Order"){
                    self.addCoffeeOrderVM.placeOrder()
                    self.isPresented = false
                }
                .padding(EdgeInsets(top: 12.0, leading: 100.0, bottom: 12.0, trailing: 100.0))
                .foregroundColor(Color.white)
                .background(Color(red: 46/255, green: 204/255, blue: 113/255))
                .cornerRadius(10.0)
                

            }
            
            .navigationBarTitle("Add Order")
        }
    }
}

struct AddCoffeeOrderView_Previews: PreviewProvider {
    static var previews: some View {
        AddCoffeeOrderView(isPresented: .constant(false))
    }
}

struct CoffeeCellView: View {
    
    let coffee : CoffeeViewModel
    @Binding var selection : String
    
    var body: some View {
        HStack{
            Image(coffee.imageUrl)
                .resizable()
                .frame(width: 50.0, height: 50.0)
                .cornerRadius(8.0)
            Text(coffee.name)
                .font(.body)
                .padding([.leading], 10)
            Spacer()
            Image(systemName: self.selection == coffee.name ? "checkmark" : "")
        }.onTapGesture {
            self.selection = self.coffee.name
        }
    }
}
