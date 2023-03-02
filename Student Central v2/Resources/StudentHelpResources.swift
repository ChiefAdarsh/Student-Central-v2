//
//  resALl.swift
//  funn
//
//  Created by Rushil Patel on 2/7/23.
//

import Foundation
import FirebaseDatabase
import FirebaseDatabaseSwift

var yourArray: [Resource] = [Resource]()
let ref = Database.database().reference()

func readResourcesValue() {
    Database.database().reference().child("studentHelpResources").observeSingleEvent(of: .value, with: { (snapshot) in
        guard let values = snapshot.value as? [String: Any] else {
          return
        }

        for (key, value) in values {
                let resource = value as! [String: Any]
                let name = resource["name"] as! String
                let category = resource["category"] as! String
                let contact = resource["contact"] as? String ?? ""
                let address = resource["address"] as? String ?? ""
                let city = resource["city"] as? String ?? ""
                let state = resource["state"] as? String ?? ""
                let zip = resource["zip"] as? String ?? ""
                let website = resource["website"] as? String ?? ""
                let addInfo = resource["addInfo"] as! String

                yourArray.append(Resource(category: category, name: name, contact: contact, address: address, city: city, state: state, zip: zip, website: website, addInfo: addInfo))
        }

        // for i in yourArray {
        //   print(i.name)
        //   print(i.category)
        //   print(i.contact)
        //   print(i.address)
        //   print(i.city)
        //   print(i.state)
        //   print(i.zip)
        //   print(i.website)
        //   print(i.addInfo)
        //   print("\n")
        // }
    })
}

