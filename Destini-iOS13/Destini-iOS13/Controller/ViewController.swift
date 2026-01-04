//
//  ViewController.swift
//  Destini-iOS13
//
//  Created by Angela Yu on 08/08/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var storyLabel: UILabel!
    @IBOutlet weak var choice1Button: UIButton!
    @IBOutlet weak var choice2Button: UIButton!
    
    var storyBrain = StoryBrain()
    var currentStory: Story?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        currentStory = storyBrain.getCurrentStory()
        updateStory(story: currentStory!)
    }
    
    @IBAction func choiceSelected(_ sender: UIButton) {
        let selectedChoice = sender.currentTitle!
        storyBrain.updateStory(selectedChoice)
        currentStory = storyBrain.getCurrentStory()
        updateStory(story: currentStory!)
    }
    
    func updateStory(story: Story){
        storyLabel.text = currentStory?.title
        choice1Button.setTitle(currentStory?.choice1, for: .normal)
        choice2Button.setTitle(currentStory?.choice2, for: .normal)
    }
    
}

