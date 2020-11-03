//
//  TabBar.swift
//  AlineaIOS
//
//  Created by Arpit Singh on 28/10/20.
//

import UIKit

class CustomTabBarController: UITabBarController {
    var customTabBar: CustomTabMenu!
    var tabBarHeight: CGFloat!
    var tabItems = [TabItem]()

    
    init(tabItems: [TabItem],tabBarHeight : CGFloat = 60.7) {
        self.tabItems = tabItems
        self.tabBarHeight = tabBarHeight
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
 
    override func viewDidLoad() {
        super.viewDidLoad()
        loadTabBar()
    }
    
    func loadTabBar(){
    
        self.setupCustomTabMenu(tabItems) { (controller) in
            self.viewControllers = controller
        }
        self.selectedIndex = 1
    }
    
    func setupCustomTabMenu(_ menuItems: [TabItem], completion: @escaping ([UIViewController]) -> Void) {
        let frame =  CGRect(x: tabBar.frame.origin.x, y: tabBar.frame.origin.y, width: tabBar.frame.width, height: tabBarHeight)
        var controller = [UIViewController]()
        tabBar.isHidden = true
        customTabBar = CustomTabMenu(menuItems: menuItems,frame: frame)
        customTabBar.itemTapped = self.changeTab(tab:)
//        customTabBar.clipsToBounds = true
        customTabBar.backgroundColor = .white
        view.addSubview(customTabBar)
        customTabBar.layer.maskedCorners = [.layerMinXMinYCorner,.layerMaxXMinYCorner]
        customTabBar.layer.cornerRadius = 13
        customTabBar.layer.shadowOpacity = 0.10
        customTabBar.layer.shadowOffset = .init(width: 0.0, height: -0.4)
        customTabBar.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            customTabBar.bottomAnchor.constraint(equalTo: tabBar.bottomAnchor),
            customTabBar.heightAnchor.constraint(equalToConstant: frame.height),
            customTabBar.leftAnchor.constraint(equalTo: tabBar.leftAnchor),
            customTabBar.rightAnchor.constraint(equalTo: tabBar.rightAnchor),
        ])
        
        menuItems.forEach { (item) in
            controller.append(item.View)
        }
        
        self.view.layoutIfNeeded()
        completion(controller)
    }
    
    func changeTab(tab : Int){
        self.selectedIndex = tab
    }
}


