//
//  WeatherSearchVC.swift
//  SimpleWeather
//
//  Created by Matthew Magee on 1/24/17.
//  Copyright © 2017 Matthew Magee. All rights reserved.
//

import UIKit

var weatherCitySearch: String!

class WeatherSearchVC: UIViewController {

    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var temp: UILabel!
    @IBOutlet weak var date: UILabel!
    @IBOutlet weak var weatherImage: UIImageView!
    @IBOutlet weak var weatherStatus: UILabel!
    
    var searchWeather: SearchWeather!
    
    @IBOutlet weak var searchField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }

    @IBAction func backButtonPressed(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func searchPressed(_ sender: UIButton) {
        searchField.resignFirstResponder()
       
        weatherCitySearch = String(searchField.text!.characters.filter { !" \n\t\r".characters.contains($0) })
        print(weatherCitySearch)
        
        searchWeather = SearchWeather()
        searchWeather.downloadWeatherDetails {
            
            DispatchQueue.main.async {
                self.updateMainUI()
                
            }
            
        }
    }
    
    func updateMainUI() {
        date.text = searchWeather.date
        temp.text = "\(Int(searchWeather.currentTemp))° F"
        weatherStatus.text = searchWeather.weatherType
        cityLabel.text = searchWeather.cityName
        weatherImage.image = UIImage(named: searchWeather.weatherType)
        
        
    }

}
