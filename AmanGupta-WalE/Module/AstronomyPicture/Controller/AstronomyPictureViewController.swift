//
//  AstronomyPictureViewController.swift
//  AmanGupta-WalE
//
//  Created by Aman gupta on 10/04/22.
//

import UIKit

class AstronomyPictureViewController: BaseViewController {

    // MARK: - IBoutets
    @IBOutlet weak var dailyImageView: UIImageView!
    @IBOutlet weak var subtitleLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!

    // MARK: - Properties
    lazy var viewModel: AstronomyPictureViewModel = AstronomyPictureViewModel()

    // MARK: - View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }

    // MARK: - Configure View
    func configureView() {
        handleErrorMessgae()
        scrollView.isHidden = true
        showLoader()
        viewModel.showData = { [weak self] dataModel in
            DispatchQueue.main.async {
                self?.scrollView.isHidden = false
                self?.hideLoader()
            }
            if let model = dataModel {
                DispatchQueue.main.async {
                    self?.subtitleLabel.text = model.explanation
                    self?.dateLabel.text = model.date
                    self?.titleLabel.text = model.title
                }
                if let urlString = model.hdurl {
                    self?.viewModel.fetchImage(imageURLString: urlString, handler: { imageUrl, data, error in
                        if error == nil {
                            if urlString == imageUrl, let data = data {
                                DispatchQueue.main.async {
                                    self?.dailyImageView.image = UIImage(data: data)
                                }
                            }
                        }
                    })
                }
            }
            
        }
    }
    
    func handleErrorMessgae() {
        viewModel.errorMessage = { [weak self] (errorMsg) in
            self?.showAlertWithHandlers(messageText: errorMsg, cancelCompletion: nil, okCompletion: nil)
        }
    }
    
    func showLoader() {
        activityIndicator.isHidden = false
        activityIndicator.startAnimating()
    }
    
    func hideLoader() {
        activityIndicator.isHidden = true
        activityIndicator.stopAnimating()
    }
    
}
