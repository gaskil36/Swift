import UIKit

////******Traditional Array processing (imperative)******/
//var fibonacci = [0, 1, 1, 2, 3, 5, 8, 13, 21, 34]
//var fibSquared: [Int] = []
//for each in fibonacci{
//	fibSquared.append(each * each)
//}
//print (fibSquared)
////******************************************
///
////******Functional Array processing ******/
var fibonacci = [0, 1, 1, 2, 3, 5, 8, 13, 21, 34]
//passing a closure (anonymous function) to another function to produce a result
print(fibonacci.map( {(fib: Int)-> Int in
	return fib * fib
}))
////Simple Int to String mapping
//var strings = fibonacci.map { (_ num: Int) -> String in
//	return String(num)
//}
//print(strings)
////****************************


////**********Closures with Type Inference**********/
//Sorting in reverse order. Make sure only ONE declaration of fibonacci (above) is uncommented
//print(fibonacci.sorted(by:{ i, j in j < i}))
//the closure infers to be of type Int, because the Array is Type [Int]
////****************************

////**********Closures with Positional Parameters**************/
//var res = 0
//reduce takes two arguements: a variable to hold the result and
//a closure that accepts the Result and the next Element in the sequence.
//reduce is meant to *reduce* a series of elements to a single element.
//Here we are getting the total of the series
//$0 refers to res
//$1 refers to the element being passed
//print(fibonacci.reduce(res, {
//	 $0+$1
//}))

/************Trailing Closure Syntax************/
//because the closure is the only parameter to map, when we remove it
//from the parens, there is nothing left.
//So we can remove the parens and parameter labels too
//print(fibonacci.map{ String($0) })
//print(fibonacci.sorted{ $1 < $0} )
//


////******MULTI-THREADING********
//var fibonacci = [0, 1, 1, 2, 3, 5, 8, 13, 21, 34]
//var range = 1001...10000
////
////The DispatchQueue Class provides an interface for communicating with Swift's Thread Dispatcher
////Remember that the main thread is the one where the program begins.
////DispatchQueue.main.async will allow you to add a function to END of the main thread.
////Basically, after everything else in this file executes.
////This is generally inadvisable unless you actually do want to wait.
//
////DispatchQueue.global().async method accepts the closure that returns Void (Nothing, no return).
////Note that the call to map (and the closure passed to that function) are all part of the closure passed to async
//
////Then it will create a new background thread using the closure that is passed to it.
////This thread can then execute in parallel to the (Int)-> String mapping below (which happens on the main thread)
//DispatchQueue.global().async {
//	print("Starting Background Thread")
//
//	let squares = fibonacci.map{(_ fib: Int)-> Int in
//		return fib * fib
//	}
//	print(squares)
//}
////Because the fibonacci array is so small, the background thread actually starts and ends before the mapping on the main thread completes.
////But if you substitute "fibonacci" for "range" (Defined above as 1001 to 10000) you will see the String array print first
//print("Running on Main Thread")
////Simple Int to String mapping
//var strings = fibonacci.map { (_ num: Int) -> String in
//	return String(num)
//}
//print(strings)
//************************************/
