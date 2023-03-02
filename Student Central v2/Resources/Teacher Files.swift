//
//  TeacherLists.swift
//  Student Central
//
//  Created by Ashwin Indurti on 2/10/23.
//

import Foundation
import FirebaseDatabase
import FirebaseDatabaseSwift

var teacherNames: [String] = []
var teacherEmails: [String] = []

func readTeacherValue() {
    Database.database().reference().child("teacherInfo").observeSingleEvent(of: .value, with: { (snapshot) in
        guard let values = snapshot.value as? [String: Any] else {
          return
        }

        for (key, value) in values {
                teacherNames.append(key as! String)
                teacherEmails.append(value as! String)
        }

        // print("Teacher Names:")
        // for i in teacherNames {
        //   print(i)
        // }
        // print("Teacher Emails:")
        // for i in teacherEmails {
        //   print(i)
        // }
    })
}
