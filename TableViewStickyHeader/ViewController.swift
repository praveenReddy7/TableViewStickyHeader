//
//  ViewController.swift
//  TableViewStickyHeader
//
//  Created by praveen on 2/19/19.
//  Copyright © 2019 DemoApps. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    var headerView: HeaderView!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        
        self.navigationController?.navigationBar.isTranslucent = true
        self.view.backgroundColor = .lightGray
        
        let tableView = UITableView()
        tableView.dataSource = self
        tableView.delegate = self
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        view.addSubview(tableView)
        tableView.contentInset = UIEdgeInsets(top: getHeight(), left: 0, bottom: 0, right: 0)

        tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        tableView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        
        headerView = HeaderView()
        headerView.frame = CGRect(x: 0, y: 0, width: view.bounds.width, height: getHeight()+50)
        headerView.backgroundColor = .yellow
        view.addSubview(headerView)
        view.layoutIfNeeded()
    }
    
    func getHeight() -> CGFloat {
        return view.bounds.height*0.30
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let y = -scrollView.contentOffset.y
        headerView.frame = CGRect(x: 0, y: 0, width: view.bounds.width, height: y)
        
        print(y)
        let alpha = y/300
        if y < 300 {
            headerView.logo.alpha = alpha < 0 ? 0 : alpha
            headerView.titleLabel.alpha = alpha < 0 ? 0 : alpha
        } else {
            headerView.logo.alpha = 1
            headerView.titleLabel.alpha = 1
        }
        
        if y > getHeight() {
            let newSize: CGFloat = (y-getHeight())+90
            headerView.logoHightConstraint.constant = newSize
            headerView.logoWidthConstraint.constant = newSize
            headerView.logo.layer.cornerRadius = newSize*0.5
            headerView.logo.font = UIFont.systemFont(ofSize: newSize/2, weight: .semibold)
        } else {
            headerView.logoHightConstraint.constant = 90
            headerView.logoWidthConstraint.constant = 90
            headerView.logo.layer.cornerRadius = 90*0.5
            headerView.logo.font = UIFont.systemFont(ofSize: 45, weight: .semibold)
        }
        
        view.layoutIfNeeded()

    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 30
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = "\(indexPath)"
        return cell
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

