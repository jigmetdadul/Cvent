//
//  EventViewModel.swift
//  Cvent
//
//  Created by Jigmet stanzin Dadul on 11/10/23.
//


import UIKit


class ButtonViewModel {
    // Properties to hold the state and data you want to manipulate
    private var allButtons: [UIButton]?
    // Function to round the button's corner
    func roundButtonCorner(radius: Float) {
        if let allButtons {
            for button in allButtons{
                button.layer.cornerRadius = CGFloat(radius)
                button.clipsToBounds = true
            }
        }else{
            print("Initialise the array of button and call setArraysofButton and pass array as a prarameter")
        }
    }
    
    // Function to change the background color of the button when clicked
    func changeBGColourOnClick(button: UIButton) {
        button.layer.backgroundColor = UIColor.lightGray.cgColor
    }
    
    //changes the button UI based on indexPath
    func editButtonWithIndex(indexPath: IndexPath){
        if let allButtons{
            for (index, button) in allButtons.enumerated(){
                if index == indexPath.item {
                    changeBGColourOnClick(button: button)
                }else{
                    button.backgroundColor = UIColor(named: "SecondaryBackgroundColour")
                }
            }
        }else{
            print("Initialise the array of button and call setArraysofButton and pass array as a prarameter")
        }
    }
    
    //takes an array of buttons for the object to work on
    func setArrayofButtons(allButtons: [UIButton]?){
        self.allButtons = allButtons
    }
}



