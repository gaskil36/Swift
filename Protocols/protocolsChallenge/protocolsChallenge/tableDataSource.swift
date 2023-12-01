//
//  tableDataSource.swift
//  protocolsChallenge
//
//  Created by Jacob Levy on 11/14/21.
//  Copyright © 2021 Jacob Levy. All rights reserved.
//

import Foundation
protocol tableDataSource{
	var numberOfRows: Int {get}
	var numberOfColumns: Int {get}
	
	func label(forColumn column: Int) -> String
	
	func itemFor(row: Int, column: Int) -> String

}
