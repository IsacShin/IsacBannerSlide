//
//  IsacBanner.swift
//  IsacBanner
//
//  Created by 신이삭 on 2023/08/04.
//

import Foundation
import SnapKit
import UIKit
/**
 - parameters:
    - list: 이미지URL 및 클릭 클로져를 포함한 리스트
    - bannerHeight: 배너 컬렉션 뷰 높이
    - pageDotColor: 페이지 뷰 컨트롤러 select background Color
    - pageDotBorderColor: 페이지 뷰 컨트롤러 borderColor
    - parentV: banner를 붙힐 UIView
*/
public struct IsacBannerSlide {
    public static func createBanner(_ list: [IsacBannerModel],
                                    bannerHeight: CGFloat = 90,
                                    pageDotColor: UIColor = .white,
                                    pageDotBorderColor: UIColor = .black,
                                    parentV: UIView) {
        let bannerV = BannerView(list: list, pageDotColor: pageDotColor, pageDotBorderColor: pageDotBorderColor)
        bannerV.bannerHeight = bannerHeight
        parentV.addSubview(bannerV)
        bannerV.snp.makeConstraints { make in
            make.leading.trailing.top.bottom.equalToSuperview()
        }
    }
}
