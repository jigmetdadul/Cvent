//
//  FavouriteViewController.swift
//  Cvent
//
//  Created by Jigmet stanzin Dadul on 07/10/23.
//

import UIKit

class FavouriteViewController: UIViewController {

    @IBOutlet weak var favouriteCollectionView: UICollectionView!
    let compositeLayout = Composite()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //registering a xib to the FavouriteCollectionView
        favouriteCollectionView.register(UINib(nibName: "EventCardCollectionViewCell", bundle: .main), forCellWithReuseIdentifier: "EventCardCollectionCell")
        favouriteCollectionView.collectionViewLayout = createLayout()
        favouriteCollectionView.delegate = self
        favouriteCollectionView.dataSource = self
        
    }
    
    private func createLayout()-> UICollectionViewCompositionalLayout{
        //item
        let item = compositeLayout.itemLayout(height: 1, width: 1, gap: 6)
        
        //group: will contain the items
       
        let group = compositeLayout.groupLayout(height: 1, width: 1, items: [item])
        let section = NSCollectionLayoutSection(group: group)
        section.orthogonalScrollingBehavior = .groupPaging
        return UICollectionViewCompositionalLayout(section: section)
    }

}

// MARK: - UICOLLECTIONVIEW

extension FavouriteViewController: UICollectionViewDelegate, UICollectionViewDataSource{
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = favouriteCollectionView.dequeueReusableCell(withReuseIdentifier: "EventCardCollectionCell", for: indexPath) as! EventCardCollectionViewCell
        
        return cell
    }
}


