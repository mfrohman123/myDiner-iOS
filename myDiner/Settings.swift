//
//  Settings.swift
//  myDiner
//
//  Created by Matt Frohman on 6/1/20.
//  Copyright © 2020 Matt Frohman. All rights reserved.
//

import UIKit

class Settings: UITableViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.rowHeight = 60
        self.tableView.backgroundColor = .white
        
        self.navigationItem.titleView = UIImageView(image: UIImage(named: "restaurant")?.withRenderingMode(.alwaysTemplate))

        // Do any additional setup after loading the view.
    }
    
    // MARK: - Table View Data Source
    override func numberOfSections(in tableView: UITableView) -> Int {
        // return the number of sections
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // return the number of rows per section
        return 3
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // Configure the cell...
        var cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        //About us info
        if indexPath.section == 0 && indexPath.row == 0 {
            cell.textLabel!.text = "Privacy Policy"
        } else if indexPath.section == 0 && indexPath.row == 1 {
            cell.textLabel!.text = "Legal Disclaimer"
        } else if indexPath.section == 0 && indexPath.row == 2 {
            cell.textLabel!.text = "Credits"
        }
        
        cell.textLabel?.font = UIFont(name: "Roboto-Regular", size: 18)
        
        return cell
    }
    
    //Navigation
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
//        //Notifications info
//        if indexPath.section == 0 {
//            let nextVC = storyboard!.instantiateViewController(withIdentifier: "Notifications")
//            navigationController?.pushViewController(nextVC, animated: true)
//        }
//
//        //About us info
//        if indexPath.section == 1 && indexPath.row == 0 {
//            let nextVC = storyboard!.instantiateViewController(withIdentifier: "PrivacyPolicy")
//            navigationController?.pushViewController(nextVC, animated: true)
//        } else if indexPath.section == 1 && indexPath.row == 1 {
//            let nextVC = storyboard!.instantiateViewController(withIdentifier: "LegalDisclaimer")
//            navigationController?.pushViewController(nextVC, animated: true)
//        } else if indexPath.section == 1 && indexPath.row == 2 {
////            let nextVC = Credits()
////            navigationController?.pushViewController(nextVC, animated: true)
//        }
        
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    //Set section title
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "About"
    }
    
    override func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        let poopy = view as! UITableViewHeaderFooterView
        poopy.textLabel?.font = UIFont(name: "Roboto-Regular", size: 10)
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 90
    }
    
    //Footer height
    override func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 30
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
