import UIKit

class CDTimer {
    var seconds: Int
    var timer = Timer()
    
    // pass the time for the count down in seconds
    init(seconds: Int) {
        self.seconds = seconds
    }
    
    // at every iteration print the remaining seconds
    // iteration interval is setup with Timer.scheduledTimer()
    @objc func countDown() {
        if seconds > 0 {
            print("> \(seconds)")
            seconds -= 1
        } else {
            print("RIIIIIIIIING!")
            // invalidating the timer after the countdown is completed. Without this action
            // it would print RIIING forever.
            timer.invalidate()
        }
    }
    
    // call the start function to start the timer
    func start() {
        // invalidating any possible running instance of timer before starting a new one
        timer.invalidate()
        
        // selector required an @objc function
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(countDown), userInfo: nil, repeats: true)
    }
}

// instantiating a few different timers
let eggTimer = CDTimer(seconds: 480)
let teaTimer = CDTimer(seconds: 180)
let exampleTimer = CDTimer(seconds: 5)
// eggTimer.start()
// teaTimer.start()

// only one instance of the exampleTimer will be running despite calling it
// four times, this is because at the beginning of the start function
// any possible instance of the timer is invalidated.
exampleTimer.start()
exampleTimer.start()
exampleTimer.start()
exampleTimer.start()
// teaTimer.start()
