import pyrebase
import json
import re

""" Data Collection """

read_file = open("StudentHelpResources.swift", "r")

dictionary = {}

k = 1
for line in read_file:
    if "Resource" in line:
        strings = line[(line.index("(") + 1):].split("\", ")
        arr = {}
        name = "Resource " + str(k)
        k += 1
        for i in strings:
            i += "\""
            if i.startswith("addInfo"):
                i = i[:len(i)-4]
            arr[i[:i.index(":")]] = i[(i.index(":")):][3:len(i[(i.index(":")):])-1]
        dictionary[name] = arr
        
def num_sort(str):
    print("num:", int(str[(str.index(" ")+1):]))
    return int(str[(str.index(" ")+1):])
    
myKeys = list(dictionary.keys())
myKeys.sort(key = num_sort)
print(myKeys)
sorted_dict = {}
for i in myKeys:
    print(i)
    print(dictionary[i])
    sorted_dict[i] = dictionary[i]
print(json.dumps(sorted_dict, indent=4))
        
teacherNames = ["Craig Able", "Holly Anderson", "Matthew Anderson", "Raneta Ansley", "Ed Arndt", "Angela Baloch", "Pradipta Bandopadhyay", "Colleen Baranowski", "Angela Barnes", "Brandon Barnes", "Blaine Barnett", "Ronald Baxter", "David Bearden", "Bianca Benitez", "Gary Beyer", "Priya Bharath", "Hemlata Bhatt", "Babita Bhutani", "Connor Blake", "Bill Borowski", "Matthew Bowden", "Luke Bray", "Michael Brock", "Nicholas Brown", "Alec Bui", "Chase Cairns", "Yvette Carson", "Kendra Carter", "Shauna Carter", "Kevin Casey", "Sumita Chakraborty", "Richard Chamberlain", "Joshua Chanin", "Erika Chavez", "Rachel Chesney", "Bona Coogle", "Hannah Corley", "Aaron Coronado", "Annabelle Covey", "Courtney Crosby", "Rhonda Currey", "Laura Davis", "Diane deWaal", "Nathalie Deines", "Jodie Deinhammer", "Dana Deloach", "Jeremy Dettmer", "Stephanie Dixon", "Tim Dixon", "Michael Egan", "Gene Eitelman", "Michael Erickson", "Farzin Farzad", "Courtney Ferrell", "Michael Finnegan", "Mimi Fleming", "Edith Flores", "Doug Fowler", "Brennan Fruge", "Kristen Gallia", "Grant Garner", "Karen Gates", "Dan Gillette", "Esther Gomez-Splawn", "Zachary Gonzalez", "Robbert Gribble", "Connie Griffith", "Jenna Grinnan", "Trace Grisso", "Cassandra Harmon", "William Harrington", "Sarah Harris", "Lyndsey Hartfelder", "Michelle Hauske", "Grace Hellyer", "Joshua Henderson", "Tracy Henson", "Alexander Holmes", "Emily Holmes", "Irene Hudson", "Shawn Hudson", "Bunny Hughes-Hymer", "Laura Hynson", "Alexis Irons", "Valerie Jade de Rios", "Benjamin Jandro", "Lowell Johnson", "Christy Joseph Anthony", "Ashlyn Judd", "Linda Jurca", "Leigh Kaifes", "Hema Kalyanaraman", "Kathleen Kamphaus", "Kyle Kelson", "Don Kemp", "Mashal Khan", "Joshua Kinman", "Keenan Kitchens", "Kyle Kohler", "Karie Kosh", "Katherine Krug", "Maxx Lazos", "Irma Lazos-Kennedy", "Kimberly Lee", "Kristia Leyendecker", "Maxine Lisot", "Regina Liu", "Roxanne Long", "Jeanna Lovett", "Chip Lowery", "Melisa Macmillan", "Eligio Mares", "Jeyanthini Maria", "Michael McCabe", "Brandon McGill", "Stacy McLeroy", "Nestor Mercado-Garcia", "Bryan Mercer", "Gulshan Mir", "Hayley Mitchell", "Riaz Mohammed", "Linda Moore", "Carmen Morales", "Stephen Morris", "Cole Moulder", "Ashley Mulford", "Catherine Murphy", "Ryan Murphy", "Tony Newsome", "Randall Nguyen", "Allen Oh", "Richard Orlopp", "Terry Osborne", "Samantha Ost", "Rosa Otiz", "Aicha Ouedraogo", "Katie Palma", "Melissa Pancoast", "Marianne Paredes", "Stephen Patino", "Delosha Payne", "Kim Pearce", "Kit Pehl", "Devin Perk", "Emily Pickrell", "Andrea Pirtle", "Ray Pool", "Courtney Pope", "Miranda Portteus", "Tom Portteus", "David Poskey", "Lauren Rasca", "Ramiro Rodriguez", "Rebecca Rosamond-Grammer", "Dani Roseberry", "Robyn Ross", "David Roulston", "Matthew Rummel", "Scott Rutherford", "Laura Salamone", "Shannon Samberson", "Clint Schnell", "Lindsay Schultz", "Steven Seeley", "Nick Shaw", "Susan Sheppard", "Kimberly Shuttlesworth", "SunHee Simon", "Brian Simpson", "Laurie Slack", "Stephanie Sloane", "Brandon Slovak", "Anthony Smith", "Devin Smith", "Philip Smith", "Sean Smith", "Ernesto Soriano-Rodriguez", "Stephanie Spaete", "Rosie Speanburg", "Kaninikaa Srivats", "Jared Stansel", "Bruce Stewart", "Justin Stewart", "Paul Stolar", "Julie Stralow", "Chris Stricker", "Benjamin Stroud", "Lisa Stucker", "Judy Suarez", "Jason Sykes", "Rosemary Tarleton", "Brian Terrell", "Ravyn Terry", "Willis Tran", "Hanna Treece", "Melissa Urick", "Ian VanderSchee", "Andrea Voelker", "Linda Wagner", "Gabe Walker", "John Watkins", "Caroline Webb", "Kai Weismann", "Antonio Wiley", "Sarah Williams", "Mary Wilt", "Ted Witulski", "Chase Wofford", "Landon Wren", "Michael Yakubovsky", "Ming Yang", "Madison Younger", "Shannon Zerby"]


