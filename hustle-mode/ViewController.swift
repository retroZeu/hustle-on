//
//  ViewController.swift
//  hustle-mode
//
//  Created by jogi capua on 3/28/18.
//  Copyright © 2018 Zeu Capua. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

    @IBOutlet var darkBlueBG: UIImageView!
    @IBOutlet var powerButton: UIButton!
    @IBOutlet var cloudHolder: UIView!
    @IBOutlet var rocket: UIImageView!
    @IBOutlet var hustleLbl: UILabel!
    @IBOutlet var onLbl: UILabel!
    
    var player: AVAudioPlayer!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let path = Bundle.main.path(forResource: "hustle-on", ofType: "wav")!
        let url = URL(fileURLWithPath: path)
        do {
            player = try AVAudioPlayer(contentsOf: url)
            player.prepareToPlay()
        } catch let error as NSError {
            print (error.description)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    @IBAction func powerButtonPressed(_ sender: Any) {
        
        //show the cloud holder
        cloudHolder.isHidden = false;
        
    
        //hide initial outlets
        darkBlueBG.isHidden = true;
        powerButton.isHidden = true;
        
        
        //animation
        player.play()
        
        UIView.animate(withDuration: 2.3, animations: {
            //x and y are end positions, width and height are the imageView's dimensions
            self.rocket.frame = CGRect(x: 0, y: 250, width: 375, height: 216)
        }) { (finished) in
            self.hustleLbl.isHidden = false;
            self.onLbl.isHidden = false;
        }
    }
    

}

