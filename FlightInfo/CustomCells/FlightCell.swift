//
//  FlightCell.swift
//  FlightInfo
//
//  Created by Faruk Turgut on 08/01/2018.
//  Copyright © 2018 Faruk. All rights reserved.
//

import UIKit

class FlightCell: UITableViewCell {

    
    @IBOutlet weak var topView: FlightEventTopView!
    @IBOutlet weak var bottomView: FlightEventBottomView!
    
    var isExpanded: Bool = false
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func cellClicked(indexPath: IndexPath){
        print(indexPath)
        self.isExpanded = true
    }

}
