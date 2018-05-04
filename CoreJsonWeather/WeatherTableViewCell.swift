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
    
    func prepareWeather(message: MessageEntity, indexPath: Int) {
        
        iconWeather.image = UIImage(named: message.icon!)
        tempLabel.text = "Temp:" + String(message.temp)
    }
}
