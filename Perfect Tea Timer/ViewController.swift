

import UIKit
import AVFoundation

class ViewController: UIViewController {

    //Dictionary with the name of the tea (button) and the brew time in seconds
    let teaTimes = ["BlackButton": 300, "GreenButton": 120, "HerbalButton": 300, "WhiteButton": 180, "CinnamonButton": 600]
    
    //Variable that holds the brew time
        var totalTime = 0
    
    //Variable that holds the time that has elapsed
    var timePassed = 0
    
    //Object of Timer class
    var timer = Timer()
    
    //Variable of AVAudioPlayer type
    var player: AVAudioPlayer!
    
    @IBOutlet weak var doneLabel: UILabel!
    
    @IBOutlet weak var choiceLabel: UILabel!
    
    @IBOutlet weak var progressBar: UIProgressView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //make doneLabel invisible and round its corners
        doneLabel.alpha = 0
        doneLabel.layer.cornerRadius = 20
        //make sure choiceLabel is visible.
        choiceLabel.alpha = 1
        
    }
    
    
    @IBAction func brewTime(_ sender: UIButton) {
        //viewDidLoad()
        time.invalidate()
        
        let tea = sender.accessibilityLabel!
        print(tea)
        totalTime = teaTimes[tea]!
        print(totalTime)
        
        
        
    }
    
   
    
    
}

