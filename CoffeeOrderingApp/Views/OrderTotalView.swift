//
//  OrderTotalView.swift
//  CoffeeOrderingApp
//
//  Created by ds-mayur on 9/20/19.
//  Copyright © 2019 Mayur Rathod. All rights reserved.
//

import SwiftUI

struct OrderTotalView: View {
    
    var total : Double
    
    var body: some View {
        
        HStack(alignment: .center) {
            Spacer()
            Text(String(format: "$ %.2f", self.total))
                .font(.title)
                .foregroundColor(Color.green)
            
            Spacer()
        }.padding(10)
    }
}

struct OrderTotalView_Previews: PreviewProvider {
    static var previews: some View {
        OrderTotalView(total: 45.0)
    }
}
