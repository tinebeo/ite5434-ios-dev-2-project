//
//  MyItems.swift
//  RentToGo
//
//  Created by Михаил Пак on 22.03.2022.
//

import SwiftUI

struct MyItems: View {
    @EnvironmentObject var model: ProductViewModel

    var body: some View {
        VStack {
            List($model.products) { product in
                Button(action: {
                    print("Result pressed")
                }) {
                    HStack {
                        Image("photoPlaceholder").data(url: product.imageUrl.wrappedValue!).resizable().scaledToFit().frame(width: 100.0, height: 150.0)
                        VStack(alignment: .leading) {
                            Text("\(product.name.wrappedValue) | \(product.category.wrappedValue ?? "")")
                            Text("\(String(format: "%.1f", product.price.wrappedValue))").font(.system(size: 14)).padding(.bottom, 1)
                            Text(product.description.wrappedValue).font(.system(size: 14))
                        }
                        Spacer()
                        Button {
                            
                        } label: {
                            Image("deleteBtn")
                        }
                    }
                }
                
            }
            .listStyle(.plain)
            Spacer()
        }
        .padding(.top, 95)
    }
}

struct MyItems_Previews: PreviewProvider {
    static var previews: some View {
        MyItemsView()
    }
}

extension Image {
    func data(url:String)-> Self {
        if let data = try? Data(contentsOf: (URL(string: url) ?? URL(string: "https://media.istockphoto.com/vectors/thumbnail-image-vector-graphic-vector-id1147544807?k=20&m=1147544807&s=612x612&w=0&h=pBhz1dkwsCMq37Udtp9sfxbjaMl27JUapoyYpQm0anc="))!) {
            return Image(uiImage: UIImage(data: data)!).resizable()
        }
        return self.resizable()
    }
}
