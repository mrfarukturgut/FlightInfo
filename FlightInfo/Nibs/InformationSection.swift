//
//  InformationSection.swift
//  FlightInfo
//
//  Created by Faruk Turgut on 08/01/2018.
//  Copyright © 2018 Faruk. All rights reserved.
//

import UIKit
import IBAnimatable

class InformationSection: UIView {

    @IBOutlet var customView: UIView!
    @IBOutlet weak var date: AnimatableLabel!
    
    
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.customInit()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.customInit()
    }
    
    private func customInit(){
        Bundle.main.loadNibNamed("InformationSection", owner: self, options: nil)
        date.cornerRadius = self.date.frame.height/2
        customView.frame = self.bounds
        customView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
        addSubview(customView)
        
    
    }

}
