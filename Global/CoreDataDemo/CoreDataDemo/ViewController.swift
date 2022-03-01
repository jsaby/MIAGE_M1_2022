//
//  ViewController.swift
//  CoreDataDemo
//
//  Created by Julie Saby on 01/12/2021.
//

import UIKit
import CoreData

class ViewController: UIViewController {

	override func viewDidLoad() {
		super.viewDidLoad()
		
		//CoreData
		getAllDatas()
//		saveData()
	}
	
	func saveDatas(questions: [Question]) {
		guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
			return
		  }
		
		let managedContext = appDelegate.persistentContainer.viewContext
		  
		let questionEntity = NSEntityDescription.entity(forEntityName: "QuestionEntity", in: managedContext)!
		
		questions.forEach { question in
		
			let recordQuestion = NSManagedObject(entity: questionEntity, insertInto: managedContext)
			
			recordQuestion.setValue(question.name, forKey: "name")
			recordQuestion.setValue(question.answerA, forKey: "answerA")
			recordQuestion.setValue(question.answerB, forKey: "answerB")
			recordQuestion.setValue(question.validAnswer, forKey: "validAnswer")
			
			do {
				try managedContext.save()
			}
			catch {
				// Handle Error
			}
		}
	}
	
	func saveData() {
		guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
			return
		  }
		
		let managedContext = appDelegate.persistentContainer.viewContext
		  
		let question = NSEntityDescription.entity(forEntityName: "QuestionEntity", in: managedContext)!
		let recordQuestion = NSManagedObject(entity: question, insertInto: managedContext)
			  
		recordQuestion.setValue("Ma question", forKey: "name")
		recordQuestion.setValue("Réponse A", forKey: "answerA")
		recordQuestion.setValue("Réponse B", forKey: "answerB")
		recordQuestion.setValue("Réponse A", forKey: "validAnswer")

		// To save the new entity to the persistent store, call
		// save on the context
		do {
			try managedContext.save()
		}
		catch {
			// Handle Error
		}
	}
	
	func getAllDatas() {
		
		guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
			return
		  }
		
		let managedContext = appDelegate.persistentContainer.viewContext
		
		let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "QuestionEntity")
				
		do {
			 let results = try managedContext.fetch(fetchRequest)
			 let questions = results as! [Question]

		} catch let error as NSError {
		  print("Could not fetch \(error)")
		}
	}


}

class Question {
	var name: String!
	var answerA: String!
	var answerB: String!
	var validAnswer: String!
}

