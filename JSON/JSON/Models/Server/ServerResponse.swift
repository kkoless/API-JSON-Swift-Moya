//
//  ServerResponse.swift
//  JSON
//
//  Created by Кирилл Колесников on 14.07.2021.
//

import Foundation


// Используется тогда, когда ответ обернут еще во что-то



//Для массивов
struct ServerArrayResponse<T: Decodable>: Decodable {
	let data: [T]?
	let statusCode: Int?
}


// Для объектов
struct ServerResponse<T: Decodable>: Decodable {
	let data: T
	let statusCode: Int?

	enum CodingKeys: String, CodingKey {
		case data
		case statusCode
	}

	// Свой декодер
	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		self.statusCode  = try? values.decode(Int?.self, forKey: .statusCode)

		self.data = try values.decode(T.self, forKey: .data)
	}

}
