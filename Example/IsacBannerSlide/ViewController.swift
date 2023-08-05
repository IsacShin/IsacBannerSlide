//
//  ViewController.swift
//  IsacBannerSlide
//
//  Created by IsacShin on 08/05/2023.
//  Copyright (c) 2023 IsacShin. All rights reserved.
//

import UIKit
import IsacBannerSlide

class ViewController: UIViewController {

    @IBOutlet weak var bannerWrapV: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        IsacBannerSlide.createBanner(
                    IsacBannerModel.getDummy(),
                    bannerHeight: 90,                   // DefaultHeight: 90
                    pageDotColor: .black,               // DefaultDotColor: black
                    pageDotBorderColor: .black,         // DefaultDotBorderColor: black
                    parentV: bannerWrapV)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

