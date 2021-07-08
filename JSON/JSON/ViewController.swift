//
//  ViewController.swift
//  JSON
//
//  Created by Кирилл Колесников on 08.07.2021.
//

import UIKit
import Moya

class ViewController: UIViewController {
	
	@IBOutlet weak var table: UITableView!
	
	var users = [User]()
	let userProvider = MoyaProvider<UserService>()


	override func viewDidLoad() {
		super.viewDidLoad()

		setupTableView()
		
		userProvider.request(.readUsers) { result in
			switch result {
				case .success(let response):
					let users = try! JSONDecoder().decode([User].self, from: response.data)
					self.users = users
					//self.userController.user = users[0]
					self.table.reloadData()
				
				case .failure(let error):
					print(error)
			}
		}
	}
	
	private func setupTableView() {
		table.delegate = self
		table.dataSource = self
		table.register(UINib(nibName: "UserInfoTableViewCell", bundle: nil), forCellReuseIdentifier: "idCell")
	}

}

extension ViewController: UITableViewDelegate, UITableViewDataSource{
	
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return users.count
	}
	
	func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
		return 355.0
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell = tableView.dequeueReusableCell(withIdentifier: "idCell") as! UserInfoTableViewCell
		
		let user = users[indexPath.row]
		
		cell.nameLabel.text = user.name
		cell.idLabel.text = String(user.id)
		cell.usernameLabel.text = user.username
		cell.emailLabel.text = user.email
		cell.phoneLabel.text = user.phone
		cell.websiteLabel.text = user.website
		
		cell.streetLabel.text = user.address.street
		cell.suiteLabel.text = user.address.suite
		cell.cityLabel.text = user.address.city
		cell.zipcodeLabel.text = user.address.zipcode
		
		return cell
	}
}
