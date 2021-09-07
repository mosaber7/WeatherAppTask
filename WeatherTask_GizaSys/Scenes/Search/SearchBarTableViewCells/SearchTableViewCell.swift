//
//  SearchTableViewCell.swift
//  WeatherTask_GizaSys
//
//  Created by Saber on 07/09/2021.
//

import UIKit


protocol SearchCellViewProtocol {
    func configureCell(cityName: String)
}


class SearchTableViewCell: UITableViewCell {

    @IBOutlet private weak var nameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

       
    }
    
}

// MARK: -

extension SearchTableViewCell: SearchCellViewProtocol{
    func configureCell(cityName: String) {
        nameLabel.text = cityName
    }
    
    
}


