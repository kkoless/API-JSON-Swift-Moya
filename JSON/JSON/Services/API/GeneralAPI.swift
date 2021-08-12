//
//  UserService.swift
//  JSON
//
//  Created by Кирилл Колесников on 08.07.2021.
//

import Foundation
import Moya


enum GeneralAPI {
	case readUsers
}


extension GeneralAPI: TargetType {
	
	var baseURL: URL {
		return Consts.API.baseURL
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
		return nil
	}
	
}
