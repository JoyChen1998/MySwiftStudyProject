//
//  ImageViewController.swift
//  Smashtag
//
//  Created by Mikael Olezeski on 11/12/17.
//  Copyright © 2017 Stanford University. All rights reserved.
//

import UIKit

class ImageViewController: UIViewController {
    
    @IBOutlet weak var loadingIndicator: UIActivityIndicatorView!
    
    //Model
    
    var detailImageURL: URL? {
        didSet {
            image = nil
            if view.window != nil {
                loadImage()
            }
        }
    }

    private func loadImage() {
        if let url = detailImageURL {
            loadingIndicator.startAnimating()
            if let imageData = try? Data(contentsOf: url) {
                DispatchQueue.main.async { [weak self] in
                self?.image = UIImage(data: imageData)
                }
            }
        }
    }
    
    // MARK: View Controller Lifecycle
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if image == nil { // we're about to appear on screen so, if needed,
            loadImage()  //  load image
        }
    }
    
    // User Interface
    
    @IBOutlet weak var scrollView: UIScrollView!{
        didSet {
            scrollView.delegate = self
            scrollView.minimumZoomScale = 1.0
            scrollView.maximumZoomScale = 10.0
            scrollView.contentSize = imageDetailView.frame.size
            scrollView.addSubview(imageDetailView)
        }
    }
    
    fileprivate var imageDetailView = UIImageView()
    
    private var image: UIImage? {
        get {
            return imageDetailView.image
        }
        set {
            imageDetailView.image = newValue
            imageDetailView.sizeToFit()
            scrollView?.contentSize = imageDetailView.frame.size
            loadingIndicator?.stopAnimating()
        }
    }



}

// Scroll View Delegate

extension ImageViewController : UIScrollViewDelegate
{
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return imageDetailView
    }
}
