//
//  MainViewController.swift
//  CardTilt
//
//  Created by Ray Fix on 6/25/14.
//  Copyright (c) 2014 Razeware LLC. All rights reserved.
//

import UIKit

class MainViewController: UITableViewController {

    var members:[Member] = []
    
    // #pragma mark - Model
    
    func loadModel() {
        let path = NSBundle.mainBundle().pathForResource("TeamMembers", ofType: "json")
        members = Member.loadMembersFromFile(path!)
    }
    
    // #pragma mark - View Lifetime
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // appearance and layout customization
        self.tableView.backgroundView = UIImageView(image:UIImage(named:"background"))
        self.tableView.estimatedRowHeight = 280
        self.tableView.rowHeight = UITableViewAutomaticDimension
        
        // load our model
        loadModel();
    }

    // #pragma mark - Table View

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return members.count
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Card", forIndexPath: indexPath) as CardTableViewCell
        let member = members[indexPath.row]
        cell.useMember(member)
        return cell
    }

    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        return false
    }
    
    override func tableView(tableView: UITableView, willDisplayCell cell: UITableViewCell,
        forRowAtIndexPath indexPath: NSIndexPath) {
//            let xOffset = Double(indexPath.row) * -10.0
//            let rotation = Double(indexPath.row) * -5.0
//            let animator = TipInViewAnimator()
//            animator.setStartTransform(degreesToRotate: rotation, offsetX: xOffset, offsetY: 0.0)
////            animator.setStartTransform(rotation, offset: CGPointMake(xOffset, 0))
//            animator.animate(cell.contentView)
            
            cell.tipIn(degreesToRotate: -5.0, offsetX: -10.0, offsetY: 0.0)
            //cell.tipIn()
            //cell.tipIn(duration:0.5)
//            cell.fadeIn(duration:0.4)
//            cell.fadeOut(delay:3.0)
            
    }
}
