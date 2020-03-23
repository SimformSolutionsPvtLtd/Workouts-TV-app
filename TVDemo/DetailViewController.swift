//
//  DetailViewController.swift
//  TVDemo
//
//  Created by Darshit Vadodaria on 27/04/18.
//  Copyright © 2018 Simform Solutions PVT LTD. All rights reserved.
//

import UIKit
import AVKit
import AVFoundation

class DetailViewController: UIViewController{

    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblDetail: UILabel!
    @IBOutlet weak var imgWorkOut: UIImageView!
    
    @IBOutlet weak var videoCollectionView: UICollectionView!
    var dictWorkOut : [String:Any]?
    var arrWorkOuts :[[String:Any]] = []
    var strDetail = ""
    var strTitle = ""
    var workOutName = ""
    
    var player: AVPlayer!
    var playerController = AVPlayerViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setData()
        // Do any additional setup after loading the view.
    }
    
    func setData(){
        lblTitle.text = "\(dictWorkOut?["title"] ?? "")"
        lblDetail.text = "\(dictWorkOut?["detailText"] ?? "")"
        lblDetail.sizeToFit()
        imgWorkOut.image = UIImage(named: "\(dictWorkOut?["image"] ?? "")")
    }

    func startPlaying() {
        guard let path = Bundle.main.path(forResource: "workOut", ofType:"mp4") else {
            debugPrint("video.m4v not found")
            return
        }
        let player = AVPlayer(url: URL(fileURLWithPath: path))
        playerController = AVPlayerViewController()
        NotificationCenter.default.addObserver(self, selector: #selector(DetailViewController.didfinishplaying(note:)),name:NSNotification.Name.AVPlayerItemDidPlayToEndTime, object: player.currentItem)
        playerController.player = player
        playerController.delegate = self
        playerController.player?.play()
        self.present(playerController,animated:true,completion:nil)
    }
    
}

extension DetailViewController : AVPlayerViewControllerDelegate{
    
    @objc func didfinishplaying(note : NSNotification)
    {
        playerController.dismiss(animated: false,completion: {
            let fitVC = FeelFitViewController.instantiateFromAppStoryboard(appStoryboard: .Main)
            self.navigationController?.pushViewController(fitVC, animated: false)
        })
        
    }
    
    func playerViewController(_ playerViewController: AVPlayerViewController, restoreUserInterfaceForPictureInPictureStopWithCompletionHandler completionHandler: @escaping (Bool) -> Void) {
        let currentviewController =  navigationController?.visibleViewController
        if currentviewController != playerViewController
        {
            currentviewController?.present(playerViewController,animated: true,completion:nil)
        }
    }
}

extension DetailViewController : UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 16
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell : VideoCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "videoCell", for: indexPath) as! VideoCollectionViewCell
        cell.dictWorkOut = arrWorkOuts[indexPath.row % 4]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 318, height: 216)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        startPlaying()
    }
}
