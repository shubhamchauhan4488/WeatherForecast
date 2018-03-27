//
//  Location.swift
//  WeatherForecast
//
//  Created by SHUBHAM  CHAUHAN on 27/03/18.
//  Copyright © 2018 shubhamchauhan. All rights reserved.
//

import CoreLocation

class Location{
    static var sharedInstance = Location()
    private init(){}
    
    var latitude : Double!
    var longitude : Double!
}
