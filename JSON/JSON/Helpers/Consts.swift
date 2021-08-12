//
//  Consts.swift
//  JSON
//
//  Created by Кирилл Колесников on 14.07.2021.
//

// Что-то вроде config файла

import Foundation


enum Consts {
	
	enum API {
		static let baseURL = URL(string: "https://jsonplaceholder.typicode.com")!
		static let authorizationHeader = "apiKey"
		static let xContentTypeName = "Content-type"
		static let xContentTypeValue = "application/json"
		static let authVerbose = true
		static let backendVerbose = true
	}
	
}
