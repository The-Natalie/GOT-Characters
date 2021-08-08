//
//  CharacterTableViewCell.swift
//  GOT-Characters
//
//  Created by Natalie Hall on 8/5/21.
//

import UIKit

class CharacterTableViewCell: UITableViewCell {
    
    // MARK: - Outlets
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var imageImageView: UIImageView!
    @IBOutlet weak var originLabel: UILabel!
    @IBOutlet weak var houseLabel: UILabel!
    @IBOutlet weak var ageLabel: UILabel!
    @IBOutlet weak var actorLabel: UILabel!
    
    
    var character: Character? {
        didSet {
            updateViews()
        }
    }
    
    func updateViews() {
        guard let character = character else { return }
        
        let characterAge = character.age?.age
        if characterAge == nil {
            ageLabel.text = "Age: unknown"
        } else {
            ageLabel.text = "Age: \(characterAge!)"
        }
        
        nameLabel.text = character.name
        originLabel.text = "From: \(character.name)"
        houseLabel.text = "House: \(character.house ?? "unknown")"
        actorLabel.text = "Played by: \(character.actor ?? "unknown")"
        fetchImage()
    }
    
    func fetchImage() {
        CharacterController.fetchImage(for: character!) { result in
            DispatchQueue.main.async {
                switch result {
                case .success(let image):
                    self.imageImageView.image = image
                    self.imageImageView.contentMode = .scaleToFill
                case .failure(_):
                    self.imageImageView.image = #imageLiteral(resourceName: "imageNA")
                    self.imageImageView.contentMode = .scaleToFill
                }
            }
        }
    }
    
}  // End of Class
