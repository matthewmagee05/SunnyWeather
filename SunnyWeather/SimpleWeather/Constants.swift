//
//  Constants.swift
//  SimpleWeather
//
//  Created by Matthew Magee on 1/24/17.
//  Copyright © 2017 Matthew Magee. All rights reserved.
//

import Foundation

typealias DownloadComplete = () -> ()

let CURRENT_WEATHER_URL = "http://api.openweathermap.org/data/2.5/weather?lat=\(Location.sharedInstance.latitude!)&lon=\(Location.sharedInstance.longitude!)&appid=7838af808b00d6f01508b2c8630f0edd"



