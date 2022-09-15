//
//  HomeViewController.swift
//  UsingRxSwift
//
//  Created by Renilson Moreira on 13/09/22.
//

import UIKit
import RxSwift
import RxCocoa

class HomeViewController: UIViewController {
    
    // MARK: - Private properties
    private let homeView = HomeView()
    private var viewModel = ProductViewModel()
    private var bag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bindTableData()
        setupRx()
    }
    
    override func loadView() {
        super.loadView()
        self.view = homeView
    }
    
    // MARK: - Setup UI RxSwift
    func setupRx() {
        homeView.onNextButton
            .rx
            .tap
            .subscribe(onNext: { [ weak self ] _ in
                self?.viewModel.nextScreen()
            })
            .disposed(by: bag)
        
        homeView.emailTextField
            .rx
            .controlEvent([.editingChanged])
            .asObservable()
            .subscribe({ [ weak self ] _ in
                guard let name = self?.homeView.emailTextField.text else { return }
                if name.isValidEmail() {
                    self?.homeView.emailTextField.layer.borderColor = UIColor.green.cgColor
                } else {
                    self?.homeView.emailTextField.layer.borderColor = UIColor.red.cgColor
                }
                
            }).disposed(by: bag)
        
//        label
//           .rx
//           .tapGesture()
//           .when(.recognized) // This is important!
//           .subscribe(onNext: { [weak self] _ in
//               guard let self = self else { return }
//               self.doWhatYouNeedToDo()
//           })
//           .disposed(by: disposeBag)
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

