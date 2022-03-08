import UIKit

class Equipe {
	var nom: String
	var stade: String
	
	init(nom: String, stade: String) {
		self.nom = nom
		self.stade = stade
	}
}

class Score {
	var scoreA: Int
	var scoreB: Int
	
	init(scoreA: Int, scoreB: Int) {
		self.scoreA = scoreA
		self.scoreB = scoreB
	}
}

enum WeatherType {
	case sun, cloud, rain, snow, night
}

class Match {
	var equipeA: Equipe
	var equipeB: Equipe
	var score: Score
	var meteo: WeatherType
	var date: Date
	
	init(equipeA: Equipe, equipeB: Equipe, score: Score, meteo: WeatherType, date: Date) {
		self.equipeA = equipeA
		self.equipeB = equipeB
		self.score = score
		self.meteo = meteo
		self.date = date
	}
	
	func feuilleDeMatch() -> String {
		let dateFormatter = DateFormatter()
		dateFormatter.dateFormat = "dd/MM/YY"
		var texte = "Le \(dateFormatter.string(from: date)), "

		texte += "au sein du \(equipeA.stade), "
		
		switch meteo {
		case .cloud:
			texte += "sous un ciel nuageux, "
		case .rain:
			texte += "sous une pluie intense, "
		case .snow:
			texte += "sur une pelouse eneigée, "
		case .sun:
			texte += "avec un beau soleil, "
		case .night:
			texte += "sous un ciel clair, "
		}
		
		if score.scoreA > score.scoreB {
			texte += "\(equipeA.nom) s'est imposé \(score.scoreA) buts à \(score.scoreB) face au \(equipeB.nom)"
		} else {
			texte += "\(equipeA.nom) s'est incliné \(score.scoreA) buts à \(score.scoreB) face au \(equipeB.nom)"
		}
		
		return texte
	}
}







// Compte rendu d'une rencontre sportive
// Réfléchissez aux éléments d’information nécessaires à la rédaction, vous devez connaître diverses informations comme le nom des équipes, le score et la date du match.
// Choisissez un exemple et imaginez de quatre à six éléments d’information - ou variables - dont votre robot pourrait avoir besoin. Veillez à choisir différents types de variables. Certaines peuvent être des noms ou des adjectifs et d’autres, des nombres.
// Créez le squelette de l’article en rédigeant deux ou trois phrases comprenant les variables, que votre Bot remplacera par les valeurs correspondantes.

let equipeA = Equipe(nom: "Bordeaux", stade: "Matmut Atlantique")
let equipeB = Equipe(nom: "PSG", stade: "Parc des princes")
let score = Score(scoreA: 2, scoreB: 3)

let dateFormatter = DateFormatter()
dateFormatter.dateFormat = "dd/MM/YY"
let datematch1 = dateFormatter.date(from: "06/11/21")

let match1 = Match(equipeA: equipeA, equipeB: equipeB, score: score, meteo: .cloud, date: datematch1!)
print(match1.feuilleDeMatch())
