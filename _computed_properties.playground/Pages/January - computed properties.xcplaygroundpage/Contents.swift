
class Tmp {
  
  // using closure for initialising lazy property. It's called only once.
  var a_i = 0
  lazy var a : Int = { return ++self.a_i }()

  // the same with static
  static var static_a_i = 0
  static var static_a : Int = { return ++static_a_i }()

  // the same, using for initialising functions from other class
  var i   : Int = anotherClass().lala()
  var s_i : Int = anotherClass.blabla()
  
  // using computed property. it's called every time (and can't be lazy)
  var b_i = 0
  var b : Int { return ++self.b_i }

  // the same with static
  static var static_b_i = 0
  static var static_b : Int { return ++static_b_i }

  // using getter. behaves the same way as computed property
  var c_i = 0
  var c : Int { get { return ++self.c_i } }
  
}

class anotherClass {
  var i_i = 0
  func lala() -> Int { return ++i_i }
  
  static var s_i_i = 0
  static func blabla() -> Int { return ++s_i_i }
}

let t = Tmp()

t.a
t.a
t.a


Tmp.static_a
Tmp.static_a
Tmp.static_a

t.i
t.i
t.i

t.s_i
t.s_i
t.s_i

t.b
t.b
t.b

Tmp.static_b
Tmp.static_b
Tmp.static_b

t.c
t.c
t.c

// Example:
// lazy var maximumDistance :  { KDABasicConfiguration.maximumDistance() }
// lazy var deviceType: String    = KDAConstants.deviceType()
// lazy var locality: KDALocality = KDALocationManager.currentLocality()
