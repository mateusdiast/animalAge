//
//  SecondViewController.swift
//  AnimalAge
//
//  Created by mateusdias on 15/11/23.
//

import UIKit

class SecondViewController: UIViewController {
    
    
    @IBOutlet weak var yearsHumanLabel: UILabel!
    @IBOutlet weak var sizeAnimalLabel: UILabel!
    @IBOutlet weak var imageAnimalSize: UIImageView!
    
    var image: String?
    var yearsHuman: Double?
    var sizeSelected: String?
    
    override func viewDidLoad() {super.viewDidLoad()
        yearsHumanLabel.text = "The human age of the animal is: \(yearsHuman!) years"
        sizeAnimalLabel.text = sizeSelected
        imageAnimalSize.image = UIImage(named: image!)
        
    }
    
}
