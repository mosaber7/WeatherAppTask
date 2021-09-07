//
//  DetailsViewController.swift
//  WeatherTask_GizaSys
//
//  Created by Saber on 03/09/2021.
//

import Foundation
import UIKit


protocol DetailsViewProtocol: AnyObject {
    var presenter: DetailPresenterProtocol?{set get}
    func hideAddButton()
    func reloadData()
}

class DetailsViewController: UIViewController, DetailsViewProtocol {
    
    @IBOutlet private weak var daysTableView: UITableView!
    @IBOutlet private weak var addToFavoriteButton: UIButton!
    var presenter: DetailPresenterProtocol?
    override func viewDidLoad() {
        title = self.presenter?.title
        super.viewDidLoad()
        addToFavoriteButton.layer.cornerRadius = addToFavoriteButton.frame.height/2
        DispatchQueue.main.async {
            self.presenter?.viewDidLoad()
        }
        registerCell()
        
    }
    
    @IBAction func addToFavoriteClicked(_ sender: Any) {
        self.presenter?.addToFavorite()
    }
    func hideAddButton() {
        addToFavoriteButton.isHidden = true
    }
    func reloadData() {
        self.daysTableView.reloadData()
    }
    
    
}
//MARK: - Helper Methods
extension DetailsViewController{
    private func registerCell(){
        
        daysTableView.registerNib(cell: DayCell.self)
    }
}

//Mark: - TableView Setup
extension DetailsViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.presenter?.numberOfRows ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = daysTableView.dequeue() as DayCell
        self.presenter?.configureCell(cell: cell, at: indexPath)
        return cell
    }
    
    
}
