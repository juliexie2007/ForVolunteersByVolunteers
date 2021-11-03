//
//  Utils.swift
//  VolunteeringManager
//
//  Created by Julie Wei on 10/21/21.
//

import Foundation
import UIKit
import CoreData

var users:[Users]?
var opp_interested = Favorites()
var opps:[Favorites]?
var moment_list: [Moments] = []
var num_moment = 0
var bShowMomentDetail = false
var imagesArrayGlobal = [UIImage]()
var imagesArray = [UIImage]()
var momentImageDataArray = [MomentImages]()


var bCOVID = false
var bVirtual = false

var causes:[Causes]?
var skills:[Skills]?

var bFavoriteOriginal = false
var bFavoriteChanged = false


let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext

func fetchUser() {
    users?.removeAll()
    do {
        users = try context.fetch(Users.fetchRequest())
    }
    catch {
    }
}

func SaveUserSettings () {
    do {
        try context.save()
    }
    catch {
    }
}

func CreateANewOpp () -> Favorites {
    
    let newFavorite = Favorites(context: context)
    return newFavorite
}

func RemoveAnOpp (index: Int) {
    if index < opps!.count {
        let oppToRemove = opps![index]
        
        // Remove the Opp
        context.delete(oppToRemove)

        // Save the data
        do {
            try context.save()
        }
        catch {
        }
    }
}

func fetchFavorites() {
    do {

        let request = Favorites.fetchRequest() as NSFetchRequest<Favorites>

        // Set the filtering on the request
        let pred = NSPredicate(format: "favorated = %d", true)
        request.predicate = pred

        // Set sort on the request
        let sort = NSSortDescriptor(key: "opp_title", ascending: true)
        request.sortDescriptors = [sort]
        
        opps = try context.fetch(request)
    }
    catch {
        
    }
}

func fetchOpps() {
    opps?.removeAll()
    do {
        let request = Favorites.fetchRequest() as NSFetchRequest<Favorites>
/*
        // Set the filtering on the request
        let pred = NSPredicate(format: "opp_title CONTAINS %@", "doctor")
        request.predicate = pred
*/
        // Set sort on the request
        let sort = NSSortDescriptor(key: "opp_title", ascending: true)
        request.sortDescriptors = [sort]
        
        opps = try context.fetch(request)

    }
    catch {
        
    }
}

func fetchCausesAndSkillsData () {
    do {
        causes = try context.fetch(Causes.fetchRequest())
        skills = try context.fetch(Skills.fetchRequest())

    }
    catch {
        
    }
}

func SaveCauseData (cause: String) {
    let newCause = Causes(context: context)
    newCause.cause = cause
    do {
        try context.save()
    }
    catch {
        
    }
}
        
func SaveSkillData (skill: String) {
    let newSkill = Skills(context: context)
    newSkill.skill = skill
    do {
        try context.save()
    }
    catch {
        
    }
}

func SaveLog(log: String) {
    // TODO: Send the request to the Non-Profit

    // Create a new Log object
    let newLog = Log(context: context)
   
    newLog.activity = log
    newLog.dateTime = Date()
    newLog.opp_act = opp_interested
    
    // Save the data to DataCore
    do {
        try context.save()
    }
    catch {
        print("Faled to save log.")
    }
}

func fetchMoments() {
    moment_list.removeAll()
    do {
        let request = Moments.fetchRequest() as NSFetchRequest<Moments>
        
        // Set sort on the request
        let sort = NSSortDescriptor(key: "dateTime", ascending: false)
        request.sortDescriptors = [sort]

        moment_list = try context.fetch(request)
        
    }
    catch {

    }
}

func CreateANewPost() -> Moments {
    let newPost = Moments(context: context)
    return newPost
}

func CreateANewMomentImage() -> MomentImages {
    let imageData = MomentImages(context: context)
    return imageData
}

func CreateANewNewUser() -> Users {
    let user = Users(context: context)
    users?.append(user)
    return user
}

func RemoveCurrentUser() {
    // Remove the user
    let userRemove = users![0]
    context.delete(userRemove)

    // Save the data
    do {
        try context.save()
    }
    catch {
    }
    // Update the user list
    fetchUser()
}

/*func login(userName : String , password : String) -> (firsrName:String, lastName:String){

     var firstName = "";
     var lastName = "";
     var login = LoginQuery.Data.Login.init(email: userName, firstName: firstName, lastName: lastName)
    
     Network.shared.apollo.fetch(query: LoginQuery(userName:userName , password:password)) { result in
       switch result {
       case .success(let graphQLResult):
         print("Success! Result: \(graphQLResult)")
           firstName = graphQLResult.data?.login?.firstName ?? "Wrong name"
           lastName = graphQLResult.data?.login?.lastName ?? "Wrong name"
       case .failure(let error):
         print("Failure! Error: \(error)")
       }
     }

    return (firstName, lastName)
}*/


