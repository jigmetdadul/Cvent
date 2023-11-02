//
//  EventCardTableViewCell.swift
//  Cvent
//
//  Created by Jigmet stanzin Dadul on 06/10/23.
//

import UIKit

class EventCardTableViewCell: UITableViewCell {
    //identifier:- EventCardTableCell
    

    @IBOutlet weak var posterImage: UIImageView!
    @IBOutlet weak var evenCardView: UIView!
    
    @IBOutlet weak var locationButton: UIButton!
    @IBOutlet weak var aboutButton: UIButton!
    @IBOutlet weak var eventDateButton: UIButton!
    @IBOutlet weak var addToFavouriteButton: UIButton!
    
    var arrayOfButtons:[UIButton] = []
    let viewButtonModel = ButtonViewModel()
    var randomIndex = 0
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        //array of buttons
        arrayOfButtons = [locationButton, aboutButton, eventDateButton, addToFavouriteButton]
        viewButtonModel.setArrayofButtons(allButtons: arrayOfButtons)
        
        // adding border to the corner of the views
        posterImage.layer.cornerRadius = 8
        evenCardView.layer.cornerRadius = 10
        viewButtonModel.roundButtonCorner(radius: 8)
        
        randomIndex = Int.random(in: 1...7)
        evenCardView.backgroundColor = UIColor(named: "TColour" + String(randomIndex))
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}


