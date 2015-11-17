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
let emptyString = ""
emptyString.isEmpty

let dogString = "Dog!🐶"
for c in dogString.characters {
    print(c)
}

// construct back
let catChars: [Character] = ["C", "a", "t", "!", "🐱"]
var catString = String(catChars)

catString.append(Character("!"))

// string inside a string
print("This is \(catString + "!11")")

// extended grapheme claster in action
var cafe = "cafe"
cafe.characters.count
cafe += "\u{301}"
cafe.characters.count

cafe[cafe.startIndex]
cafe[cafe.startIndex.advancedBy(2)]
cafe[cafe.endIndex.predecessor()]

// iterate thorugh the characters with enumeration
for idx in cafe.characters.indices {
    print(idx, cafe[idx])
}

// insert/delete
cafe.insert("!", atIndex: cafe.endIndex)
cafe.insertContentsOf("Good ".characters, at: cafe.startIndex)
let removedChar = cafe.removeAtIndex(cafe.endIndex.predecessor())
cafe.removeRange(cafe.startIndex..<cafe.startIndex.advancedBy(5))

cafe.hasPrefix("ca")
cafe.hasSuffix("fé")
// ------------------------------------------------------------------------ //


// Collection types
var emptyInts = [Int]()
emptyInts.append(37)
let defaultArray = [Int](count: 5, repeatedValue: 42)
let sumArray = emptyInts + defaultArray
var shoppingList = ["Eggs", "Milk"]
shoppingList.contains("Eggs")

for (idx, item) in shoppingList.enumerate() {
    print(idx, item)
}

var setOfLetters = Set<Character>()
setOfLetters.insert("a")
// Reset the set with array literal, still set
setOfLetters = []
setOfLetters.insert("b")
// Using array literal to create set
var newSet: Set<Character> = ["a", "b"]

// loop through sorted items
for c in newSet.sort() {
    print(c)
}

var airports = [String: String]()
airports = [:]
airports = ["LHR": "London"]
// returns the old value, so you can check if key existed before
airports.updateValue("London Heathrow", forKey: "LHR")
if let dme = airports.updateValue("Moscow DME", forKey: "DME") {
    print("DME is a known thing")
} else {
    print("First time hear about DME")
}

// And you get nil in case the key doesn't exist
if let dub = airports["DUB"] {
    print(dub)
} else {
    print("Never heard of DUB")
}

if let lhr = airports.removeValueForKey("LHR") {
    print("Removed LHR")
} else {
    print("LHR doesn't exist")
}
// You can delete existing or deleted item
airports["LHR"] = nil
for (code, name) in airports {
    print(code, name, separator: " : ")
}
let airCodes = [String](airports.keys)
let airNames = [String](airports.values)
// ------------------------------------------------------------------------ //


// Control flow
let point = (5, 3)
switch point {
case (0...3, 7):
    print("range match")
case let (x, y) where x > y:
    print("filtered match")
default:
    print("obligatory default case")
}

func testGuard(optValue: String?) -> Bool {
    guard let _ = optValue else {
        print("Run, Forrest, run")
        return false
    }
    return true
}

testGuard(nil)
testGuard("anyway")

if #available(iOS 9, *) {
    print("we're lucky today")
}
// ------------------------------------------------------------------------ //


// Functions
func minMax() -> (min: Int, max: Int) {
    return (32, 67)
}

let mm = minMax()
// because it's in function definition
print(mm.min, mm.max)

func localAndExternalNames(externalName localName: Int) -> (Int)? {
    print(localName)
    return nil
}

localAndExternalNames(externalName: 32)

// And example of default value
func secondNamelesParameter(first: Int, _: Int = 74) {
    return ()
}

secondNamelesParameter(57)

func anyNumberYouGive(numbers: Int...) {
    for number in numbers {
        print(number)
    }
}

anyNumberYouGive(32, 64, 71, 93)

// function type as a parameter and return type, kinda hard to read
func applyOp(a: Int = 0, b: Int = 0, op: (Int, Int) -> Int) -> ((Int, Int) -> Int, Int) {
    return (op, op(a, b))
}

applyOp(3, b: 5, op: +)
// ------------------------------------------------------------------------ //


// Closures
