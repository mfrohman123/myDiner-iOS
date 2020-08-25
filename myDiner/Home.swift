//
//  Home.swift
//  myDiner
//
//  Created by Matt Frohman on 5/25/20.
//  Copyright © 2020 Matt Frohman. All rights reserved.
//

import UIKit
import LinearProgressBar

class Home: UIViewController {
    
    let meals = ["Breakfast", "Lunch", "Dinner", "Snack", "Water", "Exercise"]
    let totals = ["/400 cals", "/600 cals", "/600 cals", "/200 cals", "/2.00 liters", "/300 cals burned"]
    var opened = [false, false, false, false, false, false]
    
    var parentStack : UIStackView!
    var progress : LinearProgressBar!
    var calorieCount : UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.titleView = UIImageView(image: UIImage(named: "restaurant")?.withRenderingMode(.alwaysTemplate))
        
        // Set up title/calories
        let title = UILabel()
        title.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(title)
        title.widthAnchor.constraint(equalToConstant: 60).isActive = true
        title.heightAnchor.constraint(equalToConstant: 20).isActive = true
        title.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        title.topAnchor.constraint(equalTo: view.topAnchor, constant: 20).isActive = true
        
        title.font = UIFont(name: "Roboto-Medium", size: 18)
        title.text = "Today"
        
        // Set up progress bar
        progress = LinearProgressBar()
        progress.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(progress)
        progress.widthAnchor.constraint(equalToConstant: view.bounds.width - 50).isActive = true
        progress.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        progress.topAnchor.constraint(equalTo: title.bottomAnchor, constant: 20).isActive = true
        progress.heightAnchor.constraint(equalToConstant: 25).isActive = true
        
        progress.progressValue = 6/7 * 100
        
        progress.layer.borderWidth = 3.0
        progress.layer.cornerRadius = 10
        progress.backgroundColor = .clear
        progress.barThickness = 25
        progress.barPadding = -25
        progress.clipsToBounds = true
        progress.trackColor = .white
        progress.barColor = .red//UIColor(red: 0.754 * 255, green: 0.079 * 255, blue: 0.079 * 255, alpha: 1.0)
        
        calorieCount = UILabel()
        calorieCount.font = UIFont(name: "Roboto-Regular", size: 14)
        calorieCount.textAlignment = .center
        view.addSubview(calorieCount)
        calorieCount.translatesAutoresizingMaskIntoConstraints = false
        calorieCount.updateConstraints()
        calorieCount.widthAnchor.constraint(equalToConstant: view.bounds.width).isActive = true
        calorieCount.heightAnchor.constraint(equalToConstant: 20).isActive = true
        calorieCount.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        calorieCount.topAnchor.constraint(equalTo: progress.bottomAnchor, constant: 15).isActive = true
        
        // Set up meal calorie counts
        parentStack = UIStackView()
        parentStack.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(parentStack)
        parentStack.widthAnchor.constraint(equalToConstant: view.bounds.width).isActive = true
//        parentStack.heightAnchor.constraint(equalToConstant: 360).isActive = true
        parentStack.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0).isActive = true
        parentStack.topAnchor.constraint(equalTo: progress.topAnchor, constant: 100).isActive = true
        
        parentStack.axis = .vertical
        for num in 0...11 {
            if num % 2 == 0 {
                let subv = UIView()
                subv.widthAnchor.constraint(equalToConstant: view.bounds.width).isActive = true
                subv.heightAnchor.constraint(equalToConstant: 60).isActive = true
                subv.tag = num / 2
                subv.isUserInteractionEnabled = true
                subv.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(show(_:))))
                
                let meal = UILabel()
                meal.font = UIFont(name: "Roboto-Regular", size: meal.font.pointSize)
                subv.addSubview(meal)
                meal.translatesAutoresizingMaskIntoConstraints = false
                meal.widthAnchor.constraint(equalToConstant: 100).isActive = true
                meal.heightAnchor.constraint(equalToConstant: 40).isActive = true
                meal.centerYAnchor.constraint(equalTo: subv.centerYAnchor).isActive = true
                meal.leadingAnchor.constraint(equalTo: subv.leadingAnchor, constant: 25).isActive = true
                meal.text = meals[num / 2]
                
                let count = UILabel()
                count.numberOfLines = 0
                subv.addSubview(count)
                count.translatesAutoresizingMaskIntoConstraints = false
                count.widthAnchor.constraint(equalToConstant: 100).isActive = true
                count.heightAnchor.constraint(equalToConstant: 80).isActive = true
                count.centerYAnchor.constraint(equalTo: subv.centerYAnchor).isActive = true
                count.leadingAnchor.constraint(equalTo: subv.trailingAnchor, constant: -180).isActive = true
                count.text = "0" + totals[num / 2]
                count.font = UIFont(name: "Roboto-Regular", size: count.font.pointSize)
                
                let img = UIButton()
                img.setImage(UIImage(named: "add")?.withRenderingMode(.alwaysTemplate), for: .normal)
                img.tintColor = UIColor(red: 0.754, green: 0.079, blue: 0.079, alpha: 1.0)
                subv.addSubview(img)
                img.translatesAutoresizingMaskIntoConstraints = false
                img.widthAnchor.constraint(equalToConstant: 25).isActive = true
                img.heightAnchor.constraint(equalToConstant: 25).isActive = true
                img.centerYAnchor.constraint(equalTo: subv.centerYAnchor).isActive = true
                img.leadingAnchor.constraint(equalTo: subv.trailingAnchor, constant: -50).isActive = true
                
                parentStack.addArrangedSubview(subv)
            } else {
                let subv = UIView()
                subv.widthAnchor.constraint(equalToConstant: view.bounds.width).isActive = true
                subv.heightAnchor.constraint(equalToConstant: 60).isActive = true
                subv.isHidden = true
                parentStack.addArrangedSubview(subv)
            }
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        calorieCount.text = "-/- total calories for the day"
        
    }
    
    @objc func show(_ sender : UITapGestureRecognizer) {
        var spot = 0
        for view in parentStack.subviews {
            if view.tag == sender.view!.tag && !opened[sender.view!.tag] {
                UIView.animate(withDuration: 0.25) {
                    self.parentStack.subviews[spot + 1].isHidden = false
                }
                opened[sender.view!.tag] = !opened[sender.view!.tag]
                break
            } else if view.tag == sender.view!.tag && opened[sender.view!.tag] { //trickery
                UIView.animate(withDuration: 0.25) {
                    self.parentStack.subviews[spot + 1].isHidden = true
                }
                
                opened[sender.view!.tag] = !opened[sender.view!.tag]
                break
            }
            
            spot += 1

        }
    }

}

