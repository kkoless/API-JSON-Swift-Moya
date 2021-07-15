//
//  UserMapper.swift
//  JSON
//
//  Created by Кирилл Колесников on 14.07.2021.
//

import Foundation

final class UserMapper: BaseModelMapper<ServerUser, User> {
	let serverAddressModel = AddressMapper()
	
	override func toLocal(serverEntity: ServerUser) -> User {
		
		let model = User(
			id: serverEntity.id ?? 0,
			name: serverEntity.name ?? "",
			username: serverEntity.username ?? "",
			email: serverEntity.email ?? "",
			address: serverAddressModel.toLocal(serverEntity: serverEntity.address ?? ServerAddress(street: "", suite: "", city: "", zipcode: "")),
			phone: serverEntity.phone ?? "",
			website: serverEntity.website ?? ""
		)
		
		
		return model
	}
}
