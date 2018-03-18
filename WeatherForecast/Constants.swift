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

let CURRENT_WEATHER_URL = "\(BASE_URL)\(LATITUDE)23\(LONGITUDE)12\(APP_ID)\(APP_KEY)"


typealias onDownloadComplete = () -> ()
