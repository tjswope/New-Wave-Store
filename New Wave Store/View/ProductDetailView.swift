//
//  ProductDetailView.swift
//  New Wave Store
//
//  Created by Swope, Thomas on 11/28/22.
//

import SwiftUI

struct ProductDetailView: View {
    @Binding var product: Product
    
    var body: some View {
        VStack{
            Image(product.name)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .padding(20)
            //.frame(width: UIScreen.main.bounds.width - 40)
            
            VStack(alignment: .leading){
                Text(product.name)
                    .font(Constants.textFont.bold())
                    .padding([.trailing, .leading, .bottom], 5)
                
                Text(product.description)
                    .font(Constants.textFont)
                    .padding([.trailing, .leading, .bottom], 5)
                
                Text(String(format: "$%.2f", product.price))
                    .font(Constants.textFont)
                    .foregroundColor(Color.highlight)
                    .padding([.trailing, .leading, .bottom], 5)
                
                Text("Quantity Available: \(product.quantity)")
                    .font(Constants.textFont)
                    .padding([.trailing, .leading, .bottom], 5)
                Spacer()
                
                Button {
                    
                } label: {
                    Text("Add to Cart")
                        .font(Constants.textFont)
                        .frame(width: UIScreen.main.bounds.width - 60, alignment: .center)
                        .padding(10)
                        .foregroundColor(.black)
                        .background(Color.highlight)
                        .cornerRadius(10)
                }
            }
        }
    }
}

struct ProductDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ProductDetailView(product: Binding.constant(Product()))
    }
}
