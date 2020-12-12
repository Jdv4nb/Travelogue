//
//  TripTableViewCell.swift
//  Travelogue
//
//  Created by Jonathan Van Egeren on 12/10/20.
//

import UIKit

class TripTableViewCell: UITableViewCell {

    @IBOutlet weak var TripLabel: UILabel!
    @IBOutlet weak var TripData: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
