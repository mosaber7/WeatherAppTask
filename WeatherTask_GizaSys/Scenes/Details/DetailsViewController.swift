//
//  DetailsViewController.swift
//  WeatherTask_GizaSys
//
//  Created by Saber on 03/09/2021.
//

import Foundation
import UIKit


protocol DetailsViewProtocol: AnyObject {
    
}

class DetailsViewController: UIViewController {
    
    @IBOutlet weak var daysTableView: UITableView!
    @IBOutlet weak var addToFavoriteButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        registerCell()
        addToFavoriteButton.layer.cornerRadius = addToFavoriteButton.frame.height/2
    }
    
    
    
}
//MARK: - Helper Methods
extension DetailsViewController{
    private func registerCell(){
        let dayCell = UINib(nibName: "DayCell", bundle: nil)
        daysTableView.register(dayCell, forCellReuseIdentifier: "DayCell")
    }
}

//Mark: - TableView Setup
extension DetailsViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = daysTableView.dequeueReusableCell(withIdentifier: "DayCell", for: indexPath) as! DayCell
        return cell
    }
    
    
}
