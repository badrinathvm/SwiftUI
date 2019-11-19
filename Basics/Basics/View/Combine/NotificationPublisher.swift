//
//  NotificationPublisher.swift
//  Basics
//
//  Created by Venkatnarayansetty, Badarinath on 11/18/19.
//  Copyright © 2019 Badarinath Venkatnarayansetty. All rights reserved.
//

import Foundation
import UIKit
import Combine

struct BlogPost {
    var name:String
    var id:Int
}

class ViewController: UIViewController {
    
    lazy var combineView:NotiticationPublisherView = {
        let view = NotiticationPublisherView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
        self.view.addSubview(combineView)
        
        NSLayoutConstraint.activate([
            self.view.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            self.view.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            self.view.topAnchor.constraint(equalTo: self.view.topAnchor),
            self.view.bottomAnchor.constraint(equalTo: self.view.bottomAnchor)
        ])
        
        //Post a notification
        
        Timer.scheduledTimer(timeInterval: 3.0, target: self, selector: #selector(self.schedule), userInfo: nil, repeats: true)
    }
    
    @objc func schedule() {
        let blogPost = BlogPost(name: "Publisher\(Date())", id: 0)
        NotificationCenter.default.post(name: .newBlogPost, object: blogPost)
    }
}

class NotiticationPublisherView: UIView {
    
    lazy var label:UILabel = {
        var label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 16, weight: UIFont.Weight.bold)
        label.text = "Hello Combine !!"
        label.textColor = UIColor.black
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func tap(_ sender: UIButton) {
        print("Inside Tap")
    }
    
    func setup() {
        self.addSubview(label)
       
        NSLayoutConstraint.activate([
            self.label.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 50),
            self.label.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 8),
            self.label.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -8),
            self.label.heightAnchor.constraint(equalToConstant: 40),
        ])
        
        //declare a publisher
        let publisher = NotificationCenter.Publisher(center: .default, name: .newBlogPost, object: nil).map { (notification) -> String? in
            return (notification.object as? BlogPost)?.name ?? ""
        }
        
        //Assign a subscriber to label
        let subscriber = Subscribers.Assign(object: self.label, keyPath: \.text)
        //link publisher to scubscriber
        publisher.subscribe(subscriber)
    }
}

extension Notification.Name {
    static let newBlogPost = Notification.Name("new_blog_post")
}
