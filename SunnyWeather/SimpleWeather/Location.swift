//
//  Location.swift
//  SimpleWeather
//
//  Created by Matthew Magee on 1/24/17.
//  Copyright © 2017 Matthew Magee. All rights reserved.
//

import CoreLocation

class Location {
    static var sharedInstance = Location()
    
    private init(){}
    
    var latitude: Double!
    var longitude: Double!
}
