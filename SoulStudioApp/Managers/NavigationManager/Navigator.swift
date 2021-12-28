//
//  Navigator.swift
//  SoulStudioApp
//
//  Created by mac on 28/12/21.
//

import UIKit

class MainNavigator: Coordinator {
    
    var childCoordinators = [Coordinator]()
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let vc = BookListViewController.instantiateMain()
        vc.coordinator = self
        navigationController.pushViewController(vc, animated: false)
    }
}
