//
//  ImageViewController.swift
//  Cassini
//
//  Created by JoyChan on 2018/10/29.
//  Copyright © 2018 JoyChans. All rights reserved.
//

import UIKit

class ImageViewController: UIViewController {
    var imageURL: URL? {
        didSet {
            image = nil
            if view.window != nil{
                fetchImage()
            }
        }
    }
    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        view.addSubview(imageView)
//        imageURL = DemoURL.MyFavorite
//    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if image == nil {
            fetchImage()
        }
    }
    
    
    @IBOutlet weak var scrollView: UIScrollView! {
         didSet {
            scrollView.delegate = self
            scrollView.minimumZoomScale = 0.03
            scrollView.maximumZoomScale = 1.0
            scrollView.contentSize = imageView.frame.size
            scrollView.addSubview(imageView)
        }
    }
    
    
    @IBOutlet weak var spinner: UIActivityIndicatorView!
    // fetch images on the Internet
    
    
    // Use Async function , let fetch action do not in queue.(DispatchQueue)
    private func fetchImage() {
        if let url = imageURL {
            spinner.startAnimating()
            DispatchQueue.global(qos: .userInitiated).async { [weak self] in
                let urlContents = try? Data(contentsOf: url)
                if let imageData = urlContents, url == self?.imageURL {
                    DispatchQueue.main.async {
                        self?.image = UIImage(data: imageData)
                    }
                }
            }
        }
    }
    

    fileprivate var imageView = UIImageView()
    
    private var image: UIImage? {
        get {
            return imageView.image
        }
        set {
            imageView.image = newValue
            imageView.sizeToFit()
            scrollView?.contentSize = imageView.frame.size     // set contentsize -> can scroll all image
            spinner?.stopAnimating()                           // when show images , stop spinner's animation
        }
    }
}

extension ImageViewController : UIScrollViewDelegate {
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return imageView
    }
}
