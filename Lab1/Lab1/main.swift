//Step 1: Declare Variables for Personal Information

var firstName: String = "Dinara"
var lastName: String = "Almenebtova"
var age: Int = 20
var birthYear: Int = 2005
var isStudent: Bool = true
var height: Double = 1.62

//Bonus
let currentYear: Int = 2025
var tage: Int = currentYear - birthYear

//Step 2: Create Variables for Your Hobbies and Interests

var hobby: String = "Fitness🧘🏻‍♀️"
var numberOfHobbies: Int = 3
var favoriteFood: String = "Chicken and cottage cheese"
var isHobbyCreative: Bool = false
var favoriteSeason: String = "Spring"
var favoriteColor: String = "Navy blu $ White"
var favoriteMovie: String = " '1+1' "
var favoriteSound: String = "Whale sound🐋🎶"
var hasPet: Bool = true

//Bonus: Futer goals
var futerGoal: String = "In the future,I want to become a successful iOS developer📱,build my own projects🚀,I want to live gracefully🍀,travel by the sea🌊"

//Step 3:Create a Summary of Your Life Story
let studentStatus = isStudent ? "I'm currently a student" : "I'm not currently a student"
let hobbyType = isHobbyCreative ? "a creative hobby" : "not a creative hobby"
let petStatus = hasPet ? "I have a pet" : "I don't have a pet"

let lifeStory: String = """
My name is \(firstName) \(lastName). I am \(age) years old,born in \(birthYear). \(studentStatus). I enjoy \(hobby), which is \(hobbyType). I have \(numberOfHobbies) hobbies in total. My favorite food is \(favoriteFood), my favorite color is \(favoriteColor), and my favorite season is \(favoriteSeason). My favorite movie is \(favoriteMovie). My favorite sound is \(favoriteSound). \(petStatus).
\(futerGoal).
"""

//Step 4:Print Your Life Story
print(lifeStory)
