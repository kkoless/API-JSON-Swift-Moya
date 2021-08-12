//
//  ServerUser.swift
//  JSON
//
//  Created by Кирилл Колесников on 14.07.2021.
//

import Foundation

struct ServerUser: Decodable{
	var id: Int?
	var name: String?
	var username: String?
	var email: String?
	var address: ServerAddress?
	var phone: String?
	var website: String?
}

struct ServerAddress: Decodable {
	var street: String?
	var suite: String?
	var city: String?
	var zipcode: String?
}
