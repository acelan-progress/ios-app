//
//  TabBarController.swift
//  AcelanProgress
//
//  Created by Mikhail Yeremeyev on 23.04.2023.
//

import UIKit
import StatefulArch

final class TabBarController: UITabBarController {
    
    private let serviceProvider: ServiceProvider
    
    private lazy var borderView: UIView = {
        let view = UIView()
        view.backgroundColor = .resource(.LightGray)
        self.tabBar.addSubview(view)
        return view
    }()
    
    init(serviceProvider: ServiceProvider) {
        self.serviceProvider = serviceProvider
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.viewControllers = [
            self.createModule(moduleBuilder: TasksModuleBuilder.main, tabItem: .tasks),
            self.createModule(moduleBuilder: ArtifactsModuleBuilder.main, tabItem: .artifacts),
            self.createModule(moduleBuilder: ProfileModuleBuilder.main, tabItem: .profile)
        ]
        
        self.tabBar.backgroundColor = .resource(.White)
        self.tabBar.backgroundImage = UIImage()
        
        self.tabBar.shadowImage = UIImage()
        
        self.tabBar.unselectedItemTintColor = .resource(.DarkGray)
        self.tabBar.tintColor = .resource(.Purple)
        
        view.insetsLayoutMarginsFromSafeArea = false
        self.selectedIndex = 0
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        borderView.frame = CGRect(x: 0,
                                  y: 0,
                                  width: tabBar.frame.width,
                                  height: 0.5)
    }
    
    private func createModule(moduleBuilder: ModuleBuilder,
                              tabItem: TabBarItem,
                              tag: Int = 0) -> Module {
        let module = moduleBuilder.buildModule(serviceProvider: serviceProvider).asModule()
        module.tabBarItem = self.createUITabBarItem(for: tabItem, tag: tag)
        module.hidesBottomBarWhenPushed = true
        return module
    }
    
    private func createUITabBarItem(for tabItem: TabBarItem, tag: Int) -> UITabBarItem {
        let item = UITabBarItem(title: tabItem.title,
                                image: tabItem.icon,
                                tag: tag)
        let attributes = [
            NSAttributedString.Key.font: UIFont.systemFont(ofSize: 10, weight: .medium)
        ]
        item.setTitleTextAttributes(attributes, for: .normal)
        item.setTitleTextAttributes(attributes, for: .selected)
        return item
    }
    
}
