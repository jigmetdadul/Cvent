//
//  File.swift
//  Cvent
//
//  Created by Jigmet stanzin Dadul on 05/10/23.
//

import UIKit



struct Composite{
    
    func itemLayout(height: CGFloat, width: CGFloat, gap: CGFloat )->NSCollectionLayoutItem{
        
        //defines the layout to follow for the item w.r.t group size
        let layout = NSCollectionLayoutSize(widthDimension: .fractionalWidth(width) , heightDimension: .fractionalHeight(height) )
        let item = NSCollectionLayoutItem(layoutSize: layout)
        item.contentInsets = NSDirectionalEdgeInsets(top: gap, leading: gap, bottom: gap, trailing: gap)
        return item
    }
    
    //function for clubVC(Button)
    func itemLayoutForClub(height: CGFloat, width: CGFloat, topGap: CGFloat, leadinGap: CGFloat,  bottomGap: CGFloat, trailingGap: CGFloat )->NSCollectionLayoutItem{
        
        //defines the layout to follow for the item w.r.t group size
        let layout = NSCollectionLayoutSize(widthDimension: .absolute(width) , heightDimension: .fractionalHeight(height) )
        let item = NSCollectionLayoutItem(layoutSize: layout)
        item.contentInsets = NSDirectionalEdgeInsets(top: topGap, leading: leadinGap, bottom: bottomGap, trailing: trailingGap)
        return item
    }
    
    func groupLayoutForClub(height: CGFloat, width: CGFloat, items:  [NSCollectionLayoutItem] )->NSCollectionLayoutGroup{
        //defines the layout to follow for the group w.r.t collection view
        let layout = NSCollectionLayoutSize(widthDimension: .fractionalWidth(width) , heightDimension: .fractionalHeight(height) )
        //makes the group scroll horizonally (.vertcal can be useed for vertical scroll)
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: layout, subitems: items)
     
        return group
    }
    
    //this function returns a group with item and count
    func groupLayout(height: CGFloat, width: CGFloat, item:  NSCollectionLayoutItem, count: Int)->NSCollectionLayoutGroup{
        //defines the layout to follow for the group w.r.t collection view
        let layout = NSCollectionLayoutSize(widthDimension: .fractionalWidth(width) , heightDimension: .fractionalHeight(height) )
        //makes the group scroll horizonally (.vertcal can be useed for vertical scroll)
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: layout, repeatingSubitem: item, count: count)
        return group
    }
    
    //this function returns a group with [items]
    func groupLayout(height: CGFloat, width: CGFloat, items:  [NSCollectionLayoutItem] )->NSCollectionLayoutGroup{
        //defines the layout to follow for the group w.r.t collection view
        let layout = NSCollectionLayoutSize(widthDimension: .fractionalWidth(width) , heightDimension: .fractionalHeight(height) )
        //makes the group scroll horizonally (.vertcal can be useed for vertical scroll)
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: layout, subitems: items)
     
        return group
    }
    
    func supplementaryHeaderItem()-> NSCollectionLayoutBoundarySupplementaryItem {
        // The view Controller must have funciton func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView Properly in the ViewController
        .init(layoutSize: .init(widthDimension: .fractionalWidth(1), heightDimension: .absolute(50)), elementKind: UICollectionView.elementKindSectionHeader, alignment: .top)
    }
}
