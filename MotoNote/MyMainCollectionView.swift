//
//  MyMainCollectionView.swift
//  MotoNote
//
//  Created by 廖翔 on 2021/11/23.
//

import UIKit

class MyMainCollectionView: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var motoImage: UIImageView!
    @IBOutlet weak var lab1: UILabel!
    @IBOutlet weak var lab2: UILabel!
    @IBOutlet weak var lab3: UILabel!
    @IBOutlet weak var lab11: UILabel!
    @IBOutlet weak var lab22: UILabel!
    @IBOutlet weak var lab33: UILabel!
    @IBOutlet weak var btn1: UIButton!
    @IBOutlet weak var btn2: UIButton!
    @IBOutlet weak var motoNoteTV: UITableView!
    @IBOutlet weak var btnAdd: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        motoNoteTV.delegate = self
        motoNoteTV.dataSource = self
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let tVC =  tableView.dequeueReusableCell(withIdentifier: "tVCId", for: indexPath) as! motoNoteTVC
        tVC.motoNoteTVCL.text = "Heee\(indexPath.row)"
        return tVC
        
    }
    

}


class motoNoteTVC: UITableViewCell {
    
    @IBOutlet weak var motoNoteTVCL: UILabel!
    
}
