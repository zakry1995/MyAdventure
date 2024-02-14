//
//  ViewController.swift
//  MyAdventure
//
//  Created by user250193 on 2/11/24.
//

import UIKit

class ViewController: UIViewController {
    var adventure = Adventure()

    @IBOutlet weak var storyLabel: UILabel!
    @IBOutlet weak var leftButton: UIButton!
    @IBOutlet weak var rightButton: UIButton!
    @IBOutlet weak var backgroundImageView: UIImageView!

        override func viewDidLoad() {
            super.viewDidLoad()
            updateUI()
        }

        @objc func choiceMade(_ sender: UIButton) {
            guard let choiceTitle = sender.title(for: .normal) else { return }
            adventure.chooseOption(choice: choiceTitle)
            updateUI()
        }

        func updateUI() {
            let currentStep = adventure.currentStep
            storyLabel.text = currentStep.description

            // Update buttons based on the current step's choices
            updateButtonsWithChoices(from: currentStep)
            
            // Update background image for the current step
            updateBackgroundImage()
        }

    private func updateButtonsWithChoices(from step: AdventureStep) {
        let choices = Array(step.choices.keys)
        leftButton.isHidden = choices.count < 1
        rightButton.isHidden = choices.count < 2
        
        if !leftButton.isHidden {
            leftButton.setTitle(choices[0], for: .normal)
            leftButton.addTarget(self, action: #selector(choiceMade(_:)), for: .touchUpInside) // Add this line
        }
        
        if !rightButton.isHidden && choices.count > 1 {
            rightButton.setTitle(choices[1], for: .normal)
            rightButton.addTarget(self, action: #selector(choiceMade(_:)), for: .touchUpInside) // And this line
        }
    }


        func updateBackgroundImage() {
            let imageName = backgroundImageName(for: adventure.currentStepID)
            backgroundImageView.image = UIImage(named: imageName)
        }

        private func backgroundImageName(for stepID: Int) -> String {
            switch stepID {
        case 0: return "forest"
        case 1: return "river"
        case 2: return "woods"
        case 3: return "island"
        case 4: return "boat"
        case 5: return "light"
        case 6: return "woods"
        case 7: return "island"
        case 8: return "river"
        case 9: return "island"
        case 10: return "woods"
        case 11: return "island"
        case 12: return "woods"
        case 13: return "light"
        case 14: return "woods"
        default: return "forest"
        }
    }
}

