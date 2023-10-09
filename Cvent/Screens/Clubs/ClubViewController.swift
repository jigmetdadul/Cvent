//
//  ClubViewController.swift
//  Cvent
//
//  Created by Jigmet stanzin Dadul on 08/10/23.
//

import UIKit

class ClubViewController: UIViewController {
    
    @IBOutlet weak var buttonCollectionView: UICollectionView!
    let compositeLayout = Composite()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        buttonCollectionView.delegate = self
        buttonCollectionView.dataSource = self
        buttonCollectionView.collectionViewLayout = createLayout()
    }
    
    //Need to make the composite layout class in helper function better !!
    private func createLayout()-> UICollectionViewCompositionalLayout{
        //item
        let item = compositeLayout.itemLayoutForClub(height: 1, width: 100, topGap: 0, leadinGap: 0, bottomGap: 0, trailingGap: 8)
        
        //group: will contain the items
        // 113 is the button size, where 5 is the number of button
        let group = compositeLayout.groupLayoutForClub(height: 1, width: 5*113, items: [item])
        let section = NSCollectionLayoutSection(group: group)
        section.orthogonalScrollingBehavior = .paging
        
        return UICollectionViewCompositionalLayout(section: section)
    }

   

}

// MARK: UICOLLECTIONVIEW
extension ClubViewController: UICollectionViewDelegate, UICollectionViewDataSource{
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = buttonCollectionView.dequeueReusableCell(withReuseIdentifier: "ScrollButtonID", for: indexPath)
        
        return cell
    }
    
}
