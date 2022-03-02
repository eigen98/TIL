//
//  ViewController.swift
//  Weather
//
//  Created by JeongMin Ko on 2022/02/22.
//

import UIKit



class ViewController: UIViewController {

    @IBOutlet weak var cityNameTextField: UITextField!
    
    @IBOutlet weak var cityNameLabel: UILabel!
    
    @IBOutlet weak var weatherDescriptionLabel: UILabel!
    
    @IBOutlet weak var tempLabel: UILabel!
    
    @IBOutlet weak var maxTempLabel: UILabel!
    
    @IBOutlet weak var minTempLabel: UILabel!
    
    @IBOutlet weak var weatherStackView: UIStackView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func tapFetchWeatherButton(_ sender: Any) {
        if let cityName = self.cityNameTextField.text {
            self.getCurrentWeather(cityName: cityName)
            self.view.endEditing(true)
        }
    }
    
    func configureView(weatherInformation : WeatherInformation){
        self.cityNameLabel.text = weatherInformation.name
        if let weather = weatherInformation.weather.first {
            self.weatherDescriptionLabel.text = weather.description
        }
        self.tempLabel.text = "\(weatherInformation.temp.temp - 273.15)C"
        self.minTempLabel.text = "최저 : \(Int(weatherInformation.temp.minTemp - 273.15))"
        self.maxTempLabel.text = "최고: \(Int(weatherInformation.temp.maxTemp - 273.15))"
    }
    
    
    
    func getCurrentWeather(cityName : String){
        guard let url = URL(string :
                                "https://api.openweathermap.org/data/2.5/weather?q=\(cityName)&appid=969db1cdec0e9e81070cc5c3bb98053f") else {
            return
        }
        
        let session = URLSession(configuration: .default)
        session.dataTask(with: url) {[weak self] data, response, error in
            guard let data = data, error == nil else {
                return
            }
            let decoder = JSONDecoder()
            guard let weatherInformation = try? decoder.decode(WeatherInformation.self, from: data) else
            {return}
            
            DispatchQueue.main.async{
                self?.weatherStackView.isHidden = false
                self?.configureView(weatherInformation : weatherInformation)
            }
        }.resume()
    }
    
}

