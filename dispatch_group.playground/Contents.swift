
import UIKit
import Foundation

var number = 0
let lockQueue = DispatchQueue(label: "qqq")

let addOne = {
    lockQueue.sync {
        number+=1
    }
}


let group = DispatchGroup()

let startTime = CFAbsoluteTimeGetCurrent()

for _ in 1...100 { // set to 10 000. run couple times to see different final number
    group.enter()
    
    DispatchQueue.global(qos: .userInitiated).async {
//        addOne()
        number+=1
        group.leave()
    }
}



group.wait(timeout: DispatchTime.distantFuture)

//dispatch_group_notify(group, dispatch_get_main_queue(), { () -> Void in
number
//})

let timeElapsed = CFAbsoluteTimeGetCurrent() - startTime

sleep(1)
number

// Conclusions:
// 1. there's no crash (tested on a device as well)
// 2. without thread safe code final number is wrong
// 3. with dispatch_sync final number is correct
// 4. with dispatch_sync execution is 3 times longer
// 5. dispatch_group_notify doesn't work in the playground for some reason,
//    but you can use dispatch_group_wait instead
// 6. objc_sync_enter/exit doesn't work !!!



