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

class DetailsViewController: UIViewController {
    
    @IBOutlet private weak var daysTableView: UITableView!
    @IBOutlet private weak var addToFavoriteButton: UIButton!
    
    
    var presenter: DetailPresenterProtocol?
    override func viewDidLoad() {
        title = self.presenter?.title
        super.viewDidLoad()
        addToFavoriteButton.layer.cornerRadius = addToFavoriteButton.frame.height/2
        self.presenter?.viewDidLoad()
        registerCell()
        
    }
    
    @IBAction private func addToFavoriteClicked(_ sender: Any) {
        self.presenter?.addToFavorite()
    }
    
    private func registerCell(){
        daysTableView.registerNib(cell: DayCell.self)
    }
    
}

//MARK: - DetailsViewProtocol
extension DetailsViewController: DetailsViewProtocol{
    func hideAddButton() {
        addToFavoriteButton.isHidden = true
    }
    func reloadData() {
        self.daysTableView.reloadData()
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
