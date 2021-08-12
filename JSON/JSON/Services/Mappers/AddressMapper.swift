//
//  AddressMapper.swift
//  JSON
//
//  Created by Кирилл Колесников on 15.07.2021.
//

import Foundation

final class AddressMapper: BaseModelMapper<ServerAddress, Address> {
	
	override func toLocal(serverEntity: ServerAddress) -> Address {
		
		let address = Address(
			street: serverEntity.street ?? "",
			suite: serverEntity.suite ?? "",
			city: serverEntity.city ?? "",
			zipcode: serverEntity.zipcode ?? ""
		)
		
		return address
	}
}
