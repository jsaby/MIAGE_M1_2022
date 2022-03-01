//
//  ViewController.swift
//  LasVegasCasino
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    func randomNumber(num:Int) -> Int {
        return Int(arc4random_uniform(UInt32(num)))
    }
    
    func vainqueur() {
        
        if let sonURL = Bundle.main.url(forResource: "winSoundEffect", withExtension: "mp3") {
            var son:SystemSoundID = 0
            AudioServicesCreateSystemSoundID(sonURL as CFURL, &son)
            AudioServicesPlaySystemSound(son)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

