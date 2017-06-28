import Foundation

let champs : [Int: String] = [
  1980 : "Ukraine",
  1981 : "Germany",
  1982 : "Italy",
  1983 : "Ukraine",
]

// v2, reduce.
//let winnersDict = champs.reduce([String: Int]()) { (var winners, pair) in
//  winners[pair.1] = (winners[pair.1] ?? 0) + 1
//  return winners
//}

// just for fun: oneliner
let winnersDict = champs.reduce([String: Int]()) {
  var winners = $0
  winners[$1.1] = (winners[$1.1] ?? 0) + 1
  return winners
}

let winnersArray = winnersDict.map { ($0, $1) }.sorted{$1.1 < $0.1}
print(winnersArray)


// v1. trivial
var winners2 = [String:Int]()
for (year, country) in champs {
  winners2[country] = (winners2[country] ?? 0) + 1
}
winners2

let winnersArray2 = winners2.map { ($0, $1) }.sorted{$1.1 < $0.1}
winnersArray2




// v3 !
let winners3Dict = champs.reduce([String: Int]()) { (oldWinners, pair) in
    
    var winners = oldWinners
    
    if let previousVal = winners[pair.1] {
        winners[pair.1] = previousVal+1
    }
    else {
        winners[pair.1] = 1
    }
    return winners
}
winnersDict




