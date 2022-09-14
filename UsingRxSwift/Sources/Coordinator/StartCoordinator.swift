//
//  StartCoordinator.swift
//  UsingRxSwift
//
//  Created by Renilson Moreira on 14/09/22.
//

import UIKit

class StartCoordinator: Coordinator {
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let controller = HomeViewController()
        navigationController.pushViewController(controller, animated: true)
    }
    
}
