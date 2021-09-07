////
////  dataStore.swift
////  WeatherTask_GizaSys
////
////  Created by Saber on 06/09/2021.
////
//
//import Foundation
//
//import UIKit
//
//class ItemStore{
//    var allItems : [Item] = []
//
//    let itemArchiveURL: URL = {
//        let documentsDirectories =
//            FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
//        let documentDirectory = documentsDirectories.first!
//        return documentDirectory.appendingPathComponent("items.plist")
//    }()
//
//    @discardableResult func createItem() -> Item{
//        let newItem = Item(random: true)
//       allItems.append(newItem)
//
//        return newItem
//    }
//    func removeItem(_ item: Item){
//            if let index = allItems.firstIndex(of: item){
//                allItems.remove(at: index)
//            }
//
//
//
//    }
//    func moveItem(from fromIndex: Int, toIndex: Int){
//        if fromIndex == toIndex {
//            return
//        }
//        let movedItem = allItems[fromIndex]
//        allItems.remove(at: fromIndex)
//
//
//            allItems.insert(movedItem, at: toIndex)
//
//
//    }
//
//    @objc func saveChanges()->Bool{
//        do {
//            print("saving data to \(itemArchiveURL)")
//            let encoder = PropertyListEncoder()
//            let data = try encoder.encode(allItems)
//            try data.write(to: itemArchiveURL, options: [.atomic])
//            return true
//        } catch  let encodingError{
//            print("erroer encoding some data \(encodingError)")
//            return false
//        }
//    }
//
//    init() {
//        do {
//                let data = try Data(contentsOf: itemArchiveURL)
//                let unarchiver = PropertyListDecoder()
//                let items = try unarchiver.decode([Item].self, from: data)
//                allItems = items
//        } catch{
//            print("Error reading in saved items \(error)")
//        }
//
//
//        let notifactionCenter = NotificationCenter.default
//        notifactionCenter.addObserver(self, selector: #selector(saveChanges), name: UIScene.didEnterBackgroundNotification, object: nil)
//
//    }
//
//}
