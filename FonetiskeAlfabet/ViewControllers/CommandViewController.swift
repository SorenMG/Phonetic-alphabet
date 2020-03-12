//
//  CommandViewControler.swift
//  FonetiskeAlfabet
//
//  Created by Søren Møller Gade Hansen on 07/09/2018.
//  Copyright © 2018 Søren Møller Gade Hansen. All rights reserved.
//

import UIKit

class CommandViewController: UITableViewController {
    
    let cellIdentifier = "cell"
    let commands = Command.commands
    var currentCommand = Command(fullName: "", shoutout: "", letterList: [Letters(letter: "", meaning: "")])
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.register(CommandViewTableCell.self, forCellReuseIdentifier: cellIdentifier)
        
        tableView.isScrollEnabled = false
        
        setupRandomCommand()
    }
    
    // MARK: - Table View Protocol Methods
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = label.font.withSize(50)
        return label
    }()
    
    let shoutoutLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView()
        headerView.backgroundColor = .white
        
        headerView.addSubview(titleLabel)
        titleLabel.centerXAnchor.constraint(equalTo: headerView.centerXAnchor).isActive = true
        titleLabel.topAnchor.constraint(equalTo: headerView.topAnchor, constant: 16).isActive = true
        titleLabel.text = self.currentCommand.fullName
        
        headerView.addSubview(shoutoutLabel)
        shoutoutLabel.centerXAnchor.constraint(equalTo: headerView.centerXAnchor).isActive = true
        shoutoutLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 8).isActive = true
        shoutoutLabel.text = "\"" + self.currentCommand.shoutout + "\""
        
        return headerView
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 120
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.currentCommand.letterList.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! CommandViewTableCell
        
        // Setup cell
        cell.characterLabel.text = self.currentCommand.letterList[indexPath.row].letter
        
        cell.userInput.addTarget(self, action: #selector(handleUserInputChangeEvent), for: .editingChanged)
        
        if (indexPath.row != 0) {
            cell.userInput.isHidden = true
        }
        else {
            cell.userInput.becomeFirstResponder()
        }
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        view.endEditing(true)
    }

    // MARK: - Custom functions
    func setupRandomCommand() {
        
        // Get random number
        let randomNumber = arc4random_uniform(6)
        
        // Find Random Character
        self.currentCommand = commands[Int(randomNumber)]
        
    }
    
    @objc func handleUserInputChangeEvent(sender: AnyObject) {
        
        guard let cell = sender.superview as? CommandViewTableCell else {
            return // or fatalError() or whatever
        }
        
        guard let indexPath = tableView.indexPath(for: cell) else { return }
        
        // Get user input
        guard let userInput = cell.userInput.text else { return }
        
        let correctAnswer = currentCommand.letterList[indexPath.row].meaning
        
        // Check if answer is correct
        if (correctAnswer.lowercased() == userInput.lowercased()) {
            
            // Clear user input
            cell.userInput.text = ""
            
            print(currentCommand.letterList.count)
            
            // Check if it was the last input
            if (currentCommand.letterList.count == indexPath.row + 1) {
                // Roll new command
                setupRandomCommand()
                
                tableView.reloadData()
                
                let newCell = tableView.cellForRow(at: NSIndexPath(row: 0, section: 0) as IndexPath) as! CommandViewTableCell
                
                newCell.userInput.isHidden = false
                
                return
            }
            
            // Hide user input
            cell.userInput.isHidden = true
            
            // Show next user input
            let nextIndexPath = NSIndexPath(row: indexPath.row + 1, section: 0)
            
            let nextCell = tableView.cellForRow(at: nextIndexPath as IndexPath) as! CommandViewTableCell
            
            nextCell.userInput.isHidden = false
            nextCell.userInput.becomeFirstResponder()
        }
        
        
        
    }
    
}

class CommandViewTableCell: UITableViewCell {
    
    let characterLabel: UILabel = {
        let label = UILabel()
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
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.selectionStyle = .none
        
        setupCharacterLabel()
        
        setupUserInput()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Setup functions
    func setupCharacterLabel() {
        
        self.addSubview(characterLabel)
        
        // Add constraints
        characterLabel.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 16).isActive = true
        characterLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        characterLabel.widthAnchor.constraint(equalToConstant: 32).isActive = true
        
    }
    
    func setupUserInput() {
        
        self.addSubview(userInput)
        
        // Add constraints
        userInput.leftAnchor.constraint(equalTo: characterLabel.rightAnchor, constant: 16).isActive = true
        userInput.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        userInput.topAnchor.constraint(equalTo: self.topAnchor, constant: 8).isActive = true
        userInput.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -8).isActive = true
        userInput.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -16).isActive = true
        
    }
    
}
