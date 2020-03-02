//
//  DetailView.swift
//  RandomUser-CocoaPodLab
//
//  Created by Tiffany Obi on 3/2/20.
//  Copyright © 2020 Tiffany Obi. All rights reserved.
//

import UIKit

class DetailView: UIView {
    
    private lazy var userImageView: UIImageView = {
        let imageView = UIImageView()
        
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame:UIScreen.main.bounds)
        commomInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder:coder)
        commomInit()
    }
    
    private func commomInit() {
        
    }
    
    
    
    
    
    
    
}


