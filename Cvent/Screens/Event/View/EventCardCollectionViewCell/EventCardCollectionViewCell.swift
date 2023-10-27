//
//  EventCardCollectionViewCell.swift
//  Cvent
//
//  Created by Jigmet stanzin Dadul on 26/10/23.
//

import UIKit

class EventCardCollectionViewCell: UICollectionViewCell {
    //Identifier:- EventCardCollectionCell
    @IBOutlet weak var tableView: UITableView!
    
    
    let composite = Composite()
    let gap:CGFloat = 50
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: "EventCardTableViewCell", bundle: .main), forCellReuseIdentifier: "EventCardTableCell")
        tableView.rowHeight = 194
        
    }

}
extension EventCardCollectionViewCell: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "EventCardTableCell") as! EventCardTableViewCell
        
        return cell
    }
    
}
