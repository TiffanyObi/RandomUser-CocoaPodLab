//
//  RandomUserView.swift
//  RandomUser-CocoaPodLab
//
//  Created by Tiffany Obi on 2/28/20.
//  Copyright © 2020 Tiffany Obi. All rights reserved.
//

import UIKit
import SnapKit

class RandomUserView: UIView {
    
    
    public lazy var tableView: UITableView = {
        let tableView = UITableView()
        
        return tableView
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
            setUpTableViewConstraints()
        }
    
    func setUpTableViewConstraints() {
        
        addSubview(tableView)
        
        tableView.snp.makeConstraints { (tableView) in
            
            tableView.top.leading.bottom.trailing.equalTo(self)
        }
        
    }
    
    }

