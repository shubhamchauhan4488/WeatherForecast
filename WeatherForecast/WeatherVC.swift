//
//  WeatherVC.swift
//  WeatherForecast
//
//  Created by SHUBHAM  CHAUHAN on 12/03/18.
//  Copyright © 2018 shubhamchauhan. All rights reserved.
//

import UIKit
import Alamofire
import CoreLocation
import MapKit


class WeatherVC: UIViewController, UITableViewDataSource, UITableViewDelegate, CLLocationManagerDelegate, MKMapViewDelegate{
    
    var currentWeather : CurrentWeather!
    var forecast : Forecast!
    var forecasts = [Forecast]()

    @IBOutlet weak var dateLabel: UILabel!
    
    @IBOutlet weak var temptLabel: UILabel!
    
    @IBOutlet weak var locationLabel: UILabel!
    
    @IBOutlet weak var weatherImage: UIImageView!
  
    @IBOutlet weak var weatherType: UILabel!
    
    @IBOutlet weak var tableView: UITableView!
    
    let locationManager = CLLocationManager()
    var currentLocation : CLLocation!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        print( CURRENT_WEATHER_URL )
        tableView.dataSource = self
        tableView.delegate = self
        
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestWhenInUseAuthorization()
        locationManager.startMonitoringSignificantLocationChanges()
        
         currentWeather =  CurrentWeather()
    }
    
    func locationAuthStatus(){
        if CLLocationManager.authorizationStatus() == .authorizedWhenInUse{
            currentLocation = locationManager.location
            print(locationManager.location!)
            Location.sharedInstance.latitude = currentLocation.coordinate.latitude
            Location.sharedInstance.longitude = currentLocation.coordinate.longitude
            print(currentLocation.coordinate.latitude)
            print(Location.sharedInstance.longitude)
            CURRENT_WEATHER_URL = "https://api.openweathermap.org/data/2.5/weather?lat=\(Location.sharedInstance.latitude!)&lon=\(Location.sharedInstance.longitude!)&appid=42a1771a0b787bf12e734ada0cfc80cb"
            print(CURRENT_WEATHER_URL)
            print(FORECAST_URL)
            currentWeather.downloadWeatherDetails{
                self.downloadForecastData {
                    self.updateMainUI()
                }
            }
           
        }else{
            locationManager.requestWhenInUseAuthorization()
            locationAuthStatus()
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        locationAuthStatus()
    }
    
    func downloadForecastData(completed : @escaping onDownloadComplete){
//        let forecastURL = URL(string: FORECAST_URL)!
        Alamofire.request(FORECAST_URL).responseJSON { (response) in
            print(response)
            
            if let dict = response.value as? Dictionary<String, AnyObject>{
                
                if let list = dict["list"] as? [Dictionary<String, AnyObject>]{
                    
                    for obj in list {
                        let forecast = Forecast(weatherDict : obj)
                        self.forecasts.append(forecast)
                        print(obj)
                    }
                    self.tableView.reloadData()
                }
            }
            completed()
        }
        
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return forecasts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "weatherCell", for: indexPath) as? WeatherCell{
            cell.configureCell(forecast: forecasts[indexPath.row])
            return cell
        
        }
        return WeatherCell();
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
    func updateMainUI(){
        print("Entered the update manin ui Method")
        print(currentWeather.cityName)
        dateLabel.text = currentWeather.date
        locationLabel.text = currentWeather.cityName
        temptLabel.text = String(format: "%.1f", currentWeather.currentTemp)
        weatherType.text = currentWeather.weatherType
        weatherImage.image = UIImage(named : currentWeather.weatherType )
        
    }

}

