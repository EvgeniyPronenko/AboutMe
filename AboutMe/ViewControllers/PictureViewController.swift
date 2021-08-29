//
//  PictureViewController.swift
//  AboutMe
//
//  Created by Евгений on 30.08.2021.
//

import UIKit

class PictureViewController: UIViewController {
    
    @IBOutlet weak var pictureLabel: UILabel!
    
    var user: User?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let person = user?.person
        pictureLabel.text = person?.profession ?? ""
    }
    
}
