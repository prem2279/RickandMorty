//
//  ViewController.swift
//  Zoho People
//
//  Created by Prem Kumar Gundu on 5/29/26.
//

import UIKit

protocol PeopleProtocol{
    func getPeopleData(for url: String) -> [People]?
}

//MARK: Dashboard View Controller Main Class

class DashboardViewController: UIViewController {
    
    //MARK: Parameters and Outlets
    
    var peopleData : [People]?
    var isInternetAvailable = false

    @IBOutlet weak var peopleTableView: UITableView!
    
    //MARK: UI ViewController LifeCycle Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        peopleData = getPeopleData(for: "https://google.com")
        
        peopleTableView.dataSource = self
    }
}

//MARK: Extension for UITableViewDataSource

extension DashboardViewController: UITableViewDataSource {
    
    ////MARK: Methods to conform in UITableViewDataSource Protocol
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        peopleData?.count  ?? 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: TableCells.PeopleCell.rawValue) as? PeopleTableViewCell
        let item = peopleData?[indexPath.row]
        let selectedView = UIView()
        selectedView.backgroundColor = UIColor.darkGray.withAlphaComponent(0.3)
        cell?.selectedBackgroundView = selectedView
        cell?.loadPeopleData(item)
        return cell ?? UITableViewCell()
    }
}

extension DashboardViewController: PeopleProtocol{
    func getPeopleData(for url: String) -> [People]? {
        if isInternetAvailable{
            return NetworkManager.sharedInstance.getPeopleData(for: url)
        }
        
        return MockNetworkManager.sharedInstance.getPeopleData(for: url)
    }
    
    
}


