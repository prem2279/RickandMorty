//
//  PeopleTableViewCell.swift
//  Zoho People
//
//  Created by Prem Kumar Gundu on 5/29/26.
//

import UIKit

//MARK: Protocals

protocol loadApiData{
    func loadPeopleData(_ people : People?)
}

//MARK: PeopleTableViewCell Class

class PeopleTableViewCell: UITableViewCell {

    //MARK: OutLets of the TableCell
    
    @IBOutlet weak var location: UILabel!
    @IBOutlet weak var origin: UILabel!
    @IBOutlet weak var gender: UILabel!
    @IBOutlet weak var species: UILabel!
    @IBOutlet weak var status: UILabel!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var profileImage: UIImageView!
    
    //MARK: UITableViewCell LifeCycle Methods
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

//MARK: Extension for Loading Data

extension PeopleTableViewCell: loadApiData{
    
    func loadPeopleData(_ people: People?) {
        guard let people = people else { return }
        location.text = people.location.name
        origin.text = people.origin.name
        gender.text = people.gender
        species.text = people.species
        status.text = people.status
        name.text = people.name
        profileImage.image = UIImage(named: String(people.id)) ?? UIImage(named: "1")
        
    }
    
}
