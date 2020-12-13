//
//  ViewController.swift
//  Roshambo
//
//  Created by 邱浩庭 on 11/12/2020.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var paperButton: UIButton!
    @IBOutlet weak var scissorsButton: UIButton!
    @IBOutlet weak var rockButton: UIButton!
    @IBOutlet weak var buttonCollections: UIStackView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        buttonCollections.alpha = 0
        paperButton.imageView?.contentMode = .scaleAspectFill
        scissorsButton.imageView?.contentMode = .scaleAspectFill
        rockButton.imageView?.contentMode = .scaleAspectFill
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        UIView.animate(withDuration: 0.3) { [self] in
            buttonCollections.alpha = 1
        }
    }
    
    @IBAction func rockPressed() {
        let controller = self.storyboard?.instantiateViewController(withIdentifier: "resultVC") as! ResultViewController
        controller.humanMove(.rock)
        present(controller, animated: true, completion: nil)
    }
    
    
    @IBAction func scissorsPressed() {
        performSegue(withIdentifier: "scissorsSegue", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "paperSegue" {
            let controller = segue.destination as! ResultViewController
            controller.humanMove(.paper)
        } else {
            let controller = segue.destination as! ResultViewController
            controller.humanMove(.scissors)
        }

    }
}

