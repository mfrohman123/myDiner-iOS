//
//  Stats.swift
//  myDiner
//
//  Created by Matt Frohman on 6/1/20.
//  Copyright © 2020 Matt Frohman. All rights reserved.
//
//https://medium.com/@skipadu/using-realm-and-charts-with-swift-3-in-ios-10-40c42e3838c0#.2gyymwfh8

import UIKit

class Stats: UIViewController {
    
    let nutrients = ["Carbohydrates", "Fat", "Protein"]
    let totals = ["/1000 cals", "/500 cals", "/500 cals"]

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.titleView = UIImageView(image: UIImage(named: "restaurant")?.withRenderingMode(.alwaysTemplate))

        // Set up Title
        let title = UILabel()
        title.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(title)
        title.widthAnchor.constraint(equalToConstant: 60).isActive = true
        title.heightAnchor.constraint(equalToConstant: 20).isActive = true
        title.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        title.topAnchor.constraint(equalTo: view.topAnchor, constant: 20).isActive = true
        
        title.font = UIFont(name: "Roboto-Medium", size: 18)
        title.text = "Today"
        
        
        // Set up carbs/fat/protein
        let parent = UIStackView()
        parent.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(parent)
        parent.widthAnchor.constraint(equalToConstant: view.bounds.width).isActive = true
        parent.heightAnchor.constraint(equalToConstant: 180).isActive = true
        parent.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0).isActive = true
        parent.topAnchor.constraint(equalTo: title.topAnchor, constant: 50).isActive = true
        
        parent.axis = .vertical
        for num in 0...2 {
            let subv = UIView()
            subv.widthAnchor.constraint(equalToConstant: view.bounds.width).isActive = true
            subv.heightAnchor.constraint(equalToConstant: 60).isActive = true
            
            let guide = UIImageView()
            guide.backgroundColor = .systemPink
//            guide.image = UIImage(named: "add")
            subv.addSubview(guide)
            guide.translatesAutoresizingMaskIntoConstraints = false
            guide.widthAnchor.constraint(equalToConstant: 25).isActive = true
            guide.heightAnchor.constraint(equalToConstant: 25).isActive = true
            guide.centerYAnchor.constraint(equalTo: subv.centerYAnchor).isActive = true
            guide.leadingAnchor.constraint(equalTo: subv.leadingAnchor, constant: 25).isActive = true
            
            let meal = UILabel()
            subv.addSubview(meal)
            meal.translatesAutoresizingMaskIntoConstraints = false
            meal.widthAnchor.constraint(equalToConstant: 400).isActive = true
            meal.heightAnchor.constraint(equalToConstant: 40).isActive = true
            meal.centerYAnchor.constraint(equalTo: subv.centerYAnchor).isActive = true
            meal.leadingAnchor.constraint(equalTo: guide.trailingAnchor, constant: 25).isActive = true
            meal.font = UIFont(name: "Roboto-Medium", size: meal.font.pointSize)
            meal.text = nutrients[num]
            
            let count = UILabel()
            subv.addSubview(count)
            count.translatesAutoresizingMaskIntoConstraints = false
            count.widthAnchor.constraint(equalToConstant: 100).isActive = true
            count.heightAnchor.constraint(equalToConstant: 40).isActive = true
            count.centerYAnchor.constraint(equalTo: subv.centerYAnchor).isActive = true
            count.leadingAnchor.constraint(equalTo: subv.trailingAnchor, constant: -100).isActive = true
            count.font = UIFont(name: "Roboto-Medium", size: meal.font.pointSize)
            count.text = "0" + totals[num]
            
            parent.addArrangedSubview(subv)
        }
        
        // Set up "next week" title
        let futureTitle = UILabel()
        futureTitle.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(futureTitle)
        futureTitle.widthAnchor.constraint(equalToConstant: 100).isActive = true
        futureTitle.heightAnchor.constraint(equalToConstant: 20).isActive = true
        futureTitle.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        futureTitle.topAnchor.constraint(equalTo: parent.bottomAnchor, constant: 50).isActive = true
        
        futureTitle.font = UIFont(name: "Roboto-Medium", size: 18)
        futureTitle.text = "This Week"
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
