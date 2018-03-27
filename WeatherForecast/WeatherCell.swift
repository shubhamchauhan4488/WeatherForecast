//
//  WeatherCell.swift
//  WeatherForecast
//
//  Created by SHUBHAM  CHAUHAN on 19/03/18.
//  Copyright © 2018 shubhamchauhan. All rights reserved.
//

import UIKit

class WeatherCell: UITableViewCell {

    @IBOutlet weak var weatherIcon: UIImageView!
    
    @IBOutlet weak var minTemp: UILabel!
    @IBOutlet weak var maxTemp: UILabel!
    @IBOutlet weak var dayLabel: UILabel!
    @IBOutlet weak var weatherType: UILabel!
    
    func configureCell(forecast : Forecast)
    {
        self.minTemp.text = forecast.minTemp
        self.maxTemp.text = forecast.maxTemp
        self.dayLabel.text = forecast.date
        self.weatherType.text = forecast.weatherType
        
        self.weatherIcon.image = UIImage(named : forecast.weatherType)
        
    }

 
}
