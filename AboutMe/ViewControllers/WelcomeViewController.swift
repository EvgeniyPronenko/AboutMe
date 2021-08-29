//
//  WelcomeViewController.swift
//  AboutMe
//
//  Created by Евгений on 29.08.2021.
//

import UIKit

class WelcomeViewController: UIViewController {
    
    @IBOutlet weak var welcomeUserLabel: UILabel!
    
    var welcomeUser: User?
    
    private let primaryColor = UIColor(
        displayP3Red: 200/255,
        green: 200/255,
        blue: 200/255,
        alpha: 1
    )
    private let secondaryColor = UIColor(
        displayP3Red: 125/255,
        green: 200/255,
        blue: 125/255,
        alpha: 1
    )
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let person = welcomeUser?.person
        welcomeUserLabel.text = (
            "Welcome, \(person?.name ?? "") \(person?.surname ?? "")!"
        )
        view.adddVerticalGradientLayer(
            topColor: primaryColor,
            bottomColor: secondaryColor
        )
        
    }
}

// MARK: - Set background color

extension UIView {
    func adddVerticalGradientLayer(topColor: UIColor, bottomColor: UIColor) {
        let gradient = CAGradientLayer()
        gradient.frame = bounds
        gradient.colors = [topColor.cgColor, bottomColor.cgColor]
        gradient.locations = [0.0, 1.0]
        gradient.startPoint = CGPoint(x: 0, y: 0)
        gradient.endPoint = CGPoint(x: 0, y: 1)
        layer.insertSublayer(gradient, at: 0)
    }
}
