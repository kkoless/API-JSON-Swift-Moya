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

class NetworkService {
	
	func getUsers(provider: MoyaProvider<UserAPI>) -> Observable<[UserModel]> {
		
		return Observable.create { observer in
			provider.request(.readUsers) { result in
				switch result {
					case .success(let response):
						let users = try! JSONDecoder().decode([UserModel].self, from: response.data)
						observer.onNext(users)
						observer.onCompleted()
						
					case .failure(let error):
						print(error)
						observer.onError(NetworkError.decoderError)
				}
			}
			
			return Disposables.create {}
		}
	}
	
	
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


