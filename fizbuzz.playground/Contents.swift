import Foundation

let numbers = (1..<100)

// ------------------------------ version 1, obvious
//let startTime1 = CFAbsoluteTimeGetCurrent()
//
//(0...100).forEach {_ in
//  let results : [String] = numbers.map {
//    var s = ""
//    if ($0 % 3 == 0) { s += "fizz" }
//    if ($0 % 5 == 0) { s += "buzz" }
//    return s.isEmpty ? String($0) : s
//  }
//}
//let timeElapsed1 = CFAbsoluteTimeGetCurrent() - startTime1


// ------------------------ version 2, improved
//let startTime2 = CFAbsoluteTimeGetCurrent()
//
//(0...100).forEach {_ in
let results2 : [String] = numbers.map {
  let s = (($0 % 3 == 0) ? "fizz" : "") + (($0 % 5 == 0) ? "buzz" : "")
  return s.isEmpty ? String($0) : s
}
//}
//let timeElapsed2 = CFAbsoluteTimeGetCurrent() - startTime2



