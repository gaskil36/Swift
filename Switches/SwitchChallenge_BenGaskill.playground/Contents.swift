import UIKit

var str = "Hello, playground"

/****Swift Switching Challenges******/

/*Problem 1:
        Write a switch statement for Characters that determines whether given
character is a vowel (for the purposes of this assignment "y" is considered a
vowel), consonant, or number.  Write the switch in the most efficient way you
can, using Swifty mechanisms like compound cases or ranges, if appropriate.

Note that the character MAY not be a letter or Number, so if it is neither,
print "Unrecognized Character".

Demonstrate that your switch works on an actual Character.  *NOTE*: Characters
in Swift are defined with " not ', so:
    
            var x = "x" //This is the Character "x"
*/

let character = "y"

switch character.lowercased() {
case "a", "e", "i", "o", "u", "y":
    print("The given character is a vowel")
case "a"..."z":
    print("The given character is a consonant")
case "0"..."9":
    print("The given character is a number")
default: print("Unrecognized Character")
}

/*Problem 2:
        Write a switch statement for Integers that determines whether a given
number is positive, negative, or 0. Write the switch in the most efficient way
you can, using Swifty mechanisms like compound cases or ranges, if
appropriate.

Demonstrate that your switch works on an actual Integer.
*/

let num = -256

switch num {
case 0:
    print("The provided number is 0")
case 1...:
    print("The provided number is positive")
case ...0:
    print("The provided number is negative")
default:
    print("Invalid entry")
}

/*Problem 3:

Write a switch statement for (String, Int) Tuples that represent a person's
name and age.  The switch will bind to the name, and have cases for ages under
18 (juvenile), 18-55 (adult), and over 55 (senior). Each case should print the
person's name & a message that identifies which group they're in.

HINT: You'll need the range operators for this one.

Demonstrate that your switch works on an actual Tuple value
*/

var person: (String, Int) = ("Ben Gaskill", 55)

switch person {
case (let name, 0...17):
    print("\(name) is a juvenile")
case (let name, 18...55):
    print("\(name) is a adult")
case (let name, 55...):
    print("\(name) is a senior")
default:
    print("Well how did this happen? Check your inputs again.")
}

/*Problem 4:

Write a switch statement for (String, Double) Tuples that represent a person's
name and bank account $ value.  Each case should print a message, using the name
that describes their account.  If the account == 0, print a message telling them
to make a deposit.  If the account is < 0, print the same message AND a message
telling them that the account is overdrawn.  If it is > 0, then print nice greeting
and the balance.

HINT: Ranges will NOT work with doubles, so you need to use value binding and where statements here.

Demonstrate that your switch works on an actual Tuple value

*/

var bankCustomer: (String, Double) = ("Ben Gaskill", 562.53)

switch bankCustomer {
case (let name, let balance) where balance == 0:
    print("\(name), please make a deposit")
case (let name, let balance) where balance < 0:
    print("\(name), please make a deposit. Your account is overdrawn")
case (let name, let balance) where balance > 0:
    print("\(name), hello there! Your current balance is $\(balance)")
default:
    print("Well how did this happen? Check your inputs again.")
}

/*Problem 5:

Write a switch statement for (Int, Int) tuples that will determine and print
their Quadrant on a Coordinate Plane (numbered starting in the upper right,
and going counter clockwise):
          y
        2 | 1
      x -----
        3 | 4

NOTE: Tuples may have coordinates with like (0, 0) or (105, 0) which indicates
a point on the origin or one of axes.  In this scenario, bind to the values,
print them and a message explaining which axis or origin they are on.

Demonstrate that your switch works on an actual Tuple value

*/

var point: (Int, Int) = (20,-35)

switch point {
case (let x, let y) where x == 0 && y == 0:
    print("(\(x),\(y)) is on the origin")
case (let x, let y) where y == 0:
    print("(\(x),\(y)) is on the x-axis")
case (let x, let y) where x == 0:
    print("(\(x),\(y)) is on the y-axis")
case (let x, let y) where x > 0 && y > 0:
    print("(\(x),\(y)) is in Quadrant 1")
case (let x, let y) where x < 0 && y > 0:
    print("(\(x),\(y)) is in Quadrant 2")
case (let x, let y) where x < 0 && y < 0:
    print("(\(x),\(y)) is in Quadrant 3")
case (let x, let y) where x > 0 && y < 0:
    print("(\(x),\(y)) is in Quadrant 4")
default:
    print("Well how did this happen? Check your inputs again.")
}
