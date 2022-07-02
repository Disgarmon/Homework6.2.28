//
//  logoutViewController.swift
//  Homework6.2.28
//
//  Created by Daniil Lebedev on 01.07.2022.
//

import UIKit

class WelcomeViewController: UIViewController {
    
    //MARK: - IB Outlets
    @IBOutlet var greetingLabel: UILabel!
    
    var userName: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        guard let name = userName ?? nil else { return }
        greetingLabel.text = "Hello, \(name)"
    }
    //MARK: - IB Actions
    
    
}
