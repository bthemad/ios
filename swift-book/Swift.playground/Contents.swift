// Swift tour
// simple values
let exFloat: Float = 4
let label = "label for " + String(exFloat)
let aLable = "A label for \(exFloat + 2)"

// arrays & dicts
var things = ["one", "two"]
var mapThings = ["one": 1, "two": 2]

mapThings[things[0]]

var manyEmptyStrings = [String]()
var manyEmptyMaps = [String: Int]()

manyEmptyStrings = []
manyEmptyMaps = [:]

// opts
var optString: String? = "opt string"
//var optString: String? = nil
if let str = optString {
    print(str)
} else {
    print("got nil")
}

// for in
for thing in things {
    print("thing: \(thing)")
}

for (k, v) in mapThings {
    print("k: \(k), v: \(v)")
}

for x in 0 ..< 3 { // 3 items, right border not included
//for x in 0 ... 3 {  // 4 items
    print(x)
}

func sumOf(nums: Int...) -> Int {
//    { (a, b) -> c in ... } - closure
//    return nums.reduce(0, combine: {(x, y) -> Int in x + y})
//    return nums.reduce(0, combine: {$0 + $1})
    return nums.reduce(0, combine: +) // because "+" is a function name
}

sumOf(1, 2, 3, 4, 5)

// Classes
class NamedShape {
    var numberOfSides = 0
    let name: String

    init(name: String) {
        self.name = name
    }

    func desc() -> String {
        return "A shape \(name) with \(numberOfSides) sides"
    }
}

var ns = NamedShape(name: "thing")
ns.numberOfSides = 3
ns.desc()

class EquilateralTriangle: NamedShape {
    var sideLength: Double = 0

    init(name: String, side: Double) {
        self.sideLength = side
        super.init(name: name)
        self.numberOfSides = 3
    }

    var perimeter: Double {
        get {
            return 3.0 * sideLength
        }

        set (per) {
            sideLength = per / 3
        }
    }

    override func desc() -> String {
        return "A  \(name) with p: \(perimeter) and a: \(sideLength)"
    }
}

let et: EquilateralTriangle? = EquilateralTriangle(name: "triangle", side: 10)
et?.desc()
et?.perimeter = 9.9
et?.desc()


// structs & enums
enum Thing {
    case One, Two, Three
}

enum WildThing: Int {
    case One = 1, Two
    case Three
}

print(Thing.Three)
print(WildThing.Three.rawValue)
// ------------------------------------------------------------------------ //


// The Basics
print(1, 2, 3, separator: " | ", terminator: "")
print(Int.max, Int.min, UInt.max)

// tuples
var tt = (num: 42, msg: "meaning of life")
let (meaning_num, meaning_msg) = tt
assert(tt.0 == meaning_num)
assert(tt.num == meaning_num)

// optional binding and some where conditions
var optVal: Int? = 42
var optStr: String? = "Sure?"
if let sureVal = optVal, sureStr = optStr where sureVal < 56 {
    print(sureVal, sureStr, separator: ", ")
} else {
    print("not sure")
}
// ------------------------------------------------------------------------ //


// Basic operators
//let optThing: String? = "the thing"
let optThing: String? = nil
let defString = optThing ?? "default string"
// ------------------------------------------------------------------------ //


// Strings and characters


























