//
//  ClubViewController.swift
//  Cvent
//
//  Created by Jigmet stanzin Dadul on 08/10/23.
//

import UIKit

class ClubViewController: UIViewController {
    
    @IBOutlet weak var buttonCollectionView: UICollectionView!
    @IBOutlet weak var clubCollectionView: UICollectionView!
    
    let compositeLayout = Composite()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
//        clubCollectionViewID
        clubCollectionView.register(UINib(nibName: "ClubCollectionViewCell", bundle: .main), forCellWithReuseIdentifier: "clubCollectionViewID")
        buttonCollectionView.delegate = self
        buttonCollectionView.dataSource = self
        buttonCollectionView.collectionViewLayout = createLayout()
        
        clubCollectionView.delegate = self
        clubCollectionView.dataSource = self
        clubCollectionView.collectionViewLayout = createLayoutForClub()
        
    }
    
    //Need to make the composite layout class in helper function better !!
    private func createLayout()-> UICollectionViewCompositionalLayout{
        //item
        let item = compositeLayout.itemLayoutForClub(height: 1, width: 100, topGap: 0, leadinGap: 0, bottomGap: 0, trailingGap: 8)
        
        //group: will contain the items
        // 113 is the button size, where 5 is the number of button
        let group = compositeLayout.groupLayoutForClub(height: 1, width: 5*113, items: [item])
        
        let section = NSCollectionLayoutSection(group: group)
        section.contentInsets = .init(top: 0, leading: 1, bottom: 0, trailing: 1)
        section.orthogonalScrollingBehavior = .paging
        
        return UICollectionViewCompositionalLayout(section: section)
    }
    
    private func createLayoutForClub()-> UICollectionViewCompositionalLayout {
        let item = compositeLayout.itemLayoutForClub(height: 1, width: 100, topGap: 0, leadinGap: 0, bottomGap: 0, trailingGap: 8)
        
        let group = compositeLayout.groupLayoutForClub(height: 0.2, width: 2323, items: [item])
        let section = NSCollectionLayoutSection(group: group)
        section.orthogonalScrollingBehavior = .continuous
        section.contentInsets = .init(top: 0, leading: 1, bottom: 0, trailing: 1)
        section.boundarySupplementaryItems = [supplementaryHeaderItem()]
        return UICollectionViewCompositionalLayout(section: section)
    }
    func supplementaryHeaderItem()-> NSCollectionLayoutBoundarySupplementaryItem {
        // The view Controller must have funciton func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView Properly in the ViewController
        .init(layoutSize: .init(widthDimension: .fractionalWidth(1), heightDimension: .absolute(50)), elementKind: UICollectionView.elementKindSectionHeader, alignment: .top)
    }
}

// MARK: UICOLLECTIONVIEW
extension ClubViewController: UICollectionViewDelegate, UICollectionViewDataSource{
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 9
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        var cell = UICollectionViewCell()
        switch collectionView{
        case clubCollectionView:
            print("One")
            cell = collectionView.dequeueReusableCell(withReuseIdentifier: "clubCollectionViewID", for: indexPath) as! ClubCollectionViewCell
        case buttonCollectionView:
            print("two")
            cell = buttonCollectionView.dequeueReusableCell(withReuseIdentifier: "ScrollButtonID", for: indexPath)
        default:
            print("default case was executed in clubViewController")
            cell = UICollectionViewCell()
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        var header = UICollectionReusableView()
        
        switch kind{
        case UICollectionView.elementKindSectionHeader:
            header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "ClubCollectionViewReusableID1", for: indexPath)
        default:
            return header
        }
        
        return header
    }
    
}
