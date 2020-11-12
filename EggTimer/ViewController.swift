import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var titleLabel: UILabel!
    
    let eggTimes = ["Soft": 3, "Medium": 5, "Hard": 12]
    var secondsRemaining = 60
    var timer = Timer() //variable for timer
    
    @IBAction func hardnessSelected(_ sender: UIButton) { //Runs when soft,medium or hard button is pressed
        
        timer.invalidate() //everytime button gets pressed it gets invalidated which stops
        
        let hardness = sender.currentTitle!
        
        secondsRemaining = eggTimes[hardness]!
        
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
    }
    @objc func updateTimer() {
        if secondsRemaining > 0 {
            print("\(secondsRemaining) seconds.")
            secondsRemaining -= 1
        } else {
            timer.invalidate()
            titleLabel.text = "Done!"
        }
        
    }
}
