//
//  ScrollViewModel.swift
//  Cvent
//
//  Created by Jigmet stanzin Dadul on 11/10/23.
//


import UIKit

class ScrollViewModel {
    
    //scrolls to the item
    func scrollToItem(indexPath: Int, collectionView: UICollectionView){
        
        let indexPathToScroll = IndexPath(item: indexPath, section: 0)
        collectionView.scrollToItem(at: indexPathToScroll, at: .left, animated: true)
    }
}
