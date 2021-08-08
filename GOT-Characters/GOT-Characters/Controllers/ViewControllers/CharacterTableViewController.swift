//
//  CharacterTableViewController.swift
//  GOT-Characters
//
//  Created by Natalie Hall on 8/5/21.
//

import UIKit

class CharacterTableViewController: UITableViewController {
    
    var characters: [Character] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchCharacters()
    }
    
    func fetchCharacters() {
        CharacterController.fetchCharacter { result in
            DispatchQueue.main.async {
                switch result {
                case .success(let characters):
                    self.characters = characters
                    self.tableView.reloadData()
                case .failure(let error):
                    print(error)
                }
            }
        }
    }
    
    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return characters.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "characterCell", for: indexPath) as? CharacterTableViewCell else { return UITableViewCell() }
        let character = self.characters[indexPath.row]
        cell.character = character
        
        if indexPath.row % 2 == 0 {
            cell.backgroundColor = UIColor(red: 0.26, green: 0.35, blue: 0.25, alpha: 1.00)
        } else {
            cell.backgroundColor = UIColor(red: 0.20, green: 0.25, blue: 0.29, alpha: 1.00)
        }
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 225
    }
    
}  // End of Class
