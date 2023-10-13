//
//  ImageViewModel.swift
//  Cvent
//
//  Created by Jigmet stanzin Dadul on 11/10/23.
//

import UIKit

class ImageViewModel{
    
    private var allImages: [UIImageView]?
    
    func roundImageCorner(radius: Int){
        if let allImages{
            for image in allImages{
                image.layer.cornerRadius = CGFloat(radius)
            }
        }else{
            print("You need to initialse an array of images and pass to the function setArayOfImages")
        }
    }
    
    func setArrayOfImages(images: [UIImageView]){
        self.allImages = images
    }
}
