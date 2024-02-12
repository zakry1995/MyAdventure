//
//  Adventure.swift
//  MyAdventure
//
//  Created by user250193 on 2/11/24.
//

import Foundation

struct AdventureStep {
    let description: String
    let choices: [String: Int] // Maps choice text to next step ID
}

class Adventure {
    private var steps: [Int: AdventureStep] = [:]
    var currentStepID: Int = 0

    var currentStep: AdventureStep {
        steps[currentStepID] ?? AdventureStep(description: "An unexpected error occurred.", choices: [:])
    }

    init() {
        setupAdventure()
    }

    private func setupAdventure() {
        steps[0] = AdventureStep(description: "You're at the entrance of a mystical forest. Do you go left towards the river or right into the dark woods?",
                                 choices: ["Go left": 1, "Go right": 2])
        steps[1] = AdventureStep(description: "You've reached a calm river. Do you swim across or follow along the riverbank?",
                                 choices: ["Swim across": 3, "Follow the riverbank": 4])
        steps[2] = AdventureStep(description: "The dark woods are eerie. You spot a light ahead. Approach the light or stay on your path?",
                                 choices: ["Approach the light": 5, "Stay on path": 6])
        // Expanding the adventure with more depth
        steps[3] = AdventureStep(description: "Swimming across the river, you encounter a mysterious island. Explore the island or continue swimming?",
                                 choices: ["Explore the island": 7, "Continue swimming": 8])
        steps[4] = AdventureStep(description: "Following the riverbank, you find a boat. Use the boat to cross the river or keep walking?",
                                 choices: ["Use the boat": 9, "Keep walking": 10])
        steps[5] = AdventureStep(description: "Approaching the light, you find a camp of friendly natives. Join them or continue alone?",
                                 choices: ["Join the natives": 11, "Continue alone": 12])
        steps[6] = AdventureStep(description: "Staying on your path, the woods become denser. Climb a tree to get your bearings or push forward?",
                                 choices: ["Climb a tree": 13, "Push forward": 14])
        // Final choices and outcomes
        steps[7] = AdventureStep(description: "The island holds ancient ruins holding untold treasures. Victory!", choices: [:])
        steps[8] = AdventureStep(description: "As you continue swimming, you're caught in a current and swept away. Game over.", choices: [:])
        steps[9] = AdventureStep(description: "Using the boat, you swiftly cross the river and find the temple. Victory!", choices: [:])
        steps[10] = AdventureStep(description: "Walking further, you become hopelessly lost. Game over.", choices: [:])
        steps[11] = AdventureStep(description: "Joining the natives, they guide you to the temple. Victory!", choices: [:])
        steps[12] = AdventureStep(description: "Continuing alone, you stumble into quicksand. Game over.", choices: [:])
        steps[13] = AdventureStep(description: "From the tree, you spot the temple and navigate to it. Victory!", choices: [:])
        steps[14] = AdventureStep(description: "Pushing forward, you encounter a bear and can't escape. Game over.", choices: [:])
    }

    func chooseOption(choice: String) {
        if let nextStepID = currentStep.choices[choice] {
            currentStepID = nextStepID
        }
    }
}
