//
//  MenuCell.swift
//  Pulldown
//
//  Created by Maria Gomez on 8/30/17.
//  Copyright © 2017 Maria Gomez. All rights reserved.
//

import UIKit

class MenuCell: UITableViewCell {
    
    @IBOutlet weak var menuTitle: UILabel!
    
    let colorPurple = UIColor(red: 97.0/255.0, green: 10.0/255.0, blue: 153.0/255.0, alpha: 1.0)
    
    
    override func awakeFromNib() {
        self.separatorInset = UIEdgeInsets.zero
        self.layoutMargins = UIEdgeInsets.zero
        
        let blurEffect = UIBlurEffect(style: .light)
        let blurView = UIVisualEffectView.init(effect: blurEffect)
        
        blurView.backgroundColor = colorPurple
        blurView.clipsToBounds = true
        
        let vibrancyEffect = UIVibrancyEffect(blurEffect: blurEffect)
        let vibrancyView = UIVisualEffectView(effect: vibrancyEffect)
        
        blurView.addSubview(vibrancyView)
        self.selectedBackgroundView = blurView
        
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        if selected{
            self.menuTitle.textColor = UIColor.white
            
        }
        else {
            self.menuTitle.textColor = colorPurple
        }
        
    }
}


