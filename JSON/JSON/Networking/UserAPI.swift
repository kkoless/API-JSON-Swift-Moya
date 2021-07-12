//
//  UserService.swift
//  JSON
//
//  Created by Кирилл Колесников on 08.07.2021.
//

import Foundation
import Moya


enum UserAPI {
	case readUsers
	case deleteUser(id: Int)
}


extension UserAPI: TargetType {
	
	var baseURL: URL {
		return URL(string: "https://jsonplaceholder.typicode.com")!
	}
	
	var path: String {
		switch self {
			case .readUsers:
				return "/users"
			case .deleteUser(let id):
				return "/users/\(id)"
		}
	}
	
	var method: Moya.Method {
		switch self {
			case .readUsers:
				return .get
			case .deleteUser(_):
				return .delete
		}
	}
	
	var sampleData: Data {
		return Data()
	}
	
	var task: Task {
		switch self {
			case .readUsers, .deleteUser(_):
				return .requestPlain
		}
	}
	
	var headers: [String : String]? {
		return ["Content-Type" : "application/json"]
	}
	
}
