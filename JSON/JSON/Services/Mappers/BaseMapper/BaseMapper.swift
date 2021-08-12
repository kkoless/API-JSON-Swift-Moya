//
//  BaseMapper.swift
//  JSON
//
//  Created by Кирилл Колесников on 14.07.2021.
//

// S - серверная модель
// L - локальная модель

import Foundation

class BaseModelMapper<S, L> {
	func toLocal(list: [S]?) -> [L] {
		guard let list = list else { return [] }
		return list.compactMap { $0 }
			.map { entity -> L in
				return toLocal(serverEntity: entity)
			}
	}
	
	func toLocal(serverEntity: S) -> L {
		preconditionFailure("This method must be overriden")
	}
}
