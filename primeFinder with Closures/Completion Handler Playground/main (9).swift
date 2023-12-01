//
//  main.swift
//  CompletionHandler
//
//  Created by Jacob Levy on 8/30/21.
//  Copyright © 2021 Jacob Levy. All rights reserved.
//
/*
This is VERY simple example of "completion handling".  This is a concept often
used in asynchronous programming & multi-threading.  If we send a function to run on
another thread of execution (in parallel), we aren't going to be able to respond to
its completion in *real time*.  Instead we often send a closure or function as a
"completion handler" aka a procedure to run, when the first procedure completes.

Think of downloading a file.  That can take VASTLY different amounts of time,
depending on connection strength to local wifi, wifi connection to ISP,
traffic load, etc. You wouldn't want to watch the file download for the
entire period of time.  A completion handler would  be like giving your download
program an action to run,  whenever the download finished.  A delayed command.
*/
import Foundation
////**********Accepting a Closure**********/
func example(_ closure: ([String]) -> Int) -> Int{
	var entries:[String] = [String]()
//	while let is another, looping form, of optional binding
	while let resp = readLine(){
		if resp.lowercased() == "goodbye"{
			break
		}
		entries.append(resp)
	}
	return closure(entries)
}
////counting total number of lines
//var answer = 0
//answer = example{
//	var total = 0
//	for _ in $0{
//		total += 1
//	}
//	return total
//}
//print("Total number of lines: \(answer)")
////counting total number of chars
//answer = example{
//	var total = 0
//	for each in $0{
//		for _ in each{
//			total += 1
//		}
//	}
//	return total
//}
//print("Total number of chars: \(answer)")
//
////Int average chars per line
//answer = example{
//	var total = 0
//	for each in $0{
//		for _ in each{
//			total += 1
//		}
//	}
//	return total/$0.count
//}
//print("Avg number of chars per line: \(answer)")


///****** Passing a named function instead of a closure********

func wordAvg(_ arr: [String]) -> Int{
	var subArr:[Substring] = [Substring]()
	var total = 0
	for each in arr{
		subArr = each.split(separator: " ")
		total += subArr.count
	}
	
	return total/arr.count
}
//The name of any function without parentheses or arguments is really just a "pointer"
//to that function in memory.

//the line below is saying "run example, using the wordAvg function"
print("Avg number of words per line: \(example(wordAvg))")


///**********Ungraded Challenge**********
//Write a function that fits into the example.  It should accept an array of Strings
//and return some Int (the number of words, the number Capital letters, the number of
//misspelled words (that one is a bit more challenging) or some other statistic not
//already covered
