import UIKit
import AVFoundation

class ViewController: UIViewController {
    
       
    //Dictionary with the name of the tea (button) and the brew time in seconds
    let teaTimes = ["BlackButton": 5, "GreenButton": 2, "HerbalButton": 5, "WhiteButton": 3, "CinnamonButton": 10]

     //Variable that holds the brew time
    var totalTime = 0
    
    //Variable that holds the time that has elapsed
    var timePassed = 0

    //Object of Timer class
    var timer = Timer()
    
    //Variable of AVAudioPlayer type
    var player: AVAudioPlayer!
    
   
     //declaring IBOutlets for labels and progress bar
    @IBOutlet weak var doneLabel: UILabel!
    @IBOutlet weak var choiceLabel: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!

    
    //function that loads the initial display
    override func viewDidLoad() {
        super.viewDidLoad()
        //make doneLabel invisible
        doneLabel.alpha = 0
        //Set label corner radius
        doneLabel.layer.cornerRadius = 20
        //make sure choiceLabel is visible.
        choiceLabel.alpha = 1
    }

    
    @IBAction func brewTime(_ sender: UIButton) {
        //load the display
        viewDidLoad()
        //stops an active timer if any
        timer.invalidate()
               
        //reset timePassed to zero
        timePassed = 0
               
        //reads the tea type from the button label
        let tea = sender.accessibilityLabel!
        //prints the tea name to console
        print(tea)
        //extracts the brew time from the dictionary using the tea name
        totalTime = teaTimes[tea]!
        //prints the brew time to console
        print(totalTime)
               
        //set progress bar to zero
        progressBar.progress = 0
        //calculate brew time from seconds to minutes
        let totalTimeMinutes = totalTime/60
        //sets the choice label to display the chosen tea type and its total brew time
        choiceLabel.text = "Tea total brewing time is \(totalTimeMinutes) minutes"
        choiceLabel.textAlignment = .center
        //set timer to loop itself every second as set when repeat is set to true. Here the selector method takes the updateTimer method as parameter.
        timer  = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
    }
 
    @objc func updateTimer(){
        //check if timePassed is ledd than total time in which case the time passed will increase by 1 and the progress bar updated to reflech the updated timePassed
        if timePassed < totalTime {
            timePassed += 1
            progressBar.progress = Float(timePassed) / Float(totalTime)
            //print the percentage of the time that has elapsed to the console
            print(Float(timePassed) / Float(totalTime))
        }
        //when timePassed is equal or greater than totalTime the timer has been completed therefore the timer needs to be invalidated so it stops repeating. Updates the display to show the timer has finished by displaying the doneLabel and playing an alarm
        else{
            //invalidate timer
            timer.invalidate()
            //Hides choiceLabel
            choiceLabel.alpha = 0
            //displays choice label
            doneLabel.alpha = 1
                    
            //load the mp3 file to a variable
            let url = Bundle.main.url(forResource: "alarm_sound", withExtension: "mp3")
            //load the mp3 variable to the AVAudio player
            player = try! AVAudioPlayer(contentsOf: url!)
            //plays the alarm
            player.play()
                     
            }
    }

    
    @IBAction func clearSelection(_ sender: UIButton) {
        //choicelabel back to original text
        choiceLabel.text = "Choose the tea type you want to brew"
        //display choiceLabel
        choiceLabel.alpha = 1
        //reset progress bar to 50%
        progressBar.progress = 0.5
        //hide doneLabel
        doneLabel.alpha = 0
        //reset variables values to zero
        totalTime = 0
        timePassed = 0
        //load display
        viewDidLoad()
    }
}
