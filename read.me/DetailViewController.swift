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
    var chapterCounter: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        titleLabel.text = book.title
        overviewLabel.text = book.overview
        posterImageView.image = UIImage(named: book.poster)
        backdropImageView.image = UIImage(named: book.poster)
        }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let readingViewController = segue.destination as? ReadingViewController else { return }
        readingViewController.chapterCounter = 0
    }

}
