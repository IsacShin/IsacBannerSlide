//
//  IsacBannerModel.swift
//  IsacBanner
//
//  Created by 신이삭 on 2023/08/05.
//

import Foundation

public struct IsacBannerModel {
    var imgUrl: String?
    var compeletion: (() -> Void)?
    
    public static func getDummy() -> [Self] {
        return [
            IsacBannerModel(imgUrl: "https://cdn.pixabay.com/photo/2015/12/06/09/15/maple-1079235_1280.jpg") {
                print("IsacBanner1 ClickEvent Occured!")
            },
            IsacBannerModel(imgUrl: "https://cdn.pixabay.com/photo/2015/12/06/09/15/maple-1079235_1280.jpg") {
                print("IsacBanner2 ClickEvent Occured!")
            },
            IsacBannerModel(imgUrl: "https://cdn.pixabay.com/photo/2015/12/06/09/15/maple-1079235_1280.jpg") {
                print("IsacBanner3 ClickEvent Occured!")
            }
        ]
    }
}
