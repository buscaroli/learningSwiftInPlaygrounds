import UIKit
import Foundation
print(Date())
 // Date Section
let dateFormatter = DateFormatter()
let date = Date()
dateFormatter.locale = Locale(identifier: "en_GB")
dateFormatter.setLocalizedDateFormatFromTemplate("MMMMdy")
print(dateFormatter.string(from: date))

// End of Date section

struct Run {
    let id: String
    let startTime: Date
    var endTime: Date?
    
//    func elapsedTime() -> TimeInterval {
//        return Date().timeIntervalSince(startTime)
//    }
    var elapsedTime: TimeInterval {
        return Date().timeIntervalSince(startTime)
    }
    
//    func isFinished() -> Bool {
//        return endTime != nil
//    }
    var isFinished: Bool {
        return endTime != nil
    }
    
    mutating func setFinished() {
        endTime = Date()
    }
    
    init(id: String, startTime: Date) {
        self.id = id
        self.startTime = startTime
        self.endTime = nil
    }
}

var firstRun = Run(id: "first run on Monday", startTime: Date())
//firstRun.elapsedTime()
firstRun.elapsedTime
//firstRun.isFinished()
sleep(2)
firstRun.isFinished
//firstRun.elapsedTime()
firstRun.elapsedTime
//firstRun.isFinished()
firstRun.isFinished
firstRun.setFinished()
//firstRun.isFinished()
firstRun.isFinished

