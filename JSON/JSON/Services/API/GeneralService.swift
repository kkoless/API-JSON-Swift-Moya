//
//  NetworkService.swift
//  JSON
//
//  Created by Кирилл Колесников on 11.07.2021.
//

import Foundation
import RxSwift
import RxCocoa
import Moya

enum NetworkError: Error {
	case badUrl
	case badRequest
	case decoderError
}

struct GeneralService {
	
	let provider = MasterProvider<GeneralAPI>()
	
}

extension GeneralService {
	
	func getData() -> Observable<[User]>{
		provider.rx.request(.readUsers).filterSuccessfulStatusAndRedirectCodes()
			.map([ServerUser].self)
			.map{UserMapper().toLocal(list: $0)}
			.asObservable()
	}
	
}


