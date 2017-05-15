//
//  PageView.swift
//  ScrollViewPageTest
//
//  Created by Alfred Choi on 2017-05-14.
//  Copyright © 2017 Alfred Choi. All rights reserved.
//

import UIKit

class PageView: UIView {
    
    var pageLabel = UILabel()

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.addSubview(self.pageLabel)
        self.pageLabel.translatesAutoresizingMaskIntoConstraints = false
        self.pageLabel.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
        self.pageLabel.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
        self.pageLabel.heightAnchor.constraint(equalToConstant: 30).isActive = true
        self.pageLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 50).isActive = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
