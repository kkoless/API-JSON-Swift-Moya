//
//  ViewController.swift
//  JSON
//
//  Created by Кирилл Колесников on 08.07.2021.
//

import UIKit
import Moya
import RxSwift
import RxCocoa

class ViewController: UIViewController {
	
	@IBOutlet weak var table: UITableView!
	
	private let userProvider = MoyaProvider<UserAPI>()
	private let networkService = NetworkService()
	
	private let bag = DisposeBag()
	
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		setupTableView()
		
		networkService.getUsers(provider: userProvider).bind(to: table.rx.items(cellIdentifier: "idCell", cellType: UserInfoTableViewCell.self)){
			index, model, cell in
			
			cell.setupData(model: model)
			
			self.fetchImage(from: "https://creazilla-store.fra1.digitaloceanspaces.com/emojis/45117/ok-hand-emoji-clipart-md.png", cell: cell)
			
		}.disposed(by: bag)
		
	}
	
	private func fetchImage(from urlImage: String, cell: UserInfoTableViewCell){
		let session = URLSession.shared
		
		guard let url = URL(string: urlImage) else { return }
		
		session.dataTask(with: url){ data, response, error in
			guard let data = data, error == nil else { return }
			DispatchQueue.main.async {
				cell.imageUser.image = UIImage(data: data)
			}
		}.resume()
	}
	
	private func setupTableView() {
		table.rowHeight = 565.0
		table.register(UINib(nibName: "UserInfoTableViewCell", bundle: nil), forCellReuseIdentifier: "idCell")
	}
	
}
