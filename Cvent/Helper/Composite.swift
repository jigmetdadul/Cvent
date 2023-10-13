//
//  File.swift
//  Cvent
//
//  Created by Jigmet stanzin Dadul on 05/10/23.
//

import UIKit



struct Composite{
    
    func itemLayout(height:  NSCollectionLayoutDimension, width: NSCollectionLayoutDimension, gap: CGFloat )->NSCollectionLayoutItem{
        
        //defines the layout to follow for the item w.r.t group size
        let layout = NSCollectionLayoutSize(widthDimension: width , heightDimension: height )
        let item = NSCollectionLayoutItem(layoutSize: layout)
        item.contentInsets = NSDirectionalEdgeInsets(top: gap, leading: gap, bottom: gap, trailing: gap)
        return item
    }
    
    //eg use of this below function:  for clubVC(Button)
    func itemLayoutSidesGap(height: NSCollectionLayoutDimension, width: NSCollectionLayoutDimension, topGap: CGFloat, leadinGap: CGFloat,  bottomGap: CGFloat, trailingGap: CGFloat )->NSCollectionLayoutItem{
        
        //defines the layout to follow for the item w.r.t group size
        //width = .absolute
        let layout = NSCollectionLayoutSize(widthDimension: width , heightDimension: height )
        let item = NSCollectionLayoutItem(layoutSize: layout)
        item.contentInsets = NSDirectionalEdgeInsets(top: topGap, leading: leadinGap, bottom: bottomGap, trailing: trailingGap)
        return item
    }
    
    //this function returns a group with item and count
    func groupLayout(height: NSCollectionLayoutDimension, width: NSCollectionLayoutDimension, item:  NSCollectionLayoutItem, count: Int)->NSCollectionLayoutGroup{
        //defines the layout to follow for the group w.r.t collection view
        let layout = NSCollectionLayoutSize(widthDimension: height , heightDimension: height )
        //makes the group scroll horizonally (.vertcal can be useed for vertical scroll)
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: layout, repeatingSubitem: item, count: count)
        return group
    }
    
    //this function returns a group with [items]
    func groupLayout(height: NSCollectionLayoutDimension, width: NSCollectionLayoutDimension, items:  [NSCollectionLayoutItem] )->NSCollectionLayoutGroup{
        //defines the layout to follow for the group w.r.t collection view
        let layout = NSCollectionLayoutSize(widthDimension: width , heightDimension: height )
        //makes the group scroll horizonally (.vertcal can be useed for vertical scroll)
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: layout, subitems: items)
     
        return group
    }
    
    func supplementaryHeaderItem()-> NSCollectionLayoutBoundarySupplementaryItem {
        // The view Controller must have funciton func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView Properly in the ViewController
        .init(layoutSize: .init(widthDimension: .fractionalWidth(1), heightDimension: .absolute(50)), elementKind: UICollectionView.elementKindSectionHeader, alignment: .top)
    }
}
