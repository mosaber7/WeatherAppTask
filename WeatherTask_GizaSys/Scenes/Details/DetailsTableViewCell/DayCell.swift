//
//  DayTableViewCell.swift
//  WeatherTask_GizaSys
//
//  Created by Saber on 04/09/2021.
//

import UIKit

protocol DayCellViewProtocol{
    func configCell(cityDayWeather: CityWeekWeather)
}

class DayCell: UITableViewCell {

    @IBOutlet private weak var dayLabel: UILabel!
    @IBOutlet private weak var tempLabel: UILabel!
    @IBOutlet private weak var windLabel: UILabel!
    @IBOutlet private weak var weatherLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
//MARK: - confirming to DayCellViewProtocol

extension DayCell: DayCellViewProtocol{
    
    func configCell(cityDayWeather: CityWeekWeather) {
        dayLabel.text = cityDayWeather.date
        windLabel.text = "\(cityDayWeather.wind.speed)"
        tempLabel.text = "\(cityDayWeather.main.temp)"
        weatherLabel.text = cityDayWeather.weather[0].weatherDescription
    }
}
