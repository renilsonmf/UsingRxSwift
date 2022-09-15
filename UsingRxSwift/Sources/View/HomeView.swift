//
//  HomeView.swift
//  UsingRxSwift
//
//  Created by Renilson Moreira on 14/09/22.
//

import UIKit


class HomeView: UIView {

    // MARK: - Init
    override init(frame: CGRect = .zero) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - View Code
    lazy var containerStack: UIStackView = {
        let stack = UIStackView()
        stack.distribution = .fill
        stack.spacing = 20
        stack.axis = .vertical
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
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
    
    lazy var emailTextField: UITextField = {
        let textField = UITextField()
        textField.backgroundColor = .systemGray
        textField.layer.borderColor = UIColor.white.cgColor
        textField.layer.borderWidth = 1
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
}

// MARK: - Contract ViewCode
extension HomeView: ViewCodeContract {
    func setupHierarchy() {
        addSubview(containerStack)
    }
    
    func setupConstraints() {
        
        containerStack.addArrangedSubview(tableView)
        containerStack.addArrangedSubview(onNextButton)
        containerStack.addArrangedSubview(emailTextField)
        
        NSLayoutConstraint.activate([
            
            containerStack.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 10),
            containerStack.leftAnchor.constraint(equalTo: leftAnchor, constant: 10),
            containerStack.rightAnchor.constraint(equalTo: rightAnchor, constant: -10),

            tableView.heightAnchor.constraint(equalToConstant: 250),
            onNextButton.heightAnchor.constraint(equalToConstant: 48),
            emailTextField.heightAnchor.constraint(equalToConstant: 48),

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
