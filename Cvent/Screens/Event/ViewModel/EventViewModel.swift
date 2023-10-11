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
                button.layer.cornerRadius = 10
                button.clipsToBounds = true
            }
        }
    }
    
    // Function to change the background color of the button when clicked
    func changeBGColourOnClick(button: UIButton) {
        if let allButtons {
            for button in allButtons{
                button.layer.backgroundColor = UIColor.lightGray.cgColor
            }
        }
    }
    
    func editButtonWithIndex(indexPath: IndexPath){
        if let allButtons{
            for (index, element) in allButtons.enumerated(){
                if index == indexPath.item {
                    element.changeBGColourOnClick()
                }else{
                    element.backgroundColor = UIColor(named: "SecondaryBackgroundColour")
                }
            }
        }
    }
    func setArrayofButtons(allButtons: [UIButton]?){
        self.allButtons = allButtons
    }
}

//Any
class ScrollViewModel {
    func scrollToItem(indexPath: Int, collectionView: UICollectionView){
        
        let indexPathToScroll = IndexPath(item: indexPath, section: 0)
        collectionView.scrollToItem(at: indexPathToScroll, at: .left, animated: true)
        
             }
}
