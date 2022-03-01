import UIKit

// -------------------//
// MARK: -Exercice 1:
// -------------------//
// Ecrire une fonction qui prend en entrée le nom de l'utilisateur, son age et renvoie une string : "bienvenue ..." si la personne est majeure et nil si la personne est mineure.

/* TODO: Ecrire la fonction getWelcomeMessage(name: String, age: Int) */
//print(getWelcomeMessage(name: "Julie", age: 32)!)


// -------------------//
// MARK: -Exercice 2:
// -------------------//
// Calculatrice simple : +, -, *, /

/* TODO: Ecrire la fonction calcul(first: Int, second: Int, calcOperator: Operator) -> Int? */
//print(calcul(first: 10, second: 20, calcOperator: .addition) ?? "ERR")
//print(calcul(first: 8, second: 0, calcOperator: .division) ?? "ERR")


// -------------------//
// MARK: -Exercice 3:
// -------------------//
// La suite de Fibonacci est une suite de nombre dans laquelle on additionne les deux précédents chiffres/nombre pour déterminer le chiffre/nombre suivant. En partant de 1, pour n (nombre d'itérations) = 7, on obtient 0+1=1, puis 1+1=2, puis 1+2=3, puis 2+3=5, puis 3+5=8, puis 5+8=13, puis 8+13=21

/* TODO: Ecrire la fonction fibonacciSequence(n: Int, first: Int, second: Int) */
//fibonacciSequence(n: 8, first: 0, second: 1)


// -------------------//
// MARK: -Exercice 4:
// -------------------//
// Ecrire une fonction Minuteur, qui prend en paramètre le temps à décompter, et affiche chaque seconde le temps restant

/* TODO: Ecrire la fonction startMinuteur(timeToCount: Int) */
//startMinuteur(timeToCount: 5)

/* MARK: --HELPER: Doc methode scheduledTimer :
 Summary
 Creates a timer and schedules it on the current run loop in the default mode.
 Declaration

 class func scheduledTimer(withTimeInterval interval: TimeInterval, repeats: Bool, block: @escaping (Timer) -> Void) -> Timer
 Discussion

 After interval seconds have elapsed, the timer fires, executing block.
 Parameters

 interval
 The number of seconds between firings of the timer. If interval is less than or equal to 0.0, this method chooses the nonnegative value of 0.0001 seconds instead.
 repeats
 If true, the timer will repeatedly reschedule itself until invalidated. If false, the timer will be invalidated after it fires.
 block
 A block to be executed when the timer fires.
 The block takes a single NSTimer parameter and has no return value.
 Returns

 A new NSTimer object, configured according to the specified parameters.
 */


// -------------------//
// MARK: -Exercice 5:
// -------------------//
// Ecrire une fonction affichant la liste des cours pour un jour, en passant en paramètre le jour de la semaine. (Pour simplifier, on se basera sur les cours pour une semaine donnée uniquement)

/* TODO: Ecrire la fonction afficherCours(jour: Day) */
//afficherCours(jour: .thusday)
