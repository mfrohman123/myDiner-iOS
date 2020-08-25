//
//  TabController.swift
//  myDiner
//
//  Created by Matt Frohman on 5/29/20.
//  Copyright © 2020 Matt Frohman. All rights reserved.
//

import UIKit

class TabController: UITabBarController {
    
    let titles = ["Home", "Stats", "Menus", "Settings"]
    let images = ["home", "timeline", "menu", "settings"]

    override func viewDidLoad() {
        super.viewDidLoad()

        self.tabBar.selectedImageTintColor = .white
        UITabBar.appearance().unselectedItemTintColor = UIColor(hue: 0, saturation: 0, brightness: 1.0, alpha: 0.66)
        
        
        // Set bottom titles and images
        for num in 0...3 {
            self.tabBar.items![num].title = titles[num]
            self.tabBar.items![num].setBadgeTextAttributes([NSAttributedString.Key.font: UIFont(name: "Roboto-Regular", size: 10)!], for: .normal)
            self.tabBar.items![num].image = UIImage(named: images[num])
            
        }
        // Do any additional setup after loading the view.
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
