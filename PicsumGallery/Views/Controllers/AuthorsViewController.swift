//
//  ViewController.swift
//  PicsumGallery
//
//  Created by Parvez Qureshi on 16/09/20.
//  Copyright © 2020 Parvez Qureshi. All rights reserved.
//

import UIKit
import SDWebImage

class AuthorsViewController: UIViewController {
    
    private let reuseIdentifier = "authorcell"
    
    // MARK: IBOutlets
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var retryButton: UIButton!
    
    let authorsViewModel = AuthorsViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureUI()
        authorsViewModel.delegate = self
        authorsViewModel.fetchAuthorsList()
    }
    
    //configure UI
    func configureUI() {
        
        self.collectionView.dataSource = self
        
        //create flow layout for collection view.
        let layout = UICollectionViewFlowLayout()
        layout.minimumInteritemSpacing = 5
        layout.minimumLineSpacing = 5
        layout.sectionInset = UIEdgeInsets(top: 5, left: 5, bottom: 5, right: 5)
        self.collectionView.collectionViewLayout = layout
        
        toggleRetryButtonVisibility(isHidden: true)
        
        retryButton.setBackgroundColor(color: BUTTON_BACKGROUND_COLOR_HIGHLIGHTED, forState: .highlighted)
        retryButton.layer.cornerRadius = 9
    }
    
    func toggleRetryButtonVisibility(isHidden: Bool) {
        retryButton.isHidden = isHidden
    }
    @IBAction func retryButtonTapped(_ sender: Any){
        authorsViewModel.fetchAuthorsList()
    }
}

//handle delegate for AuthorsViewModel
extension AuthorsViewController: AuthorsViewModelDelegate {
    func showWaitingIndicator() {
        DispatchQueue.main.async {
            self.showIndicator()
        }
    }
    func hideWaitingIndicator() {
        DispatchQueue.main.async {
            self.hideIndicator()
        }
    }
    func authorListDownloadFailure() {
        DispatchQueue.main.async {
            self.showAlert(alertText: "Error", alertMessage: "We are facing some issues, please try again later.")
            self.toggleRetryButtonVisibility(isHidden: false)
        }
    }
    func authorListDownloadSuccess() {
        DispatchQueue.main.async {
            self.collectionView.reloadData()
            self.toggleRetryButtonVisibility(isHidden: true)
        }
    }
}

extension AuthorsViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = collectionView.bounds.width
        let numberOfItemsInRow: CGFloat = 3
        let spacing = (collectionViewLayout as? UICollectionViewFlowLayout)?.minimumInteritemSpacing ?? 0
        let availableWidth = width - spacing * (numberOfItemsInRow + 1)
        let itemDimension = floor(availableWidth / numberOfItemsInRow)
        return CGSize(width: itemDimension, height: 160)
    }
}

extension AuthorsViewController: UICollectionViewDataSource{
    // MARK: UICollectionViewDataSource

    func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return authorsViewModel.numberOfSections()
    }


    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return authorsViewModel.numberOfAuthors()
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = self.collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! AuthorCollectionViewCell
    
        if let info = authorsViewModel.authorAtIndex(index: indexPath.row) {
            let imageUrlString = authorsViewModel.imageURLString() + "\(info.id)"
            cell.authorImageView.sd_setImage(with: URL(string: imageUrlString), placeholderImage: UIImage(named: "placeholder"), options: .continueInBackground, progress: .none) { (img, error, cacheType, url) in
                cell.authorImageView.image = img
            }
            cell.authorName.text = info.author
            cell.authorId.text = "\(info.id)"
            cell.authorId.layer.cornerRadius = 15
            cell.authorId.layer.borderColor = UIColor.black.cgColor
            cell.authorId.layer.borderWidth = 1
            cell.authorId.layer.masksToBounds = true
        }
        
        return cell
    }
}

