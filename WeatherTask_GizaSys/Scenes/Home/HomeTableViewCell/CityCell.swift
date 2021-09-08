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
    func configure(cityViewModel: CityViewModel) {
        cityNameLabel.text = cityViewModel.name
        tempLabel.text = "\(cityViewModel.temp)"
        windSpeedLabel.text = "\(cityViewModel.windSpeed)"
        weatherConditionLabel.text = cityViewModel.weatherDescription
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
