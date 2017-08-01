//
//  ViewController.swift
//  CellTransition
//
//  Created by Guillermo Delgado on 01/08/2017.
//  Copyright © 2017 GuillermoRD. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    let tableIdentifier = "RDTableViewCellId"

    @IBOutlet weak var tableView: UITableView!
    var dataSource: [RDTableItem]! = []

    let cellHeight: CGFloat = 80.0

    override func viewDidLoad() {
        super.viewDidLoad()

        self.tableView.register(UINib.init(nibName: "RDTableViewCell", bundle: nil),
                                forCellReuseIdentifier: self.tableIdentifier)

        self.tableView.separatorInset.left = 0

        self.tableView.delegate = self
        self.tableView.dataSource = self

        self.createDataSource()
    }

    func randomAvatar() -> UIImage {
        let s1 = "avatar" + String(arc4random_uniform(8))
        return UIImage(named:s1)!
    }

    func randomTitle() -> String {

        var ar: [String] = []
        ar.append("Tesla Model 3")
        ar.append("Last Week Tonight with Jo")
        ar.append("Breathtakingly Beautiful Jap")
        ar.append("Gordon Furious When He")
        ar.append("Epic 4x4 Survival Expedan")

        return ar[Int(arc4random_uniform(4))]
    }

    func randomSubtitle() -> String {

        var ar: [String] = []
        ar.append("I drove Tesla Model 3 and I liked it. These are my full thoughts and impressions!")
        ar.append("Alex Jones is known for pushing conspiracy theories, but he also spends a lot of time promoting his")
        ar.append("It’s possible that this is one of the smallest homes that we have visited a lot of time")
        ar.append("This van is a wonderful example of great small space design full thoughts and impressions!")
        ar.append("And things kick off when there's a confrontation with the owner and chef smallest homes")

        return ar[Int(arc4random_uniform(4))]
    }

    func createDataSource() {

        for _ in 0...20 {
            self.dataSource.append(RDTableItem.init(withAvatar: UIImageView(image: randomAvatar()),
                                                    title: randomTitle(),
                                                    subtitle: randomSubtitle(),
                                                    contentString: nil,
                                                    contentImage: nil))
        }
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell: RDTableViewCell = tableView.dequeueReusableCell(withIdentifier: self.tableIdentifier,
                                                                   for: indexPath) as? RDTableViewCell else {

            fatalError("RDTableView couldn't be initiated")
        }

        let item = dataSource[indexPath.row]

        item.avatarImageView.frame.size = cell.avatarView.frame.size
        cell.avatarView.subviews.forEach({ $0.removeFromSuperview() })
        cell.avatarView.addSubview(item.avatarImageView)
        cell.titleLabel.text = item.title
        cell.subtitleLabel.text = item.subtitle

        return cell
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {

        return cellHeight
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

        guard let cell: RDTableViewCell = self.tableView.cellForRow(at: indexPath) as? RDTableViewCell else {
            fatalError()
        }

        self.tableView.deselectRow(at: indexPath, animated: true)
        print("Did select Item", indexPath.row)

        let vc: UIViewController = UIViewController.init()
        vc.view.backgroundColor = UIColor.red

        vc.view.addSubview(cell)

        let pt: CGPoint = CGPoint.init(x:CGFloat(fabs(cell.frame.origin.x)), y:CGFloat(fabs(cell.frame.origin.y)))
        let convertedPoint: CGPoint = vc.view.convert(pt, from: self.tableView)
        cell.frame.origin = convertedPoint

        self.present(vc, animated: false) {
            self.perform(#selector(self.dismiss(topvc:)), with: vc, afterDelay: 1)
        }
    }

    func dismiss(topvc: UIViewController) {
        topvc.dismiss(animated: true, completion: nil)
        self.tableView.reloadData()
    }
}
