//
//  ViewController.swift
//  TVDemo
//
//  Created by Darshit Vadodaria on 27/04/18.
//  Copyright © 2018 Darshit Vadodaria. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblSubTitle: UILabel!
    @IBOutlet weak var lblInfo: UILabel!
    @IBOutlet weak var tblData: UITableView!
    @IBOutlet weak var imgWorkOut: UIImageView!
    
    
    let arrWorkOut = ["Aerobic Exercise","Strength exercises","Flexibility","Balance exercises"]
    let arrInforText = ["Increase your breathing and heart rate","Keep your bones and muscles strong","Keep your body limber","Strengthen the body's core and help prevent falls"]
    let arrDetailText = ["Aerobic exercises increase your breathing and heart rate and are the main component of overall fitness programs. They keep the circulatory system and lungs healthy, can stave off diabetes and heart disease and help you build up endurance.","These are important for keeping your bones and muscles strong and helping older adults maintain their independence. Strength training is beneficial in reducing falls and helping you do everyday activities that require lifting, such as carrying groceries. ","Though not part of the CDC's official recommendations for maintaining good physical health, flexibility exercises can keep your body limber and help you maintain a wide range of motion. This is important because range of motion is often limited by things like arthritis. ","Practicing and improving balance is important for older adults because it can strengthen the body's core and help prevent falls."]
    let arrImages = ["Aerobics","Strength","Flexibility","Balance"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

extension ViewController : UITableViewDelegate, UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrWorkOut.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tblData.dequeueReusableCell(withIdentifier: "cellWorkOut") as! WorkoutTableViewCell
        cell.lblTitle.text = arrWorkOut[indexPath.row]
        cell.lblSubTitle.text = arrInforText[indexPath.row]
        cell.imgWork.isHidden = true
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        tableView.deselectRow(at: indexPath, animated: true)
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let detailVC = storyboard.instantiateViewController(withIdentifier: "DetailViewController") as! DetailViewController
        detailVC.strTitle = arrWorkOut[indexPath.row]
        detailVC.strDetail = arrDetailText[indexPath.row]
        detailVC.workOutName = arrImages[indexPath.row]
        self.navigationController?.pushViewController(detailVC, animated: true)
    }
}


