//
//  PersonCell.swift
//  ProjektOhneStoryboard
//
//  Created by Julian on 22.05.21.
//

import UIKit

class PersonCell: UITableViewCell {

    func configure(_text: String) {
        self.textLabel?.text = _text
    }
}
