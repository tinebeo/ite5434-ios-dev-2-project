//
//  MyItemsHistoryView.swift
//  RentToGo
//
//  Created by Михаил Пак on 22.03.2022.
//

import SwiftUI

struct MyItemsHistoryView: View {
    @ObservedObject var model = ProductViewModel()
    init() {
        model.getData()
    }
    
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
                            LabeledCheckbox(isChecked: product.isReturned)
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

struct LabeledCheckbox: View {
  @Binding var isChecked: Bool

  var body: some View {
    Button(action: {
      self.isChecked.toggle()
    }) {
        Image(isChecked ? "returnedBtn2" : "returnedBtn")
    }
  }
}

struct MyItemsHistoryView_Previews: PreviewProvider {
    static var previews: some View {
        MyItemsView()
    }
}
