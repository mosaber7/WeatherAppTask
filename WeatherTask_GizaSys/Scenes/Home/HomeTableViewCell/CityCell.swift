//
//  HomeTableViewCell.swift
//  WeatherTask_GizaSys
//
//  Created by Saber on 02/09/2021.
//

import UIKit

class CityCell: UITableViewCell {
    @IBOutlet weak var cityNameLabel: UILabel!
    @IBOutlet weak var tempLabel: UILabel!
    @IBOutlet weak var windSpeedLabel: UILabel!
    @IBOutlet weak var weatherConditionLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configCell(cityName: String, temp: Double, windSpeed: Double, weather: String){
        cityNameLabel.text = cityName
        tempLabel.text = "\(tempLabel)"
        windSpeedLabel.text = "\(windSpeed)"
        weatherConditionLabel.text = weather
    }
    
}
