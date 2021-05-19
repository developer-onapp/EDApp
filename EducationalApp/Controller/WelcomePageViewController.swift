//
//  ViewController.swift
//  EducationalApp
//
//  Created by F_Sur on 14/05/2021.
//

import AVFoundation
import UIKit
import AVKit

class WelcomePageViewController: UIViewController {

    // Outlets
    @IBOutlet weak var siginBtnOutlet: UIButton!
    @IBOutlet weak var signupBtnOutlet: UIButton!
    
    // Variables
    var videoPlayer: AVPlayer?
    var videoPlayerLayer: AVPlayerLayer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
            
        // MAke UI for Buttons
        setUpElements()
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        
        // TODO:- make later active video
//        setUpVideo()
    }
    
    // Actions
    @IBAction func signinBtnTapped(_ sender: UIButton) {
        
        print("sign in presed")
        let signInVC = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(identifier: K.Storyboard.signInStoryboard) as? SignInViewController
        self.present(signInVC!, animated: true, completion: nil)
        
    }
    
    @IBAction func signupBtnTapped(_ sender: UIButton) {
        let signUpVC = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(identifier: K.Storyboard.signUpStoryboard) as? SignUpViewController
        self.present(signUpVC!, animated: true, completion: nil)
        print("sign up presed")
    }
}

// MARK:  Helper Functions
extension WelcomePageViewController {

    
    func setUpElements() {
        UIUtilities.styleFilledButton(siginBtnOutlet)
        UIUtilities.styleFilledButton(signupBtnOutlet)
    }
    
    func setUpVideo() {
        let bundlePath = Bundle.main.path(forResource: "SeedAndEdu", ofType: "mp4")
        
        guard bundlePath != nil else {
            return
        }
        
        let url = URL(fileURLWithPath: bundlePath!)
        
        let item = AVPlayerItem(url: url)
        
        videoPlayer = AVPlayer(playerItem: item)
        
        videoPlayer?.isMuted = true
        
        videoPlayerLayer = AVPlayerLayer(player: videoPlayer)
        
        videoPlayerLayer?.frame = CGRect(x: -self.view.frame.size.width * 1.25 , y: 0, width: self.view.frame.size.width * 4, height: self.view.frame.size.height)
        
        view.layer.insertSublayer(videoPlayerLayer!, at: 0)
        videoPlayer?.playImmediately(atRate: 0.5)
    }
}
