//
//  CollectionViewTest.swift
//  MotoNote
//
//  Created by 廖翔 on 2021/11/24.
//

import UIKit

class CollectionViewTest: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
   
    
   
    @IBOutlet weak var collectionV: UICollectionView!
  
    override func viewDidLoad() {
       
        super.viewDidLoad()

        collectionV.dataSource = self
        collectionV.delegate = self
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cVC = collectionView.dequeueReusableCell(withReuseIdentifier: "cVTestId", for: indexPath) as! CollectionViewCellTest
        return cVC
    }


}


class CollectionViewCellTest: UICollectionViewCell {
    @IBOutlet weak var cVImage: UIImageView!
}
