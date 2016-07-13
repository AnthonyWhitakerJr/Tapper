//
//  ViewController.swift
//  Tapper
//
//  Created by Anthony Whitaker on 7/12/16.
//  Copyright © 2016 Anthony Whitaker. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var logoImage: UIImageView!
    @IBOutlet weak var howManyTapsTxt: UITextField!
    @IBOutlet weak var playButton: UIButton!
    
    @IBOutlet weak var coinButton: UIButton!
    @IBOutlet weak var tapsLabel: UILabel!
    
    var maxTaps: Int = 0
    var currentTaps: Int = 0
    
    @IBAction func onPlayButtonPressed(sender: UIButton!) {
        if(howManyTapsTxtValidation()){
            maxTaps = Int(howManyTapsTxt.text!)!
            currentTaps = 0
            
            toggleView(false)
            
            updateTapsLabel()
        }
    }
    
    func howManyTapsTxtValidation() -> Bool{
        return howManyTapsTxt != nil && howManyTapsTxt.text != "" && Int(howManyTapsTxt.text!) != nil
    }
    
    @IBAction func onCoinButtonPressed(sender: UIButton) {
        currentTaps += 1
        updateTapsLabel()
        
        if(isGameOver()){
            restartGame()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let tapper = UITapGestureRecognizer(target: view, action:#selector(UIView.endEditing))
        tapper.cancelsTouchesInView = false
        view.addGestureRecognizer(tapper)
    }
    
    func updateTapsLabel() {
        tapsLabel.text = "\(currentTaps) Taps"
    }
    
    func isGameOver() -> Bool {
        return currentTaps >= maxTaps
    }
    
    func restartGame(){
        maxTaps = 0
        howManyTapsTxt.text = ""
        
        toggleView(true)
    }
    
    func toggleView(showStartScreen: Bool) {
        logoImage.hidden = !showStartScreen
        howManyTapsTxt.hidden = !showStartScreen
        playButton.hidden = !showStartScreen
        
        coinButton.hidden = showStartScreen
        tapsLabel.hidden = showStartScreen
    }
}

