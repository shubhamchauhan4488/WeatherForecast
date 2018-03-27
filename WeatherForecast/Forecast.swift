//
//  Forecast.swift
//  WeatherForecast
//
//  Created by SHUBHAM  CHAUHAN on 19/03/18.
//  Copyright © 2018 shubhamchauhan. All rights reserved.
//
import UIKit
import Alamofire

class Forecast{
    
    private var _date: String!
    private var _minTemp: String!
    private var _maxTemp: String!
    private var _weatherType: String!
    
    public var date:String{
        if _date == nil{
        _date = ""
        }
    return _date
    }
    public var minTemp:String{
        if _minTemp == nil{
            _minTemp = ""
        }
        return _minTemp
    }
    public var maxTemp:String{
        if _maxTemp == nil{
            _maxTemp = ""
        }
        return _maxTemp
    }
    public var weatherType:String{
        if _weatherType == nil{
            _weatherType = ""
        }
        return _weatherType
    }
    
    init(weatherDict : Dictionary<String, AnyObject>){
        if let temp = weatherDict["temp"] as? Dictionary<String, AnyObject>{
            if let lowTemp = temp["min"] as? Double{
                let kelvinToFahren = ((9/5)*(lowTemp - 273)) + 32
                self._minTemp =  String(format: "%.1f", kelvinToFahren)
            }
            if let highTemp = temp["max"] as? Double{
                let kelvinToFahren = ((9/5)*(highTemp - 273)) + 32
                self._maxTemp = String(format: "%.1f", kelvinToFahren)
            }
        }
        
        if let weather = weatherDict["weather"] as? [Dictionary<String, AnyObject>]{
            if let type = weather[0]["main"] as? String{
                self._weatherType = type
            }
        }
        
        if let dt = weatherDict["dt"] as? Double{
            let unixDate = Date(timeIntervalSince1970: dt)
            let dateformatter = DateFormatter()
            dateformatter.dateStyle = .full
            dateformatter.dateFormat = "EEEE"
            dateformatter.timeStyle = .none
            self._date = unixDate.dayOfTheWeek()
        }
        
    }
    
}

extension Date {
    func dayOfTheWeek() -> String {
    let dateformatter = DateFormatter()
    dateformatter.dateFormat = "EEEE"
        return dateformatter.string(from: self)
    }
}
