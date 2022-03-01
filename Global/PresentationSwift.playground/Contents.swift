import UIKit

var greeting = "Hello, playground"

// --------------------------------
// -- Variables et constantes --
// --------------------------------
let name = "Julie"
var age = 31
age = 32

print("Bonjour, je m'appelle \(name) et j'ai \(age) ans")

// --------------------------------
// -- Types de données --
// --------------------------------
let myName: String = "Julie"
var myAge: Int = 32

// Float et Double : recommandation officielle d'Apple: utiliser par défaut Double (la précision est plus élevée)
var latitude: Double
latitude = 45.188529

var longitude: Float
longitude = 5.724524

// Boolean
var isStudent = true

//Date
let date = Date()
let dateFormatter = DateFormatter()
dateFormatter.dateFormat = "YY/MM/dd"
print(dateFormatter.string(from: date))

// --------------------------------
// -- Opérateurs --
// --------------------------------
var a = 10
a = a + 1
a = a - 1
a = a * a

var b = 10
b += 10
b -= 10

var x = 1.1
var y = 2.2
var z = x + y

var firstname = "Julie"
var lastname = "Saby"
var fullname = firstname + " " + lastname

// Comparaison
a > b
a == b
a <= b

firstname == "Julie"
firstname != "Saby"

// --------------------------------
// -- Tableaux (Arrays) --
// --------------------------------
var evenNumbers = [2, 4, 6, 8]
var sports = ["Badminton", "Athlétisme", "Basket-ball"]
evenNumbers.first
sports[1]
sports.last

type(of: evenNumbers)
type(of: sports)

sports += ["Rugby", "Judo"]
sports.append("Yoga")

// --------------------------------
// -- Dictionnaires --
// --------------------------------
var person = ["first": "Julie", "last": "Saby", "month": "Janvier"]
person["first"]
person["month"]

// --------------------------------
// -- Expressions conditionnelles --
// --------------------------------
var action: String
var place = "restaurant"

if place == "restaurant" {
	action = "to eat"
} else if place == "bar" {
	action = "to drink"
} else {
	action = "to sleep"
}
print(action)

// --------------------------------
// -- Switch case --
// --------------------------------
switch place {
case "restaurant":
	action = "to eat"
case "bar":
	action = "to drink"
default :
	action = "to sleep"
}
print(action)

// --------------------------------
// -- Boucles --
// --------------------------------
for i in 1...10 {
	print("\(i) x 10 is \(i * 10)")
}

for sport in sports {
	print("My favorite sport is \(sport)")
}

var counter = 0

while true {
	print("Counter is now \(counter)")
	counter += 1

	if counter == 60 {
		break
	}
}

// --------------------------------
// -- Les fonctions --
// --------------------------------
func favoriteSport() {
	print("My favorite is Rugby")
}
favoriteSport()

func favoriteSport(name: String) {
	print("My favorite is \(name)")
}
favoriteSport(name: "Judo")

func countLettersInString(string: String) {
	print("The string \(string) has \(string.count) letters.")
}
countLettersInString(string: "Hello")

func countLettersInString(_ str: String) {
	print("The string \(str) has \(str.count) letters.")
}
countLettersInString("Hello")

func moveForward(piece: String, steps: Int) {
	print("Moving the \(piece) piece \(steps) steps forward...")
}
moveForward(piece: "Queen", steps: 3)

func isInWinter(month: String) -> Bool {
	if month == "Décembre" || month == "Janvier" || month == "Février" || month == "Mars" {
		return true
	}
	return false
}

isInWinter(month: "Janvier")

// --------------------------------
// -- Optionnels --
// --------------------------------

func getMoodStatus(weather: String) -> String? {
	if weather == "sunny" {
		return "😊"
	} else if weather == "rainy" {
		return "☹️"
	}
	return nil
}

var status = getMoodStatus(weather: "sunny")

print(status ?? "")

if status != nil {
	print(status!)
}

