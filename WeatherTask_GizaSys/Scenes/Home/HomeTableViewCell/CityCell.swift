//
//  HomeTableViewCell.swift
//  WeatherTask_GizaSys
//
//  Created by Saber on 02/09/2021.
//

import UIKit

//MARK: - CityCellViewProtocol
protocol  CityCellViewProtocol {
    func configure(cityViewModel: CityViewModel)
}

//MARK: - CityCell
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
    
    
}

extension CityCell: CityCellViewProtocol{
    func configure(cityViewModel: CityViewModel) {
        cityNameLabel.text = cityViewModel.name
        tempLabel.text = "\(cityViewModel.temp)"
        windSpeedLabel.text = "\(cityViewModel.windSpeed)"
        weatherConditionLabel.text = cityViewModel.weatherDescription
    }
    
    
}
