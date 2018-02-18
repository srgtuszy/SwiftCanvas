//
//  ViewController.swift
//  SampleApp
//
//  Created by Michal Tuszynski on 18/02/2018.
//  Copyright © 2018 iapp. All rights reserved.
//

import UIKit
import Canvas

final class ViewController: UIViewController {
    @IBOutlet private weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imageView.image = .rectangle(size: CGSize(width: 50, height: 50), color: .blue)
    }
}

private extension UIImage {
    static func rectangle(size: CGSize, color: UIColor) -> UIImage {
        return UIImage.create(size: size)
            .fill(color: .red)
            .render()
    }
}
