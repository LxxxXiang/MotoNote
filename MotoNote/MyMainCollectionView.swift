//
//  MyMainCollectionView.swift
//  MotoNote
//
//  Created by 廖翔 on 2021/11/23.
//

import UIKit

class MyMainCollectionView: UIViewController, UITableViewDelegate, UITableViewDataSource, UICollectionViewDelegate, UICollectionViewDataSource {
    
    let motoDataItem: [String] = ["油耗紀錄", "保養要點", "零件價格", "預約服務", "車禍 SOP"]
    @IBOutlet weak var motoNoteCV: UICollectionView!
    @IBOutlet weak var motoNoteTV: UITableView!
    @IBOutlet weak var btnAdd: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        motoNoteTV.delegate = self
        motoNoteTV.dataSource = self
        motoNoteCV.delegate = self
        motoNoteCV.dataSource = self
        self.motoNoteTV.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: -15)
    }
    
    //MARK: - tableView
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       1
    }
    // MARK: tableViewCell
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let tVC =  tableView.dequeueReusableCell(withIdentifier: "tVCId", for: indexPath)
        tVC.textLabel?.text = self.motoDataItem[indexPath.section]
        tVC.backgroundColor = UIColor.lightGray
        tVC.layer.borderColor = UIColor.black.cgColor
        tVC.layer.borderWidth = 1
        tVC.layer.cornerRadius = 8
        tVC.clipsToBounds = true
        tVC.accessoryType  = .disclosureIndicator
        return tVC
        
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return self.motoDataItem.count
    }
        
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 5
    }

    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView()
        headerView.backgroundColor = UIColor.clear
        return headerView
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // note that indexPath.section is used rather than indexPath.row
        print("You tapped cell number \(indexPath.section).")
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    
    
    //MARK: - collection
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cVC = collectionView.dequeueReusableCell(withReuseIdentifier: "cVCId", for: indexPath) as! motoNoteCVC
        cVC.layer.frame = CGRect(x: 0, y: 0, width: motoNoteCV.self.visibleSize.width - 100, height: motoNoteCV.self.visibleSize.height - 100)
        return cVC
    }
    
}


class motoNoteCVC: UICollectionViewCell {
    
    @IBOutlet weak var motoImage: UIImageView!
    @IBOutlet weak var lab1: UILabel!
    @IBOutlet weak var lab2: UILabel!
    @IBOutlet weak var lab3: UILabel!
    @IBOutlet weak var lab11: UILabel!
    @IBOutlet weak var lab22: UILabel!
    @IBOutlet weak var lab33: UILabel!
    @IBOutlet weak var btn1: UIButton!
    @IBOutlet weak var btn2: UIButton!
    
}


// TableView Reference -> https://stackoverflow.com/questions/33234180/uitableview-example-for-swift/33234181#33234181
