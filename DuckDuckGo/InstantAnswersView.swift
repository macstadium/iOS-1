//
//  InstantAnswersView.swift
//  DuckDuckGo
//
//  Created by Christopher Brind on 15/02/2020.
//  Copyright © 2020 DuckDuckGo. All rights reserved.
//

import UIKit

protocol InstantAnswersViewDelegate: NSObjectProtocol {

    func queryWithIA(ia: String)

}

class InstantAnswersView: UIView {

    weak var delegate: InstantAnswersViewDelegate?

    @IBAction func newsTapped() {
        delegate?.queryWithIA(ia: "news")
    }

    @IBAction func imagesTapped() {
        delegate?.queryWithIA(ia: "images")
    }

    @IBAction func weatherTapped() {
        delegate?.queryWithIA(ia: "weather")
    }

    @IBAction func shoppingTapped() {
        delegate?.queryWithIA(ia: "shopping")
    }

    @IBAction func videosTapped() {
        delegate?.queryWithIA(ia: "videos")
    }

}
