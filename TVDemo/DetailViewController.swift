//
//  DetailViewController.swift
//  TVDemo
//
//  Created by Darshit Vadodaria on 27/04/18.
//  Copyright © 2018 Darshit Vadodaria. All rights reserved.
//

import UIKit
import AVKit
import AVFoundation

class DetailViewController: UIViewController, AVPlayerViewControllerDelegate {

    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblDetail: UILabel!
    @IBOutlet weak var imgWorkOut: UIImageView!
    
    @IBOutlet weak var videoCollectionView: UICollectionView!
    let arrImages = ["Aerobics","Strength","Flexibility","Balance"]
    var strDetail = ""
    var strTitle = ""
    var workOutName = ""
    
    var player: AVPlayer!
    var playerController = AVPlayerViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        lblTitle.text = strTitle
        lblDetail.text = strDetail
        lblDetail.sizeToFit()
        imgWorkOut.image = UIImage(named: workOutName)
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
   
    
    func startPlaying(){
        
        
        let url = URL.init(string: "https://clips.vorwaerts-gmbh.de/big_buck_bunny.mp4")
        let player = AVPlayer(url:url!)
        
        playerController = AVPlayerViewController()
        
        
        NotificationCenter.default.addObserver(self, selector: #selector(DetailViewController.didfinishplaying(note:)),name:NSNotification.Name.AVPlayerItemDidPlayToEndTime, object: player.currentItem)
        
        playerController.player = player
        playerController.delegate = self
        
        playerController.player?.play()
        
        self.present(playerController,animated:true,completion:nil)
    }
    @objc func didfinishplaying(note : NSNotification)
    {
        playerController.dismiss(animated: false,completion: {
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let fitVC = storyboard.instantiateViewController(withIdentifier: "FeelFitViewController") as! FeelFitViewController
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
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

extension DetailViewController : UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 16
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell : VideoCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "videoCell", for: indexPath) as! VideoCollectionViewCell
        cell.imgThumb.image = UIImage(named: arrImages[indexPath.row % 4])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 318, height: 216)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        startPlaying()
//        let storyboard = UIStoryboard(name: "Main", bundle: nil)
//        let fitVC = storyboard.instantiateViewController(withIdentifier: "FeelFitViewController") as! FeelFitViewController
//        self.navigationController?.pushViewController(fitVC, animated: false)
    }
}
