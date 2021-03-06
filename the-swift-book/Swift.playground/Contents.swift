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
let namesToSort = ["Chris", "Alex", "Ewa", "Barry", "Daniella"]
func backwards(s1: String, _ s2: String) -> Bool {
    return s2 > s1
}
let ns1 = namesToSort.sort(backwards)

let ns2 = namesToSort.sort({ (s1: String, s2: String) -> Bool in
    return s2 > s1
})

// types are always inferred
let ns3 = namesToSort.sort({
    s1, s2 in return s2 > s1
})

// single statement got returned by default
let ns4 = namesToSort.sort({
    s1, s2 in s2 > s1
})

// default parameter names
let ns5 = namesToSort.sort({
    $1 > $0
})

// operators are functions too
let ns6 = namesToSort.sort(<)

// trailing closure doesn't need braces
// and if the function doesn't have other arguments, it doesn't need it either
let ns7 = namesToSort.sort {
    $1 > $0
}
// ------------------------------------------------------------------------ //


// Enumerations
enum CompasPoint {
    case North, South, East, West
}

var cp = CompasPoint.North
// once the type is inferred, you can omit the common part
cp = .East

// enum with associated values
enum Barcode {
    case UPCA(Int)
    case QRCode(String)
}

var bc1 = Barcode.UPCA(31337)
var bc2 = Barcode.QRCode("THEVERYLONGSTRING")

// no need for default case, let handle associated value extraction
switch bc1 {
case .UPCA(let codeNumber):
    print("UPCA code: \(codeNumber)")
case .QRCode(let codeString):
    print("QR code: \(codeString)")
}

// enum with raw values, predefined for each case
enum ASCIIControlCharacters: Character {
    case Tab = "\t"
    case Linefeed = "\n"
    case CarriageReturn = "\r"
}

enum Month: Int {
    case January = 1, February, March, April, May, June,
    July, August, September, October, November, December
}
let june = Month.June
print("No more zero-month: \(june.rawValue)")
print("Default names: \(CompasPoint.East)")

let july = Month(rawValue: 7)
print("Month of: \(july)")

indirect enum Tree {
    case Leaf(Int)
    case Node(Int, Tree, Tree)
}

func countNodes(tree: Tree) -> Int {
    switch tree {
    case .Leaf(let value):
        return value
    case .Node(let value, let left, let right):
        return value + countNodes(left) + countNodes(right)
    }
}
let tree = Tree.Node(1, Tree.Leaf(1), Tree.Node(1, Tree.Leaf(0), Tree.Leaf(1)))
countNodes(tree)
// ------------------------------------------------------------------------ //


// Classes and structures
class A {
    let a: String = "a"
}
let a = A()
let aa = a
// object equality test, == is not supported by default
a === aa

struct B {
    var b: String

    init(b: String) {
        self.b = b
    }
}

let ib = B(b: "b")
// can't change even the properties of immutable struct, even though .b is a var
// this only is true for structs, cause they are value types
// ib.b = "c"
var mb = B(b: "b")
mb.b = "c"
print(mb)

struct Point {
    var x = 0, y = 0

    // cause by default you can't modify value type's properties
    mutating func moveBy(delta: Point) {
        x += delta.x
        y += delta.y
    }
}

// getter and setter for computed property
struct Square {
    var origin: Point
    let size: Int
    var center: Point {
        get {
            return Point(x: origin.x + (size / 2), y: origin.y + (size / 2))
        }
        set {
            origin.x = newValue.x - (size / 2)
            origin.y = newValue.y - (size / 2)
        }
    }
}

// getter only, shorthand notation
struct Star {
    var center: Int {
        return 17
    }
}

enum Switch {
    case Off, Low, High
    // changing self with mutating method
    mutating func next() {
        switch self {
        case Off:
            self = Low
        case Low:
            self = High
        case High:
            self = Off
        }
    }
}

