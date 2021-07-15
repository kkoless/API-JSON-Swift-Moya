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
	
	// Не используется
	func getImage(from urlImage: String) -> Observable<[UIImage]>{
		let session = URLSession.shared
		var images = [UIImage]()
		
		return Observable.create { observer in
			guard let url = URL(string: urlImage) else {
				observer.onError(NetworkError.badUrl)
				return Disposables.create {}
			}
			
			session.dataTask(with: url){ data, response, error in
				guard let data = data, error == nil else {
					observer.onError(NetworkError.badRequest)
					return
				}
				DispatchQueue.main.async {
					images.append(UIImage(data: data)!)
					observer.onNext(images)
				}
			}.resume()
			
			return Disposables.create {
				session.invalidateAndCancel()
			}
		}
		
	}
}


