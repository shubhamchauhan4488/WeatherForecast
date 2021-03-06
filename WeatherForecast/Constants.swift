//
//  Constants.swift
//  WeatherForecast
//
//  Created by SHUBHAM  CHAUHAN on 12/03/18.
//  Copyright © 2018 shubhamchauhan. All rights reserved.
//

import Foundation

let BASE_URL = "http://samples.openweathermap.org/data/2.5/weather?"
let LATITUDE = "lat="
let LONGITUDE = "&lon="
let APP_ID = "&appid="
let APP_KEY = "45dd981d2adec8c979f79bf7d3dc1ee8"

var CURRENT_WEATHER_URL = "https://api.openweathermap.org/data/2.5/weather?lat=\(Location.sharedInstance.latitude)&lon=\(Location.sharedInstance.longitude)&appid=42a1771a0b787bf12e734ada0cfc80cb"
let FORECAST_URL = "https://api.openweathermap.org/data/2.5/forecast/daily?lat=\(Location.sharedInstance.latitude!)&lon=\(Location.sharedInstance.longitude!)&appid=42a1771a0b787bf12e734ada0cfc80cb"


typealias onDownloadComplete = () -> ()
