//
//  ProductViewModel.swift
//  UsingRxSwift
//
//  Created by Renilson Moreira on 14/09/22.
//

import RxSwift

struct ProductViewModel {
    var items = PublishSubject<[Product]>()
    
    func fetchItems() {
        let products = [
            Product(imageName: "house", title: "home1"),
            Product(imageName: "gear", title: "home2"),
            Product(imageName: "person.circle", title: "home3"),
            Product(imageName: "airplane", title: "home4"),
            Product(imageName: "bell", title: "home5"),
        ]
        
        items.onNext(products)
        items.onCompleted()
    }
    
    func nextScreen() {
        print("next")
    }
}