// subscript in action, also can be used to set values
struct TimesTable {
    let multiplier: Int
    subscript(index: Int) -> Int {
        return multiplier * index
    }
}

let stt = TimesTable(multiplier: 5)
stt[3]
// ------------------------------------------------------------------------ //


// Initialization
struct Celsius {
    var temperature: Double

    init(_ celsius: Double) {
        temperature = celsius
    }

    init(fromKelvin kelvin: Double) {
        temperature = kelvin - 273.15
    }

    init(fromFahrenheit fahrenheit: Double) {
        temperature = (fahrenheit - 32.0) / 1.8
    }
}

class I {
    var i: Int = 32
}
let ii = I()

struct S {
    var s: String = "string"
}
let ist = S(s: "another thing completely")
ist.s

// got default initializer (), cause all properties are set
class Vehicle {
    var numberOfWheels = 0

    var description: String {
        return "\(numberOfWheels) wheel(s)"
    }
}

class Bicycle: Vehicle {
    // overriding default, hence the keyword
    override init() {
        // call to super first
        super.init()
        numberOfWheels = 2
    }
}

class Food {
    var name: String

    init(name: String) {
        self.name = name
    }

    convenience init() {
        self.init(name: "[Undefined]")
    }

    func description() -> String {
        return self.name
    }
}
let magicFood = Food()
magicFood.description()
let normalFood = Food(name: "bacon")
normalFood.description()

class RecipeIngredient: Food {
    var quantity: Int

    init(name: String, quantity: Int) {
        self.quantity = quantity
        super.init(name: name)
    }

    // override because it's same parameters as designated init of Food
    override convenience init(name: String) {
        self.init(name: name, quantity: 1)
    }

    override func description() -> String {
        return "\(self.quantity) of \(self.name)"
    }
}

// we got the init() inherited from Food, 
// it's a convenience one, so it calls RecipeIngredient.init(name) instead of Food.init(name)
let ri = RecipeIngredient()
ri.description()

enum TemperatureUnit: Character {
    case Kelvin = "K", Celsius = "C", Fahrenheit = "F"
}

let ftu = TemperatureUnit(rawValue: "F")
let xtu = TemperatureUnit(rawValue: "X")

class SomeWeirdClass {
    let someReallyWeirdProperty: Int = {
        // computation goes here
        return 42
        // "()" is necessary to call closure immediately, so the resutls goes into property
    }()
}

let swc = SomeWeirdClass()
swc.someReallyWeirdProperty
// ------------------------------------------------------------------------ //

// ARC
class APerson {
    let name: String

    init(name: String) {
        self.name = name
    }

    var apartment: AApartment?

    deinit {
        print("\(name) deinitialized")
    }
}

class AApartment {
    let unit: String

    init(unit: String) {
        self.unit = unit
    }

    weak var tenant: APerson?
}

var p1: APerson?
var a1: AApartment?

p1 = APerson(name: "Jack")
a1 = AApartment(unit: "Abandoned one")
p1?.apartment = a1
a1?.tenant = p1

p1 = nil
a1 = nil
// ------------------------------------------------------------------------ //

// Optional chaining
class OPerson {
    var residence: OResidence?
}

class OResidence {
    var numberOfRooms = 0

    init(numberOfRooms: Int) {
        self.numberOfRooms = numberOfRooms
    }

    func reportRooms() {
        print("got \(self.numberOfRooms)")
    }
}

let or = OResidence(numberOfRooms: 2)
let op = OPerson()
op.residence = or
// optional chaining always brings you an optional, even if original property is not
if let rooms = op.residence?.numberOfRooms {
    print("got \(rooms)")
} else {
    print("got nothing")
}

// you even can call methods and if it's anything but nil (Void will work), it worked
if op.residence?.reportRooms() != nil {
    print("seems like report works")
} else {
    print("that's looks like nil, babe")
}
// ------------------------------------------------------------------------ //

// Error handling
