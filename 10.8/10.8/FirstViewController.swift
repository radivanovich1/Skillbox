//
//  FirstViewController.swift
//  10.8
//
//  Created by user on 9.05.21.
//

import UIKit

class FirstViewController: UIViewController{

    @IBOutlet weak var searchTextField: UITextField!
    var discountsArr: [String] = ["50%", "60%", "30%", "40%", "35%", "40%"]
    var namesArr: [String] = ["Hello", "Name", "Name2", "World", "People", "Nike"]
    var newPricesArr: [String] = ["500 руб.", "400 руб.", "600 руб.", "700 руб.", "800 руб.", "800 руб."]
    var oldPricesArr: [String] = ["600 руб.", "500 руб.", "800 руб.", "900 руб.", "900 руб.", "900 руб."]


    override func viewDidLoad() {
        super.viewDidLoad()
        searchTextField.delegate = self
        // Do any additional setup after loading the view.
    }
   
    func textFieldShouldReturn(_ textField: UITextField) -> Bool
        {
            searchTextField.resignFirstResponder()
            return true;
        }

}
extension FirstViewController: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource, UITextFieldDelegate {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 6
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CartCell", for: indexPath) as! CollectionViewCell
        cell.discountLabel.text = discountsArr[indexPath.row]
        cell.nameLabel.text = namesArr[indexPath.row]
        cell.newPriceLabel.text = newPricesArr[indexPath.row]
        cell.oldPriceLabel.text = oldPricesArr[indexPath.row]
        
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize
    {
        let w = UIScreen.main.bounds.size.width / 2.2
        let h = UIScreen.main.bounds.size.height / 2.2
        return CGSize(width: w, height: h )
    }
    
  
}
