//
//  ViewController.swift
//  PiP
//
//  Created by Matthew Mould on 04/11/2020.
//

import UIKit
import AVKit

class ViewController: UIViewController {

    @IBAction func startPip(_ sender: Any) {
        print("start pip")
        pictureInPictureController.startPictureInPicture()
    }
    var player:AVPlayer!
    var playerLayer:AVPlayerLayer!
    var pictureInPictureController: AVPictureInPictureController!
    
    @IBOutlet var someView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        player = AVPlayer(url: URL(string: "http://devimages.apple.com/iphone/samples/bipbop/bipbopall.m3u8")!)
        playerLayer = AVPlayerLayer(player: player)
        player.play()
        someView.layer.addSublayer(playerLayer)
        playerLayer.frame = self.someView.bounds //bounds of the view in which AVPlayer should be displayed
        playerLayer.videoGravity = .resizeAspect
        
        pictureInPictureController = AVPictureInPictureController(playerLayer: playerLayer)

    }


}

