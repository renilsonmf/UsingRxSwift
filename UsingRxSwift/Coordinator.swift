//
//  Coordinator.swift
//  UsingRxSwift
//
//  Created by Renilson Moreira on 14/09/22.
//

import UIKit

protocol Coordinator {
    var navigationController: UINavigationController { get set }
    func start()
}
