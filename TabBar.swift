//
//  TabBar.swift
//  BooksApp
//
//  Created by Mina Namlı on 21.09.2022.
//

import UIKit

class TabBar: UITabBarController {
    
    let mainVC = MainVC()
    let searchVC = SearchVC()
    let layer = CAShapeLayer()
    
    var houseImg = UIImage(systemName: "house")!
    var bookImg = UIImage(systemName: "book")!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewWillLayoutSubviews()
        
        self.setViewControllers([mainVC, searchVC], animated: true)

        self.selectedViewController = mainVC
        
        guard let items = self.tabBar.items else {return}
        let images = [houseImg, bookImg]

        for x in 0...1{
            items[x].image = images[x]
            items[x].image?.withRenderingMode(.alwaysTemplate)

        }

        layer.path = UIBezierPath(roundedRect: CGRect(x: 75,
                                                      y: self.tabBar.bounds.minY - 20,
                                                      width: self.tabBar.bounds.width - 150,
                                                      height: self.tabBar.bounds.height + 20),
                                  cornerRadius: (20)).cgPath
 
        layer.borderWidth = 1.0
        layer.opacity = 0.1
        layer.fillColor = UIColor.black.cgColor
        layer.strokeColor = UIColor.blue.cgColor
        layer.masksToBounds = false
        layer.backgroundColor = UIColor.lightGray.cgColor
        additionalSafeAreaInsets.bottom = 11
        
        self.tabBar.layer.insertSublayer(layer, at: 0)
         
        let appearance = UITabBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = .white
        appearance.backgroundEffect = .none
        appearance.shadowColor = .clear
        appearance.shadowImage = .none
        
        tabBar.standardAppearance = appearance
        tabBar.itemWidth = 10
        tabBar.itemPositioning = .automatic
        tabBar.tintColor = .white
        tabBar.barStyle = .default
        tabBar.isTranslucent = true
    }
    
}

