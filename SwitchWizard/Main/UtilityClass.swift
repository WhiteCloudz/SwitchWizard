//
//  UtilityClass.swift
//  MultiConverter
//
//  Created by Fatih Akbulut on 8/5/23.
//

import UIKit
import Foundation


extension UIViewController{
    
    
    func ScrollerSetup(name:UIScrollView, Height:Int){
        name.isScrollEnabled = true
        let desiredHeight: CGFloat =  CGFloat(Height)
        name.contentSize = CGSize(width: name.frame.size.width, height: desiredHeight)
    }
    
    func ScrollHorizental (name:UIScrollView, Width:Int){
        name.isScrollEnabled = true
        let desiredWidth: CGFloat =  CGFloat(Width)
        name.contentSize = CGSize(width: desiredWidth, height: name.frame.size.height)
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField, editText:String) {
        textField.placeholder = editText
    }
    func cornerRadiusImg(imageViewName:UIImageView){
        imageViewName.layer.cornerRadius = imageViewName.bounds.height / 2
        imageViewName.layer.masksToBounds = true
        }
    
    func cornerRadius(buttonName:UIButton){
        buttonName.layer.cornerRadius = buttonName.bounds.height / 2.5
        buttonName.layer.masksToBounds = true
    }
    
    func setupBackroundImageToVievController(imageNamed: String, backroundView:UIView ){
        if let backgroundImage = UIImage(named: imageNamed) {
            let imageView = UIImageView(image: backgroundImage)
            imageView.contentMode = .scaleAspectFill
            imageView.clipsToBounds = true
            backroundView.addSubview(imageView)
            backroundView.sendSubviewToBack(imageView)
            imageView.translatesAutoresizingMaskIntoConstraints = false
            NSLayoutConstraint.activate([
                imageView.topAnchor.constraint(equalTo: backroundView.topAnchor),
                imageView.leadingAnchor.constraint(equalTo: backroundView.leadingAnchor),
                imageView.trailingAnchor.constraint(equalTo: backroundView.trailingAnchor),
                imageView.bottomAnchor.constraint(equalTo: backroundView.bottomAnchor)
            ])
        }
    }
}
