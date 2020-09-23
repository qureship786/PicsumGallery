//
//  AuthorsViewModel.swift
//  PicsumGallery
//
//  Created by Parvez Qureshi on 16/09/20.
//  Copyright © 2020 Parvez Qureshi. All rights reserved.
//

import Foundation

protocol AuthorsViewModelDelegate {
    func showWaitingIndicator()
    func hideWaitingIndicator()
    func authorListDownloadSuccess()
    func authorListDownloadFailure()
}

class AuthorsViewModel {
    var delegate: AuthorsViewModelDelegate?
    private var authors: [Author] = [Author]()
    
    //URL string to download image from picsum based on image ID
    func imageURLString() -> String {
        return "https://picsum.photos/200/300?image="
    }
    //fetch authors list
    func fetchAuthorsList() {
        //display waiting indicator
        self.delegate?.showWaitingIndicator()
        
        WebService.shared.fetchAuthors { [weak self] (authors, error) in
            if let list = authors {
                self?.authors = list
                //hide waiting indicator
                self?.delegate?.hideWaitingIndicator()
                
                //inform UI that author list download is successful
                self?.delegate?.authorListDownloadSuccess()
            } else {
                //hide waiting indicator
                self?.delegate?.hideWaitingIndicator()
                
                //inform UI that author list download failed with an error
                self?.delegate?.authorListDownloadFailure()
            }
        }
    }
    //numberof sections
    func numberOfSections() -> Int {
        return 1
    }
    func numberOfAuthors() -> Int {
        return authors.count
    }
    func authorAtIndex(index: Int) -> Author? {
        if index < authors.count {
            return authors[index]
        }
        return nil
    }
    
}
