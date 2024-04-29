//
//  ReadingViewController.swift
//  read.me
//
//  Created by Jasmine Ben-Whyte on 27/4/24.
//

import UIKit

class ReadingViewController: UIViewController, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    
    private var bookContent: [[String]] = []
    var chapterCounter: Int = 0

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        bookContent[chapterCounter].count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ParagraphCell", for: indexPath) as! ParagraphCell
        
        let paragraph = bookContent[chapterCounter]
        cell.paragraphLabel.text = paragraph[indexPath.row]
        return cell
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        // Do any additional setup after loading the view.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let selectedIndexPath = tableView.indexPathForSelectedRow else { return }
        
        let  selectedParagraph = bookContent[chapterCounter][selectedIndexPath.row]
    }
    
}
