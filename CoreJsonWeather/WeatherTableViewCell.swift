//
//  WeatherTableViewCell.swift
//  CoreJsonWeather
//
//  Created by Pavlo Novak on 3/22/18.
//  Copyright © 2018 Pavlo Novak. All rights reserved.
//

import UIKit

class WeatherTableViewCell: UITableViewCell {

    @IBOutlet weak var tempLabel: UILabel!
    @IBOutlet weak var iconWeather: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func prepareWeather(message: MessageEntity, indexPath: Int) {
        
        iconWeather.image = UIImage(named: message.icon!)
        tempLabel.text = "Temp:" + String(message.temp)
    }

}
