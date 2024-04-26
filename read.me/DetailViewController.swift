//
//  DetailViewController.swift
//  read.me
//
//  Created by Jasmine Ben-Whyte on 26/4/24.
//

import UIKit
import Nuke
import NukeExtensions

class DetailViewController: UIViewController {
    
    @IBOutlet weak var backdropImageView: UIImageView!
    @IBOutlet weak var posterImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var overviewLabel: UILabel!
    @IBOutlet weak var beginButton: UIButton!
    
    var book: Book!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        titleLabel.text = book.title
        overviewLabel.text = book.overview
        
        let picture = book.posterPath
        NukeExtensions.loadImage(with: picture, into: posterImageView)
        NukeExtensions.loadImage(with: picture, into: backdropImageView)
        }

}
