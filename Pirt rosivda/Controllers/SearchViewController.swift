//
//  SearchViewController.swift
//  Pirt rosivda
//
//  Created by Rachid Ben said on 22/04/2021.
//

import UIKit

protocol SearchViewControllerDelegate {
    func search(text: String)
}

class SearchViewController: UIViewController, UITableViewDataSource {
   
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var textField: TextField!
    var delegate: SearchViewControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.tableFooterView = UIView()
        tableView.separatorInset = .zero
        textField.leftViewCallback = {
            self.dismiss(animated: true, completion: nil)
        }
    }
    
    @IBAction func back(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    
    func handleEnter() {
        self.delegate?.search(text: "")
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        Suggestion.allCases.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! ImageTableViewCell
        let suggestion = Suggestion.allCases[indexPath.row]
        
        cell.name?.text = suggestion.title
        cell.imgView?.image = UIImage(named: suggestion.iconName)
        return cell
    }
    
}
