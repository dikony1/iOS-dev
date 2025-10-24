//
//  ViewController.swift
//  DiceeApp
//
//  Created by Dinara on 24.10.2025.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var leftDice: UIImageView!
    @IBOutlet weak var rigthDice: UIImageView!
    
    let diceImages: [UIImage] = [#imageLiteral(resourceName: "dice1"), #imageLiteral(resourceName: "dice2"), #imageLiteral(resourceName: "dice3"), #imageLiteral(resourceName: "dice4"), #imageLiteral(resourceName: "dice5"), #imageLiteral(resourceName: "dice6")] // #imageLiteral()
    


    override func viewDidoad() {
        super.viewDidLoad()
        leftDice.image = .dice3
        rigthDice.image = .dice6
    }

    @IBAction func rollButtonDidTap(_ sender: Any) {
        let randomIndex = Int.random(in: 0..<diceImages.count)
        leftDice.image = diceImages[randomIndex] // getting random index
        rigthDice.image = diceImages.randomElement() // built-in collection method
    }
}
