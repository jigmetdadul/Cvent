//
//  ViewController.swift
//  Cvent
//
//  Created by Jigmet stanzin Dadul on 30/09/23.
//

import UIKit

class EventViewController: UIViewController {
    @IBOutlet weak var eventCollectionView: UICollectionView!
    
    @IBOutlet weak var previousButton: UIButton!
    @IBOutlet weak var allButton: UIButton!
    @IBOutlet weak var todayButton: UIButton!
    
    var unactiveButton: UIButton! = nil
    var compositeLayout = Composite()
    override func viewDidLoad() {
        super.viewDidLoad()
        print("Eventasdfas")
        //registers the reusable xib cell to eventCollevtionView
        eventCollectionView.register(UINib(nibName: "EventCardCollectionViewCell", bundle: .main), forCellWithReuseIdentifier: "EventCardCollectionCell")
        
        //implements a compositional Layout for the colectionview
        eventCollectionView.collectionViewLayout = createLayout()
        eventCollectionView.delegate = self
        eventCollectionView.dataSource = self
        
        //adding border to the buttons
        previousButton.roundButtonCorner()
        allButton.roundButtonCorner()
        todayButton.roundButtonCorner()
    }
    
    @IBAction func previousPressed(_ sender: UIButton){
        scrollToItem(indexPath: 0, collectionView: eventCollectionView, button: previousButton)
    }
    @IBAction func allPressed(_ sender: UIButton) {
        scrollToItem(indexPath: 1, collectionView: eventCollectionView, button: allButton)
    }
    @IBAction func todayPressed(_ sender: UIButton){
        scrollToItem(indexPath: 2, collectionView: eventCollectionView, button: todayButton)
    }
    
    // the function that returns a compositional layout
    private func createLayout()-> UICollectionViewCompositionalLayout{
        //item
        let item = compositeLayout.itemLayout(height: 1, width: 1, gap: 6)
        
        //group: will contain the items
        let group = compositeLayout.groupLayout(height: 1, width: 1, items: [item])
        
        //section
        let section = NSCollectionLayoutSection(group: group)
        section.orthogonalScrollingBehavior = .groupPaging
        return UICollectionViewCompositionalLayout(section: section)
    }
    
    
    //the below functions moves to the specified item on pressing previoud, all, today button
    //unactiveButton variable is made to reset the previous selected button's appearance
    private func scrollToItem(indexPath: Int, collectionView: UICollectionView, button: UIButton){
//        if let unactiveButton {
//            unactiveButton.backgroundColor = UIColor(named: "SecondaryBackgroundColour")
//        }
//        unactiveButton = button
        
        let indexPathToScroll = IndexPath(item: indexPath, section: 0)
        collectionView.scrollToItem(at: indexPathToScroll, at: .left, animated: true)
        
        button.changeBGColourOnClick()
    }
    //changes the button attribute based on indexpath or the index
    func editButtonWithIndex(indexPath: IndexPath){
        if(indexPath.item == 0){
            previousButton.changeBGColourOnClick()
            allButton.backgroundColor = UIColor(named: "SecondaryBackgroundColour")
            todayButton.backgroundColor = UIColor(named: "SecondaryBackgroundColour")
        }else if (indexPath.item == 1){
            allButton.changeBGColourOnClick()
            previousButton.backgroundColor = UIColor(named: "SecondaryBackgroundColour")
            todayButton.backgroundColor = UIColor(named: "SecondaryBackgroundColour")
        }else{
            todayButton.changeBGColourOnClick()
            allButton.backgroundColor = UIColor(named: "SecondaryBackgroundColour")
            previousButton.backgroundColor = UIColor(named: "SecondaryBackgroundColour")
        }
    }
}

//MARK: UICOLLECTIONVIEW
extension EventViewController: UICollectionViewDelegate, UICollectionViewDataSource{
    
    //The below function define the number of sections in a collection View
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    // The below function define the number of Items in a section
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    //Populates the collectionview with a view defined as EventCarsCollectionViewCell
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = eventCollectionView.dequeueReusableCell(withReuseIdentifier: "EventCardCollectionCell", for: indexPath) as! EventCardCollectionViewCell
        return cell;
    }
    
    //I am using this functiion to know which item is current being shown and so that i can update the UI based on the current item displayed: like changing the button colour relative to the item
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        editButtonWithIndex(indexPath: indexPath)
        print(indexPath.item)
    }

}


//MARK: UIBUTTON Functions
extension UIButton{
    func roundButtonCorner(){
        layer.cornerRadius = 10
        clipsToBounds = true
    }
    
    func changeBGColourOnClick(){
        layer.backgroundColor = UIColor.lightGray.cgColor
    }
}
