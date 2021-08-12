//
//  User.swift
//  JSON
//
//  Created by Кирилл Колесников on 08.07.2021.
//

import Foundation


struct User: Decodable {
	var id: Int
	var name: String
	var username: String
	var email: String
	var address: Address
	var phone: String
	var website: String
	
}

struct Address: Decodable {
	var street: String
	var suite: String
	var city: String
	var zipcode: String
}


