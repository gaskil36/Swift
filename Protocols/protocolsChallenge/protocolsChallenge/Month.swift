//
//  Month.swift
//  protocolsChallenge
//
//  Created by Jacob Levy on 11/14/21.
//  Copyright © 2021 Jacob Levy. All rights reserved.
//

import Foundation
enum Month: Int, CaseIterable{

	
	
	case January
	case February
	case March
	case April
	case May
	case June
	case July
	case August
	case September
	case October
	case November
	case December

	//Default initializer to create an enum starting in January
	init(starting month: Int){
		self = Month(rawValue: month) ?? .January
	}
	func numDays(_ leapYear: Bool) -> Int{
		switch self{
		case .September, .April, .June, .November: return 30
		case .February: return (leapYear ? 29 : 28)
		default: return 31
		}
	}
	func currentMonth(){
		print("It's \(self) right now...")
		
	}
	mutating func nextMonth(){
		let nextMonth = (self.rawValue + 1) % Month.allCases.count //makes it circular

		self = Month(rawValue: nextMonth)!
		print("Month updated to \(self)")
	}
}
