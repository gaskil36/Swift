
func greetings(){
	print("Hello!")
}

greetings() 




func greetings(name: String){
	print("Hello \(name)!")
}

greetings(name: "Jake")




func greetings(to name: String){

	print("Hi \(name)!")
}

greetings(to: "Jake")



////Suppressing the argument label using the wildcard (_) operator
//func greetings(_ name: String){
//	print("Hey \(name)!")
//}
//
//greetings("Jake") //Now there is no need to label the parameter, but it has an internal name

/*Notice that each of the three definitions above use the same name, same number and type of parameters but a different method of naming the parameter/calling the function.  This is an example of "function overloading", when many functions have the same name but different order, number, or type (all three together are called "arity") of parameters.*/

//there is no way to overload the greetings functions using the name parameter again

////Example of providing default values for parameter arguments
//func sayHello(to name: String = "Jake" ){
//	print("Hello \(name)")
//}
//
//sayHello(to: "Bill")
//sayHello()




////**********Returning from a Function************/

func sayHello(_ name: String) -> String{
	return "Hello \(name)"
}

print(sayHello("Bill") + "... We meet again." )




////**********INOUT Parameters**********/
////Inout parameters are essentially equivalent to pointers in C/C++
//func sayHello(to name: String, in lang: String,  greeting: inout String){
//	switch lang.lowercased() {
//	case "english":  greeting = "Hello \(name)"
//	case "french": greeting = "Bonjour \(name)"
//	case "spanish": greeting = "Hola \(name)"
//	case let unknownLang:
//		greeting = "I dont know \(unknownLang)"
//	}
//}
//var phrase = ""
//sayHello(to: "Jake", in: "Spanish", greeting: &phrase)
//print(phrase)




func nestedGreeting(to name: String, using: String) -> String{
	var greeting: String

	switch using.lowercased() {
	case "english":  greeting = "Hello"
	case "french": greeting = "Bonjour"
	case "spanish": greeting = "Hola"
	case let unknownLang:
		greeting = "I dont know \(unknownLang)"
	}
//	//greet can "capture" the initial value of greeting
	func greet()-> String{
		greeting += ", \(name)!"
		return greeting
	}

	return greet()
}
print(nestedGreeting(to: "Jake", using: "french"))





////******Named Tuples in Functions********/
////Returning a named Tuple
func stats(for series: Int...)->(avg: Double?, total: Int){
	var total = 0
	var avg: Double? = 0.0
	
	for each in series{
		total+=each
	}
	guard series.count > 1 else{
		return (nil, total)
	}
	avg = Double(total)/Double(series.count)
	return (avg, total)
}


var statistics = stats(for: 1, 3, 5, 7, 9)

////Accepting a Named Tuple as parameter
//func printResults(for tuple:(avg: Double?,total: Int)){
//	print("Total: \(tuple.total)")
//	//optional Binding with guard let/early exit
//	guard let average = tuple.avg else{
//		//if the tuple.avg is nil then this will print
//		print("No average value")
//			return
//		}
//	print ("AVG : \(average)")
//}
//print("Tuple 1")
//printResults(for: statistics)
//
//var exampleStats = stats(for: 4)
//print()
//print("Tuple 2")
//printResults(for: exampleStats)


////******Functions As Types**********
////Because functions have a Type, that means we can assign them to variables of that Type
//func sayHello(_ name: String) -> String{
//	return "Hello \(name)"
//}
//
//func sayHelloAgain(_ name: String)  -> String{
//	return "Hello Again, \(name)"
//}
//var greeter : (String) -> String
////This "points" the greeter reference to the sayHello function
//greeter = sayHello
//print(greeter("Steve"))
//
////This "points" the greeter reference to the sayHelloAgain function
//greeter = sayHelloAgain
//print(greeter("Steven"))
