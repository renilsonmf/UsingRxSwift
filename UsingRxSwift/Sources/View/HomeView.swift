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
    
    lazy var nameTextField: UITextField = {
        let textField = UITextField()
        textField.backgroundColor = .systemGray
        textField.layer.borderColor = UIColor.white.cgColor
        textField.layer.borderWidth = 1
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
}

extension HomeView: ViewCodeContract {
    func setupHierarchy() {
        addSubview(tableView)
        addSubview(onNextButton)
        addSubview(nameTextField)
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
            
            nameTextField.topAnchor.constraint(equalTo: onNextButton.bottomAnchor, constant: 20),
            nameTextField.leftAnchor.constraint(equalTo: leftAnchor, constant: 10),
            nameTextField.rightAnchor.constraint(equalTo: rightAnchor, constant: -10),
            nameTextField.heightAnchor.constraint(equalToConstant: 48),
        ])
    }
    
    func setupConfiguration() {
        backgroundColor = .systemGray
    }
    
    
}

extension String {
    
    func isValidEmail() -> Bool {
        // here, `try!` will always succeed because the pattern is valid
        let regex = try! NSRegularExpression(pattern: "^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?(?:\\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?)*$", options: .caseInsensitive)
        return regex.firstMatch(in: self, options: [], range: NSRange(location: 0, length: count)) != nil
    }
}
