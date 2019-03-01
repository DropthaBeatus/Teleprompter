//
//  TeleprompterViewController.swift
//  Teleprompter
//
//  Created by Liam Flaherty on 2/28/19.
//  Copyright © 2019 Liam Flaherty. All rights reserved.
//

import UIKit

class TeleprompterViewController: UIViewController {

    @IBOutlet weak var teleprompterView: UITextView!
    
    @IBOutlet weak var topView: UIView!
    
    @IBOutlet weak var bottomView: UIView!
    @IBOutlet weak var teleVTopCon: NSLayoutConstraint!
    @IBOutlet weak var teleVHeightCon: NSLayoutConstraint!
    
    //I wanted to have to translate the y coord of the UITextView but had to cancel it as it interupted the flip function
    //I could not find the proper function to handle the flip and translate
    
    
    //let screenHeight = (UIScreen.main.fixedCoordinateSpace.bounds.height)
   // var endTopTrans = false
   // var endScroll = false

    //var started = false
    var flipped = false
    var teleTimer: Timer!
    var progress = 0
    override func viewDidLoad() {
        super.viewDidLoad()
       // loadPrompt()
    }
    /*
    func loadPrompt(){
        teleprompterView.transform = CGAffineTransform(translationX: 0, y: screenHeight-bottomView.frame.height)
    }
    */
    @IBAction func playBTN(_ sender: Any) {
        if(teleTimer == nil){
            teleTimer = Timer.scheduledTimer(timeInterval: 0.4, target: self, selector: #selector(fireTimer), userInfo: nil, repeats: true)
        }
    }
    
    @IBAction func pauseBtn(_ sender: Any) {
        if(teleTimer != nil){
            teleTimer!.invalidate()
            teleTimer = nil
        }
    }
    
    @IBAction func flipBtn(_ sender: Any) {
        if(flipped){
            teleprompterView.transform = CGAffineTransform(scaleX: 1, y: 1)
            flipped = false
        }
        else{
            teleprompterView.transform = CGAffineTransform(scaleX: -1, y: -1)
            flipped = true
        }
    }
    
    @IBAction func replayBTN(_ sender: Any) {
        teleprompterView.scrollRangeToVisible(NSRange(location: 0, length: 100))
        progress = 0
        
    }
    
    
    @objc func fireTimer() {
        //I wanted to have to translate the y coord of the UITextView but had to cancel it as it interupted the flip function
        //I could not find the proper function to handle the flip and translate
        /*
        let topAdd = bottomView.frame.height
        //if()
        if(!endTopTrans){
            teleprompterView.transform = CGAffineTransform(translationX: -1, y: screenHeight - (topAdd + CGFloat(progress)))
            if(screenHeight - (topAdd + CGFloat(progress)) <= 15){
                endTopTrans = true
                progress = 0
                teleprompterView.transform = CGAffineTransform(translationX: -1, y: 0)
            }
        }
        else if(endTopTrans && !endScroll){
            */
            teleprompterView.scrollRangeToVisible(NSRange(location: progress, length: 100))
            /*if(CGFloat(progress) >= self.teleprompterView.bounds.height){
                endScroll = true
                progress = 0
            }
        }
        else{
            teleprompterView.transform = CGAffineTransform(translationX: 0, y: CGFloat(progress * -1))
            
        }
 */
            progress += 7
 
    }
    
}
