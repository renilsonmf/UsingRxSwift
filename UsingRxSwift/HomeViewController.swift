//
//  HomeViewController.swift
//  UsingRxSwift
//
//  Created by Renilson Moreira on 13/09/22.
//

import UIKit
import RxSwift
import RxCocoa

struct Product {
    let imageName: String
    let title: String
}

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

class HomeViewController: UIViewController {
    
    private let homeView = HomeView()
    private var viewModel = ProductViewModel()
    
    private var bag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bindTableData()
        bindDidTapButtons()
    }
    
    override func loadView() {
        super.loadView()
        self.view = homeView
    }
    
    func bindDidTapButtons() {
        homeView.onNextButton.rx.tap
            .subscribe { [ weak self ] _ in
                self?.viewModel.nextScreen()
            }
            .disposed(by: bag)
    }
    
    func bindTableData() {
        // Bind items to table
        viewModel.items.bind(to: homeView.tableView.rx.items(
            cellIdentifier: "cell",
            cellType: UITableViewCell.self)) { row, model, cell in
                cell.textLabel?.text = model.title
                cell.imageView?.image = UIImage(systemName: model.imageName)
            }.disposed(by: bag)
        
        // Bind a model selected handler
        homeView.tableView.rx.modelSelected(Product.self).bind { product in
            print(product.title)
        }
        
        // fetch items
        viewModel.fetchItems()
        
    }


}

