//
//  UserService.swift
//  JSON
//
//  Created by Кирилл Колесников on 08.07.2021.
//

import Foundation
import Moya

enum UserService {
	case readUsers
}

extension UserService: TargetType {
	
	var baseURL: URL {
		return URL(string: "https://jsonplaceholder.typicode.com")!
	}
	
	var path: String {
		switch self {
			case .readUsers:
				return "/users"
		}
	}
	
	var method: Moya.Method {
		switch self {
			case .readUsers:
				return .get
		}
	}
	
	var sampleData: Data {
		return Data()
	}
	
	var task: Task {
		switch self {
			case .readUsers:
				return .requestPlain
		}
	}
	
	var headers: [String : String]? {
		return ["Content-Type" : "application/json"]
	}
	
}
