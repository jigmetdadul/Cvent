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
    var arrayOfButtons:[UIButton] = []
    let viewButtonModel = ButtonViewModel()
    let viewScrollModel = ScrollViewModel()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //and arrau of buttons
        arrayOfButtons = [previousButton, allButton, todayButton]
        viewButtonModel.setArrayofButtons(allButtons: arrayOfButtons)
        
        //registers the reusable xib cell to eventCollevtionView
        eventCollectionView.register(UINib(nibName: "EventCardCollectionViewCell", bundle: .main), forCellWithReuseIdentifier: "EventCardCollectionCell")
        
        //implements a compositional Layout for the colectionview
        eventCollectionView.delegate = self
        eventCollectionView.dataSource = self
        eventCollectionView.collectionViewLayout = createLayout()
        
        //adding corner to the button
        viewButtonModel.roundButtonCorner(radius: 10)
    }
    
//MARK: IBaction Buttons
    @IBAction func previousPressed(_ sender: UIButton){
        viewScrollModel.scrollToItem(indexPath: 0, collectionView: eventCollectionView)
    }
    @IBAction func allPressed(_ sender: UIButton) {
        viewScrollModel.scrollToItem(indexPath: 1, collectionView: eventCollectionView)
    }
    @IBAction func todayPressed(_ sender: UIButton){
        viewScrollModel.scrollToItem(indexPath: 2, collectionView: eventCollectionView)
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
        //        editButtonWithIndex(indexPath: indexPath)c
        viewButtonModel.editButtonWithIndex(indexPath: indexPath)
//        print(indexPath.item)
    }
    
}


//MARK: UIBUTTON Functions
extension UIButton{
    
}
