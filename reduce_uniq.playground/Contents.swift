
// need to be equitable in order to use "contains" method below
struct CustomStruct : Equatable {
  let name: String
  let lastName : String
}

// conform to Equatable protocol.
func ==(lhs: CustomStruct, rhs: CustomStruct) -> Bool {
  return (lhs.name == rhs.name && lhs.lastName == rhs.lastName)
}

let categories = [CustomStruct(name: "name1", lastName: "lastName1"),
                  CustomStruct(name: "name2", lastName: "lastName1"),
                  CustomStruct(name: "name1", lastName: "lastName1")]
print(categories.count) // prints 3

// remove duplicates (and keep initial order of elements)
let uniq1 : [CustomStruct] = categories.reduce([]) { $0.contains($1) ? $0 : $0 + [$1] }
print(uniq1.count)


// here is exactly the same, but using more expanded reduce syntax
let uniq2 : [CustomStruct] = categories.reduce([]) { (result, category) in
  var newResult = result
  if (newResult.contains(category)) {}
  else {
    newResult.append(category)
  }
  return newResult
}
uniq2.count

