//
//  QuizViewController.swift
//  FonetiskeAlfabet
//
//  Created by Søren Møller Gade Hansen on 17/08/2018.
//  Copyright © 2018 Søren Møller Gade Hansen. All rights reserved.
//

import UIKit

class PhoneticViewController: UIViewController {
    
    let phoneticAlfabet = PhoneticCharacter.foneticCharacters
    var currentPhoneticCharacter:PhoneticCharacter?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.title = "Fonetisk træner"
        
        view.backgroundColor = .white
        
        setupCharacterLabel()
        
        setupUserInput()
        
        setupSkipbutton()
        
        setupPhoneticCharacter()
    }
    
    let skipButton:UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Skip", for: .normal)
        return button
    }()
    
    func setupSkipbutton() {
        navigationItem.rightBarButtonItem = UIBarButtonItem(customView: skipButton)
        
        skipButton.addTarget(self, action: #selector(handleSkipButtonPressEvent), for: .touchUpInside)
    }
    
    @objc func handleSkipButtonPressEvent() {
        guard let answer = currentPhoneticCharacter?.fonetic else { return }
        
        let alert = UIAlertController(title: "Skipped", message: "Correct answer was \(answer)", preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
        
        // Show alert
        self.present(alert, animated: true, completion: {
            self.setupPhoneticCharacter()
        })
    }
    
    func setupCharacterLabel() {
        
        // Add label to view
        view.addSubview(foneticCharacterLabel)
        // Add constraints
        foneticCharacterLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 150).isActive = true
        foneticCharacterLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        foneticCharacterLabel.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 1/2).isActive = true
        foneticCharacterLabel.heightAnchor.constraint(equalToConstant: 100).isActive = true
        
        foneticCharacterLabel.text = "A"
        
    }
    
    let foneticCharacterLabel:UILabel = {
        let label = UILabel()
        label.adjustsFontSizeToFitWidth = true
        label.textAlignment = .center
        label.font = label.font.withSize(100)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let userInput: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Enter answer..."
        textField.backgroundColor = UIColor.init(red: 249/255, green: 249/255, blue: 249/255, alpha: 1.0)
        textField.layer.masksToBounds = false
        textField.layer.cornerRadius = 5
        textField.translatesAutoresizingMaskIntoConstraints = false
        // Create a padding view for padding on left
        textField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 15, height: textField.frame.height))
        textField.leftViewMode = .always
        
        // Create a padding view for padding on right
        textField.rightView = UIView(frame: CGRect(x: 0, y: 0, width: 15, height: textField.frame.height))
        textField.rightViewMode = .always
        return textField
    }()
    
    func setupUserInput() {
        view.addSubview(userInput)
        
        // Add constraints
        userInput.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        userInput.heightAnchor.constraint(equalToConstant: 50).isActive = true
        userInput.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.8).isActive = true
        userInput.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        
        // Listen for textfield change
        userInput.addTarget(self, action: #selector(handleTextFieldValueChange), for: .editingChanged)
    }
    
    // MARK: - Phonetic Game Methods
    func setupPhoneticCharacter() {
        // Clear user input
        userInput.text = ""
        
        // Get random number
        let randomNumber = arc4random_uniform(28)
        
        // Find Random Character
        self.currentPhoneticCharacter = phoneticAlfabet[Int(randomNumber)]
        
        foneticCharacterLabel.text = self.currentPhoneticCharacter!.character
    }
    
    @objc func handleTextFieldValueChange() {
        
        // Get value from textfield
        guard let value = userInput.text else { return }
        
        if currentPhoneticCharacter?.fonetic == value.lowercased() {
            // Answer is correct
            setupPhoneticCharacter()
        }
        
        
    }
    
}
