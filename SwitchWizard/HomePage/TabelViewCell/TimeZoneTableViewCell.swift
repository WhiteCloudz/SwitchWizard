//
//  TimeZoneTableViewCell.swift
//  MultiConverter
//
//  Created by Fatih Akbulut on 12/2/23.
//

import UIKit

class TimeZoneTableViewCell: UITableViewCell {
    
   
   
    @IBOutlet weak var stackView: UIStackView!
    @IBOutlet weak var city: UILabel!
    @IBOutlet weak var hour: UILabel!
    @IBOutlet weak var timeDifference: UILabel!
   
    
    override func awakeFromNib() {
            super.awakeFromNib()
        stackView.layer.cornerRadius = stackView.bounds.height / 7
        
        }
    
  
        override func layoutSubviews() {
            super.layoutSubviews()
           
        }
        
        
        func configureCell(_ TimeData: TimeData) {
            city.text = TimeData.city
            hour.text = TimeData.hour
            timeDifference.text = "\(TimeData.timeDifference) Hours"
          
        }
    
}
