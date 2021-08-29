//
//  AboutMeViewController.swift
//  AboutMe
//
//  Created by Евгений on 29.08.2021.
//

import UIKit

class AboutMeViewController: UIViewController {
    
    @IBOutlet weak var professionLabel: UILabel!
    
    var user: User?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let person = user?.person
        professionLabel.text = ("Profession: \(person?.profession ?? "")")
        
    }
    
    
    
}