teacherEmails = ["cable@coppellisd.com", "handerson@coppellisd.com", "manderson@coppellisd.com", "ransley@coppellisd.com", "earndt@coppellisd.com", "abaloch@coppellisd.com", "pbandopadhyay@coppellisd.com", "cbaranowski@coppellisd.com", "abarnes@coppellisd.com", "bbarnes@coppellisd.com", "bbarnett@coppellisd.com", "rbaxter@coppellisd.com", "dbearden@coppellisd.com", "bbenitez@coppellisd.com", "gbeyer@coppellisd.com", "pbharath@coppellisd.com", "hbhatt@coppellisd.com", "bbhutani@coppellisd.com", "cblake@coppellisd.com", "bborowski@coppellisd.com", "mbowden@coppellisd.com", "lbray@coppellisd.com", "mbrock@coppellisd.com", "nbrown@coppellisd.com", "anguyenbui@coppellisd.com", "ccairns@coppellisd.com", "ycarson@coppellisd.com", "kcarter@coppellisd.com", "sbcarter@coppellisd.com", "kcasey@coppellisd.com", "schakraborty@coppellisd.com", "rchamberlain@coppellisd.com", "jchanin@coppellisd.com", "ebeal@coppellisd.com", "rchesney@coppellisd.com", "bcoogle@coppellisd.com","hcorley@coppellisd.com",
                     "acoronado@coppellisd.com",
                     "acovey@coppellisd.com",
                     "ccrosby@coppellisd.com",
                     "rcurrey@coppellisd.com",
                     "ldavis@coppellisd.com",
                     "ddewaal@coppellisd.com",
                     "ndeines@coppellisd.com",
                     "jdeinhammer@coppellisd.com",
                     "ddeloach@coppellisd.com",
                     "jdettmer@coppellisd.com",
                     "sdixon@coppellisd.com",
                     "tdixon@coppellisd.com",
                     "megan@coppellisd.com",
                     "geitelman@coppellisd.com",
                     "merickson@coppellisd.com",
                     "ffarzad@coppellisd.com",
                     "cferrell@coppellisd.com",
                     "mfinnegan@coppellisd.com",
                     "mfleming@coppellisd.com",
                     "eflores@coppellisd.com",
                     "dfowler@coppellisd.com",
                     "Bfruge@coppellisd.com",
                     "kgallia@coppellisd.com",
                     "ggraner@coppellisd.com",
                     "kgates@coppellisd.com",
                     "dgillette@coppellisd.com",
                     "egomezsplawn@coppellisd.com",
                     "zgonzalez@coppellisd.com",
                     "rgribble@coppellisd.com",
                     "cgriffith@coppellisd.com",
                     "jgrinnan@coppellisd.com",
                     "tagrisso@coppellisd.com",
                     "charmon@coppellisd.com",
                     "wharrington@coppellisd.com",
                     "sharris@coppellisd.com",
                     "lhartfelder@coppellisd.com",
                     "mhauske@coppellisd.com",
                     "ghellyer@coppellisd.com",
                     "jhenderson@coppellisd.com",
                     "thenson@coppellisd.com",
                     "aholmes@coppellisd.com",
                     "eholmes@coppellisd.com",
                     "ihudson@coppellisd.com",
                     "shudson@coppellisd.com",
                     "bhugheshymer@coppellisd.com",
                     "lhynson@coppellisd.com",
                     "airons@coppellisd.com",
                     "vjadederios@coppellisd.com",
                     "bjandro@coppellisd.com",
                     "ljohnson@coppellisd.com",
                     "cjosephanthony@coppellisd.com","ajudd@coppellisd.com",
                     "ljurca@coppellisd.com",
                     "lkaifes@coppellisd.com",
                     "hkalayanaraman@coppellisd.com",
                     "kkamphaus@coppellisd.com",
                     "kkelson@coppellisd.com",
                     "dkemp@coppellisd.com",
                     "mkhan@coppellisd.com",
                     "jkinman@coppellisd.com",
                     "kkitchens@coppellisd.com",
                     "kkohler@coppellisd.com",
                     "kkosh@coppellisd.com",
                     "kkrug@coppellisd.com",
                     "mlazos@coppellisd.com",
                     "ikennedy@coppellisd.com",
                     "klee@coppellisd.com",
                     "kleyendecker@coppellisd.com",
                     "mlisot@coppellisd.com",
                     "rliu@coppellisd.com",
                     "rlong@coppellisd.com",
                     "jlovett@coppellisd.com",
                     "clowery@coppellisd.com",
                     "mmacmillan@coppellisd.com",
                     "emares@coppellisd.com",
                     "jmaria@coppellisd.com",
                     "mmccabe@coppellisd.com",
                     "bmcgill@coppellisd.com",
                     "smcleroy@coppellisd.com",
                     "nmercadogarcia@coppellisd.com",
                     "bmercer@coppellisd.com",
                     "gmir@coppellisd.com",
                     "hmitchell@coppellisd.com",
                     "rmohammed@coppellisd.com",
                     "lmoore@coppellisd.com",
                     "cmorales@coppellisd.com",
                     "smorris@coppellisd.com",
                     "cmoulder@coppellisd.com",
                     "amulford@coppellisd.com",
                     "cmurphy@coppellisd.com",
                     "rmurphy@coppellisd.com",
                     "tnewsome@coppellisd.com",
                     "rnguyen@coppellisd.com",
                     "aoh@coppellisd.com",
                     "rorlopp@coppellisd.com",
                     "tosborne@coppellisd.com",
                     "sost@coppellisd.com",
                     "rortiz@coppellisd.com",
                     "aouedraogo@coppellisd.com",
                     "kpalma@coppellisd.com",
                     "mpancoast@coppellisd.com",
                     "mparades@coppellisd.com",
                     "spatino@coppellisd.com",
                     "dpayne@coppellisd.com",
                     "kpearce@coppellisd.com",
                     "kpehl@coppellisd.com",
                     "mperk@coppellisd.com",
                     "epickrell@coppellisd.com","apirtle@coppellisd.com",
                     "rpool@coppellisd.com",
                     "cpope@coppellisd.com",
                     "mportteus@coppellisd.com",
                     "tportteus@coppellisd.com",
                     "dposkey@coppellisd.com",
                     "lrasca@coppellisd.com",
                     "rrodriguez@coppellisd.com",
                     "rrosamondgrammer@coppellisd.com",
                     "droseberry@coppellisd.com",
                     "rross@coppellisd.com",
                     "droulston@coppellisd.com",
                     "mrummel@coppellisd.com",
                     "srutherford@coppellisd.com",
                     "lsalamone@coppellisd.com",
                     "ssamberson@coppellisd.com",
                     "cschnell@coppellisd.com",
                     "lschultz@coppellisd.com",
                     "sseeley@coppellisd.com",
                     "nshaw@coppellisd.com",
                     "ssheppard@coppellisd.com",
                     "kshuttlesworth@coppellisd.com",
                     "ssimon@coppellisd.com",
                     "bsimpson@coppellisd.com",
                     "lslack@coppellisd.com",
                     "ssloane@coppellisd.com",
                     "bslovak@coppellisd.com",
                     "asmith@coppellisd.com",
                     "dsmith@coppellisd.com",
                     "psmith@coppellisd.com",
                     "ssmith@coppellisd.com",
                     "esorianorodriguez@coppellisd.com",
                     "sspaete@coppellisd.com",
                     "rspeanburg@coppellisd.com",
                     "ksrivats@coppellisd.com",
                     "jstansel@coppellisd.com",
                     "bstewart@coppellisd.com",
                     "jstewart@coppellisd.com",
                     "pstolar@coppellisd.com",
                     "jstralow@coppellisd.com",
                     "cstricker@coppellisd.com",
                     "bstroud@coppellisd.com",
                     "lstucker@coppellisd.com",
                     "jsuarez@coppellisd.com",
                     "jsykes@coppellisd.com",
                     "rtareton@coppellisd.com",
                     "bterrell@coppellisd.com",
                     "rterry@coppellisd.com",
                     "wtran@coppellisd.com",
                     "htreece@coppellisd.com",
                     "murick@coppellisd.com",
                     "ivanderschee@coppellisd.com",
                     "avoelker@coppellisd.com", "lwagner@coppellisd.com",
                     "gwalker@coppellisd.com",
                     "jwatkins@coppellisd.com",
                     "cwebb@coppellisd.com",
                     "kweismann@coppellisd.com",
                     "awiley@coppellisd.com",
                     "sewilliams@coppellisd.com",
                     "mwilt@coppellisd.com",
                     "twitulski@coppellisd.com",
                     "cwofford@coppellisd.com",
                     "lwren@coppellisd.com",
                     "myakubovsky@coppellisd.com",
                     "myang@coppellisd.com",
                     "myounger@coppellisd.com",
                     "szerby@coppellisd.com"]

teacherInfo = {}
for i in range(len(teacherNames)):
    teacherInfo[teacherNames[i]] = teacherEmails[i]

""" Firebase """

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
    "studentHelpResources" : sorted_dict,
    "teacherInfo" : teacherInfo
}

firebase = pyrebase.initialize_app(firebaseConfig)

db = firebase.database()

db.child("data").set(data)
db.set(data)