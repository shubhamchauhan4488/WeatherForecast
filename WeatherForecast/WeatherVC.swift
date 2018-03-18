//
//  WeatherVC.swift
//  WeatherForecast
//
//  Created by SHUBHAM  CHAUHAN on 12/03/18.
//  Copyright © 2018 shubhamchauhan. All rights reserved.
//

import UIKit

var currentWeather : CurrentWeather!

class WeatherVC: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var dateLabel: UILabel!
    
    @IBOutlet weak var temptLabel: UILabel!
    
    @IBOutlet weak var locationLabel: UILabel!
    
    @IBOutlet weak var weatherImage: UIImageView!
  
    @IBOutlet weak var weatherType: UILabel!
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        print( CURRENT_WEATHER_URL )
        tableView.dataSource = self
        tableView.delegate = self
        currentWeather =  CurrentWeather()
        currentWeather.downloadWeatherDetails {
            self.updateMainUI()
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 6
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "weatherCell", for: indexPath)
        
        return cell;
    }

    
    func updateMainUI(){
        self.dateLabel.text = currentWeather.date
        self.locationLabel.text = currentWeather.cityName
        self.temptLabel.text = "\(currentWeather.currentTemp)"
        self.weatherType.text = currentWeather.weatherType
        self.weatherImage.image = UIImage(named : currentWeather.weatherType )
        
    }

}

