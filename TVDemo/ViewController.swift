//
//  ViewController.swift
//  TVDemo
//
//  Created by Darshit Vadodaria on 27/04/18.
//  Copyright © 2018 Simform Solutions PVT LTD. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblSubTitle: UILabel!
    @IBOutlet weak var lblInfo: UILabel!
    @IBOutlet weak var tblData: UITableView!
    @IBOutlet weak var imgWorkOut: UIImageView!
    
    
    var arrWorkOut : [[String:Any]] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchData()
    }
    
    func fetchData(){
        let path = Bundle.main.path(forResource: "Data", ofType: "plist")!
        let url = URL(fileURLWithPath: path)
        let data = try! Data(contentsOf: url)
        if let dictRoot = try! PropertyListSerialization.propertyList(from: data, options: .mutableContainers, format: nil) as? [String:Any]{
            if let arrData = dictRoot["Workouts"] as? [[String:Any]]{
                arrWorkOut = arrData
                self.tblData.reloadData()
            }
            
        }
    }
}

extension ViewController : UITableViewDelegate, UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrWorkOut.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tblData.dequeueReusableCell(withIdentifier: "cellWorkOut") as! WorkoutTableViewCell
        cell.dictWorkOut = arrWorkOut[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        tableView.deselectRow(at: indexPath, animated: true)
        let detailVC = DetailViewController.instantiateFromAppStoryboard(appStoryboard: .Main)
        detailVC.dictWorkOut = arrWorkOut[indexPath.row]
        detailVC.arrWorkOuts = arrWorkOut
        self.navigationController?.pushViewController(detailVC, animated: true)
    }
}


