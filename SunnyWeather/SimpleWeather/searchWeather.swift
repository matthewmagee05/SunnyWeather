//
//  searchWeather.swift
//  SimpleWeather
//
//  Created by Matthew Magee on 1/24/17.
//  Copyright © 2017 Matthew Magee. All rights reserved.
//

import Foundation
import UIKit

class SearchWeather {
    fileprivate var _cityName: String!
    fileprivate var _date: String!
    fileprivate var _weatherType: String!
    fileprivate var _currentTemp: Double!
    
    
    var cityName: String {
        if _cityName == nil {
            _cityName = ""
        }
        return _cityName
    }
    
    var date: String {
        if _date == nil {
            _date = ""
        }
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .long
        dateFormatter.timeStyle = .none
        let currentDate = dateFormatter.string(from: Date())
        self._date = "Today, \(currentDate)"
        return _date
    }
    
    var weatherType: String {
        if _weatherType == nil {
            _weatherType = ""
        }
        return _weatherType
    }
    
    var currentTemp: Double {
        if _currentTemp == nil {
            _currentTemp = 0.0
        }
        return _currentTemp
    }
    
    func downloadWeatherDetails(completed: @escaping DownloadComplete) {
        
        
        let url = URL(string: "http://api.openweathermap.org/data/2.5/weather?q=\(weatherCitySearch!)&appid=7838af808b00d6f01508b2c8630f0edd")
        
        URLSession.shared.dataTask(with: url!) {
            (data, response, error) in
            
            if let responseData = data {
                
                do {
                    print("heyfsdlfjsdjfsljfjdsl \(weatherCitySearch)")
                    let json = try JSONSerialization.jsonObject(with: responseData, options: JSONSerialization.ReadingOptions.allowFragments)
                    
                    
                    if let dict = json as? Dictionary<String, AnyObject> {
                        
                        print("this is the dictionary \(dict)")
                        if let name = dict["name"] as? String {
                            self._cityName = name.capitalized
                            print("city" + self._cityName)
                        }
                        
                        if let weather = dict["weather"] as? [Dictionary<String, AnyObject>] {
                            
                            if let main = weather[0]["main"] as? String {
                                self._weatherType = main.capitalized
                                print(self._weatherType)
                            }
                            
                        }
                        
                        if let main = dict["main"] as? Dictionary<String, AnyObject> {
                            if let currentTemperature = main["temp"] as? Double {
                                let kelvinToFarenheitPreDivision = (currentTemperature * (9/5) - 459.67)
                                let kelvinToFarenheit = Double(round(10 * kelvinToFarenheitPreDivision/10))
                                self._currentTemp = kelvinToFarenheit
                                print(self._currentTemp)
                            }
                        }
                    }
                    
                    
                    print(json)
                } catch {
                    print("Could not serialize")
                }
            }
            completed()
            }.resume()
}

}