if let moodStatus = status {
	// unwrappedStatus contient une valeur non optionnelle !
	print(moodStatus)
} else {
	print("pas de status")
}

// --------------------------------
// -- Enumerations --
// --------------------------------

enum WeatherType {
	case sun, cloud, rain, wind, snow
}

func getMoodStatus(weather: WeatherType) -> String? {
	if weather == WeatherType.sun {
		return "😊"
	} else if weather == WeatherType.rain {
		return "☹️"
	}
	return nil
}

getMoodStatus(weather: WeatherType.sun)

func getMoodStatus(_ weather: WeatherType) -> String? {
	switch weather {
	case .sun:
		return "😊"
	case .cloud :
		return "🙁"
	case .rain:
		return "☹️"
	case .snow:
		return "🤩"
	case .wind:
		return "😑"
	}
}

// --------------------------------
// -- Structures (Structs) --
// --------------------------------

struct Vehicle {
	var wheels: Int
	var motor: Bool
	
	func describe() {
			print("Ce véhicule a \(wheels) roues...")
		}
}

let moto = Vehicle(wheels: 2, motor: true)
let car = Vehicle(wheels: 4, motor: true)

print(moto.wheels)
print(moto.motor)

// --------------------------------
// -- Classes --
// --------------------------------
//	pas d'initialiseur automatique d'instances
//	on peut définir une classe comme étant basée sur une autre classe
//	une instance d’une classe est appelée un objet : si on fait une copie, les deux copies pointent par défaut sur les mêmes données. Changer une change également la copie.

class Vvehicle {
	var wheels: Int
	var motor: Bool
	
	init(wheels: Int, motor: Bool) {
		self.wheels = wheels
		self.motor = motor
	}
	
	func describe() {
			print("Ce véhicule a \(wheels) roues...")
		}
}

// Héritage
class Character {
	public var name: String
	public var score: Int
	private var life: Int
	//Observer les propriétés
	var weapon: Weapon {
		willSet {
			print("I'm changing from \(weapon) to \(newValue)")
		}
		
		didSet {
			print("I just changed from \(oldValue) to \(weapon)")
		}
	}
	
	init(name: String, score: Int, life: Int, weapon: Weapon) {
		self.name = name
		self.score = score
		self.life = life
		self.weapon = weapon
	}
}

class Weapon {
	var points: Int
	var name: String
	
	init(points: Int, name: String) {
		self.points = points
		self.name = name
	}
	
	func attaque() {
		print("Prends \(points) en attaque")
	}
}

class Bow: Weapon {
	init() {
		super.init(points: 5, name: "Arc")
	}
}

class Sword: Weapon {
	var life: Int = 5
	
	init(points: Int, name: String, life: Int) {
		super.init(points: 10, name: "Epée")
		self.life = 5
	}
	
	override func attaque() {
		print("Prends \(points) en attaque et rends \(life) en points de vie")
	}
}

// --------------------------------
// -- Contrôle d'accès --
// --------------------------------

/* Permet de spécifier quelles données à l'intérieur des structures et des classes doivent être exposées.
Public : Tout le monde peut lire et écrire la propriété
Internal : seul votre code Swift peut lire et écrire la propriété. Si vous envoyez votre code en tant que framework pour que des autres utilisateurs l'utilisent, ils ne pourront pas lire la propriété
File Private : seul le code Swift du fichier contenant le type de données peut lire et écrire la propriété
Private : la propriété est disponible uniquement dans les méthodes appartenant au type de données ou à ses extensions
*/

// --------------------------------
// -- Closures --
// --------------------------------
class Server {}

func download(_ picture: String, from server: Server) -> String? {
	return nil
}

func loadPicture(from server: Server, completion: (String) -> Void, onFailure: () -> Void) {
	if let picture = download("photo.jpg", from: server) {
		completion(picture)
	} else {
		onFailure()
	}
}
let someServer = Server()
loadPicture(from: someServer) { picture in
	//someView.currentPicture = picture
} onFailure: {
	print("Couldn't download the next picture.")
}
