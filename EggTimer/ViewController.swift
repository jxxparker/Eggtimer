import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    
    let eggTimes = ["Soft": 3, "Medium": 5, "Hard": 12] //variable for dict
    var timer = Timer() //variable for timer
    var totalTime = 0
    var secondsPassed = 0
    
    @IBAction func hardnessSelected(_ sender: UIButton) { //Runs when soft,medium or hard button is pressed

        timer.invalidate() //everytime button gets pressed it gets invalidated which stop
        let hardness = sender.currentTitle! //soft, medium, hard
        totalTime = eggTimes[hardness]! //assigning value
        
        progressBar.progress = 0.0 //when button is pressed again, it sets progressbar to 0
        secondsPassed = 0
        titleLabel.text = hardness
        
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
        
    }
    
    @objc func updateTimer() {
        if secondsPassed < totalTime {
            secondsPassed += 1
            progressBar.progress = Float(secondsPassed) / Float(totalTime)
        } else {
            timer.invalidate()
            titleLabel.text = "Done!"
        }
    }
}
