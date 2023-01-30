//
//  ProductListView.swift
//  New Wave Store
//
//  Created by Swope, Thomas on 11/18/22.
//

import SwiftUI

struct CartItemView: View {
    
    @Binding var product: Product
    
    var body: some View {
        HStack(alignment: .top){
            Image(product.picture)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 100, height: 100)
                .clipShape(Rectangle())
            VStack{
                HStack{
                    
                    Text(product.name)
                        .font(Constants.textFont.bold())
                        .padding([.trailing, .leading])
                    
                    Text(String(format: "$%.2f", product.price))
                        .font(Constants.textFont)
                        .foregroundColor(Color.highlight)
                    
                }
                
                HStack{
                    Text("quantity: ")
                        .font(Constants.textFont)
                        .padding([.trailing, .leading])
                    Picker("quantity: ", selection:  $product.quantity){
                        ForEach(0..<100){number in
                            Text("\(number)")
                        }
                    }
                }
                Spacer()
            }
        }.padding()
    }
}

struct CartItemView_Previews: PreviewProvider {
    static var previews: some View {
        CartItemView(product: Binding.constant(Product()))
    }
}
