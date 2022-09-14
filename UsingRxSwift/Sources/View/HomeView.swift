//
//  HomeView.swift
//  UsingRxSwift
//
//  Created by Renilson Moreira on 14/09/22.
//

import UIKit


class HomeView: UIView {

    override init(frame: CGRect = .zero) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    lazy var tableView: UITableView = {
        let table = UITableView()
        table.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        table.translatesAutoresizingMaskIntoConstraints = false
        return table
    }()
    
    lazy var onNextButton: UIButton = {
        let button = UIButton()
        button.setTitle("proxima tela", for: .normal)
        button.setTitleColor(UIColor.blue, for: .normal)
        button.backgroundColor = .yellow
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
}

extension HomeView: ViewCodeContract {
    func setupHierarchy() {
        addSubview(tableView)
        addSubview(onNextButton)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 10),
            tableView.leftAnchor.constraint(equalTo: leftAnchor, constant: 10),
            tableView.rightAnchor.constraint(equalTo: rightAnchor, constant: -10),
            tableView.heightAnchor.constraint(equalToConstant: 250),
            
            onNextButton.topAnchor.constraint(equalTo: tableView.bottomAnchor, constant: 20),
            onNextButton.leftAnchor.constraint(equalTo: leftAnchor, constant: 10),
            onNextButton.rightAnchor.constraint(equalTo: rightAnchor, constant: -10),
            onNextButton.heightAnchor.constraint(equalToConstant: 48),
        ])
    }
    
    func setupConfiguration() {
        backgroundColor = .systemGray
    }
    
    
}
