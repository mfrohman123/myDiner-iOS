//
//  Menus.swift
//  myDiner
//
//  Created by Matt Frohman on 6/1/20.
//  Copyright © 2020 Matt Frohman. All rights reserved.
//

import UIKit

class Menus: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.titleView = UIImageView(image: UIImage(named: "restaurant")?.withRenderingMode(.alwaysTemplate))

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
