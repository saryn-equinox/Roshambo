//
//  ResultViewController.swift
//  Roshambo
//
//  Created by 邱浩庭 on 11/12/2020.
//

import Foundation
import UIKit



class ResultViewController: UIViewController {
    
    @IBOutlet weak var resultImage: UIImageView!
    @IBOutlet weak var resultString: UILabel!
    
    var humanAction: Move!
    var computerAction: Move!
    var isPaper: Bool?
    var isRock: Bool?
    var isScissors: Bool?
    
    enum Move: Int {
        case rock = 0
        case paper
        case scissors
    }
    
    enum Result: String {
        case humanWin = "Human Win!"
        case computerWin = "Computer Win!"
        case tie = "Is Tie!"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        resultImage.contentMode = .scaleAspectFit
        print("View loaded")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        computerMove()
        resultString.alpha = 0
        resultImage.alpha = 0
        resultString.text = calculateResult().rawValue
        setImage()
        
        UIView.animate(withDuration: 0.5) { [self] in
            resultString.alpha = 1
            resultImage.alpha = 1
        }
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        isPaper = nil
        isRock = nil
        isScissors = nil
    }
    
    // Mark: Load Image
    func setImage() {
        if isPaper != nil && isRock != nil {
            resultImage.image = UIImage(named: "PaperCoversRock") 
        } else if isPaper != nil && isScissors != nil {
            resultImage.image = UIImage(named: "ScissorsCutPaper")
        } else if isRock != nil && isScissors != nil {
            resultImage.image = UIImage(named: "RockCrushesScissors")
        } else {
            resultImage.image = UIImage(named: "itsATie")
        }
    }
    
    
    // Mark: Find the result
    
    func calculateResult() -> Result {
        if humanAction == .rock {
            switch computerAction {
            case .rock:
                return .tie
            case .paper:
                return .computerWin
            default:
                return .humanWin
            }
        } else if humanAction == .paper {
            switch computerAction {
            case .rock:
                return .humanWin
            case .paper:
                return .tie
            default:
                return .computerWin
            }
        } else {
            switch computerAction {
            case .rock:
                return .computerWin
            case .paper:
                return .humanWin
            default:
                return .tie
            }
        }
    }
    
    // Mark: Computer' Selection
    
    func computerMove() {
        let ranSelection = Int.random(in: 0...2)
        switch ranSelection {
        case ResultViewController.Move.paper.rawValue:
            isPaper = true
        case ResultViewController.Move.rock.rawValue:
            isRock = true
        default:
            isScissors = true
        }
        computerAction = ResultViewController.Move(rawValue: ranSelection)
    }
    
    func humanMove(_ move: Move) {
        if move == Move.paper {
            print("Paper")
            isPaper = true
            humanAction = .paper
        } else if move == Move.rock {
            print("Rock")
            isRock = true
            humanAction = .rock
        } else {
            print("Scissors")
            isScissors = true
            humanAction = .scissors
        }
    }
}
