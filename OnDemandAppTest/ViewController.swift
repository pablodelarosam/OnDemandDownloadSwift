//
//  ViewController.swift
//  OnDemandAppTest
//
//  Created by Pablo de la Rosa Michicol on 9/9/19.
//  Copyright © 2019 CraftCode. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var downloadedImage: UIImageView!
    private lazy var bundleResourceRequest = NSBundleResourceRequest(tags: Set(["on2"]))

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        loadOnDemandAssets()

    }
    
    @IBAction func download(_ sender: Any) {
        loadOnDemandAssets()

    }
    
    private func loadOnDemandAssets() {
        bundleResourceRequest.conditionallyBeginAccessingResources { [unowned self] (available) in
            if available {
                print("not")
                DispatchQueue.main.async {
                    self.downloadedImage.image = UIImage(named: "img2")

                }

            } else {
                
                self.bundleResourceRequest.beginAccessingResources { (error) in
                    guard error == nil else { return }
                    print("yes")
                    DispatchQueue.main.async {
                        self.downloadedImage.image = UIImage(named: "img2")
                        
                    }
                }
            }
        }
    }
    
    private func discardOnDemandAssets() {
        bundleResourceRequest.endAccessingResources()
    }


}

