//
//  HomeTableViewCell.swift
//  WeatherTask_GizaSys
//
//  Created by Saber on 02/09/2021.
//

import UIKit

//MARK: - CityCellViewProtocol
protocol  CityCellViewProtocol {
    func configure(cityViewModel: CityDayWeather)
    func hideIndicator()
    func startIndicator()
}

//MARK: - CityCell
class CityCell: UITableViewCell {
    @IBOutlet private weak var cityNameLabel: UILabel!
    @IBOutlet private weak var tempLabel: UILabel!
    @IBOutlet private weak var windSpeedLabel: UILabel!
    @IBOutlet private weak var weatherConditionLabel: UILabel!
    @IBOutlet private weak var loadingIndicator: UIActivityIndicatorView!
    
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
    func configure(cityViewModel: CityDayWeather) {
        cityNameLabel.text = cityViewModel.name
        tempLabel.text = "\(cityViewModel.main.temp)"
        windSpeedLabel.text = "\(cityViewModel.wind.speed)"
        weatherConditionLabel.text = "\(cityViewModel.weather)"
    }
    func hideIndicator() {
        self.loadingIndicator.stopAnimating()
        self.loadingIndicator.isHidden = true
    }
    
    func startIndicator() {
        self.loadingIndicator.isHidden = true
        self.loadingIndicator.stopAnimating()
    }
    
}
