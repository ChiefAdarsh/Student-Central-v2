import pyrebase
import json

firebaseConfig = {

  "apiKey": "AIzaSyAam8hl8W63K4G3-dtdm1qkRTfYh_l5wAY",

  "authDomain": "student-central-resources.firebaseapp.com",

  "databaseURL": "https://student-central-resources-default-rtdb.firebaseio.com",

  "projectId": "student-central-resources",

  "storageBucket": "student-central-resources.appspot.com",

  "messagingSenderId": "569705984552",

  "appId": "1:569705984552:web:32a9625fb0b56aadcc7b1d",

  "measurementId": "G-3G3MCS6Q2D"

}

data = {
    "studentHelpResources" : {
        "Child Protective Services" : {
            "category" : "Crisis Lines",
            "contact" : "1-800-252-5400",
            "address" : "",
            "city" : "",
            "state" : "",
            "zip" : "",
            "website" : "",
            "addInfo" : "-Texas law says anyone who thinks a child, or person 65 years or older, or an adult with disabilities is being abused, neglected, or exploited must report it to DFPS.\n-A person who reports abuse in good faith is immune from civil or criminal liability."
        },
    },
    "teacherInfo" : {
        "Craig Able" : "cable@coppellisd.com",
    }
}

firebase = pyrebase.initialize_app(firebaseConfig)

db = firebase.database()

db.child("data").set(data)
db.set(data)
