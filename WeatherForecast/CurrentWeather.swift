//
//  CurrentWeather.swift
//  WeatherForecast
//
//  Created by SHUBHAM  CHAUHAN on 12/03/18.
//  Copyright © 2018 shubhamchauhan. All rights reserved.
//

import Foundation
import Alamofire

class CurrentWeather {
    
    var _cityName: String!
    var _date : String!
    var _currentTemp: Double!
    var _weatherType: String!
    
    var cityName: String {
        if _cityName == nil{
            _cityName = ""
        }
        return _cityName
    }
    
    var date : String {
        if _date == nil{
            _date = ""
        }
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .long
        dateFormatter.timeStyle = .none
        let currentDate = dateFormatter.string(from: Date())
        self._date = "Today,\(currentDate)"
        return _date
    }
    
    var currentTemp: Double {
        if _currentTemp == nil{
            _currentTemp = 0
        }
        return _currentTemp
    }
    
    var weatherType: String {
        if _weatherType == nil{
            _weatherType = ""
        }
        return _weatherType
    }

    func downloadWeatherDetails(completed : onDownloadComplete){
        
    let currentWeatherURL = URL(string: CURRENT_WEATHER_URL)!
        Alamofire.request(currentWeatherURL).responseJSON{ response in
//        let result = response
            print(response)
            if let dict = response.value as? Dictionary<String, AnyObject>
            {
                if let name = dict["name"] as? String{
                    self._cityName = name
                    print(self._cityName)
                }
                if let weather = dict["weather"] as? [Dictionary<String, AnyObject>]{
                    if let weatherType = weather[0]["main"] as? String {
                        self._weatherType = weatherType
                        print(self._weatherType)
                    }
                }
                if let temp = dict["main"] as? Dictionary<String, AnyObject>{
                    if let currTemp = temp["temp"] as? Double{
                        let kelvinToFahren = ((9/5)*(currTemp - 273)) + 32
                    self._currentTemp = kelvinToFahren
                    print(self._currentTemp)
                    }
                }
            }
        }
        completed()
    }
}
