import Foundation
import roscoreLib



let roscore = RosCore()
// roscore.start()

let dispatchGroup = DispatchGroup()
let core_queue = DispatchQueue(label: "core", qos: .userInteractive, attributes: .concurrent)
let other_queue =  DispatchQueue(label: "other", qos: .userInteractive, attributes: .concurrent)


core_queue.async(group: dispatchGroup) {
    roscore.start()
}

other_queue.async(group: dispatchGroup) {
    let start = Date()
    var elapsed = 0.0
    while(elapsed < 5)
    {
        elapsed = Date().timeIntervalSince(start)
    }
    roscore.stop()
}

dispatchGroup.wait()
