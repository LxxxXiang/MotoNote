//
//  TableViewTest.swift
//  MotoNote
//
//  Created by 廖翔 on 2021/11/24.
//

import UIKit

class TableViewTest: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    let animals: [String] = ["Horse", "Cow", "Camel", "Sheep", "Goat"]
    
    let cellReuseIdentifier = "cell"
    let cellSpacingHeight: CGFloat = 5
    @IBOutlet weak var tVTest: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tVTest.dataSource = self
        tVTest.delegate = self
        
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "tttttttt", for: indexPath)
        
        cell.textLabel?.text = self.animals[indexPath.section]
        cell.backgroundColor = UIColor.white
        cell.layer.borderColor = UIColor.black.cgColor
        cell.layer.borderWidth = 1
        cell.layer.cornerRadius = 8
        cell.clipsToBounds = true
        
        return cell
        
    }
    
    // MARK: - Table View delegate methods
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return self.animals.count
    }
    
    // Set the spacing between sections
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return cellSpacingHeight
    }
    
    // Make the background color show through
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView()
        headerView.backgroundColor = UIColor.clear
        return headerView
    }
    
    // method to run when table view cell is tapped
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // note that indexPath.section is used rather than indexPath.row
        print("You tapped cell number \(indexPath.section).")
    }
}
//
//class TableViewCellTest: UITableViewCell {
//    @IBOutlet weak var tVTestLabel: UILabel!
//}



