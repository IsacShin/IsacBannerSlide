//
//  BannerView.swift
//  IsacBanner
//
//  Created by 신이삭 on 2023/08/04.
//
import UIKit
import SnapKit
import Then
import Kingfisher

class BannerView: UIView {

    private var bannerCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 0 // 셀 간의 가로 간격 설정

        layout.scrollDirection = .horizontal // 가로 스크롤로 변경
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.register(BannerCell.self, forCellWithReuseIdentifier: "BannerCell")
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.showsVerticalScrollIndicator = false
        collectionView.backgroundColor = .clear
        collectionView.isPagingEnabled = true
        return collectionView
    }()
    
    private var pageView: UIPageControl = UIPageControl()
    private var indicatorStackView: UIStackView = UIStackView()
    private var stackView = UIStackView()
    private var cp: Int = 0 {
        didSet {
            self._updateIndicators(_cp: cp)
        }
    }
    var list: [IsacBannerModel] = []
    var bannerHeight: CGFloat = 90 {
        didSet {
            self.bannerCollectionView.do {
                $0.snp.makeConstraints { make in
                    make.height.equalTo(bannerHeight)
                }
            }
        }
    }
    
    var pageDotBorderColor: UIColor = .black
    var pageDotColor: UIColor = .white
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.commonInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        self.commonInit()
    }
    
    convenience init(list: [IsacBannerModel], pageDotColor: UIColor, pageDotBorderColor: UIColor) {
        self.init()
        self.list = list
        self.pageDotColor = pageDotColor
        self.pageDotBorderColor = pageDotBorderColor
        self.createPageView()
    }

    
    // MARK: - view setting
    private func commonInit() {
        self.settingSubviews()
    }
     
    private func settingSubviews() {
        self.backgroundColor = .clear
        
        self.bannerCollectionView.do {
            $0.delegate = self
            $0.dataSource = self
        }
        
        self.pageView.do {
            $0.hidesForSinglePage = true
            $0.numberOfPages = list.count
        }
        
        self.stackView.do {
            $0.axis = .vertical
            $0.spacing = 20
            $0.addArrangedSubview(self.bannerCollectionView)
            
            self.indicatorStackView.do {
                $0.axis = .horizontal
                $0.spacing = 5
                $0.alignment = .center
            }
            
            let v = UIView()
            v.addSubview(self.indicatorStackView)
            
            self.indicatorStackView.snp.makeConstraints { make in
                make.centerX.centerY.equalToSuperview()
            }
            
            $0.addArrangedSubview(v)

            
            self.addSubview($0)
            $0.snp.makeConstraints { make in
                make.top.bottom.leading.trailing.equalToSuperview()
            }

        }
        
    }
        
    private func createPageView() {
        for child in indicatorStackView.subviews {
            child.removeFromSuperview()
        }
        
        if list.count > 1 { // 단일 배너일시, 페이지뷰 비노출
            for i in 0..<list.count {
                let view = UIView()
                
                view.snp.makeConstraints { (make) in
                    make.width.height.equalTo(6)
                }
         
                view.clipsToBounds = true
                view.layer.cornerRadius = 3
                
                view.backgroundColor = .white
                view.layer.borderWidth = 1.0
                view.layer.borderColor = pageDotBorderColor.cgColor
                view.tag = i
                
                indicatorStackView.addArrangedSubview(view)
            }
        }
        
        // 현재 페이지 초기화
        cp = 0
    }
    
    private func _updateIndicators(_cp:Int) {
        for child in indicatorStackView.subviews {
            if cp == child.tag {
                child.backgroundColor = pageDotColor
            }else {
                child.backgroundColor = UIColor.white
            }
        }
    }
}

extension BannerView:UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return list.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let row = indexPath.row
        guard let cell = bannerCollectionView.dequeueReusableCell(withReuseIdentifier: "BannerCell", for: indexPath) as? BannerCell else {
            fatalError("Undefined Cell")
        }
        
        guard self.list.count > row else {
            return cell
        }
        
        let item = list[indexPath.row]
        
        cell.imageView.layer.cornerRadius = 8
        cell.imageView.clipsToBounds = true
        
        if let value = item.imgUrl {
            if let url = URL(string:value) {
                cell.imageView.kf.setImage(with: url, completionHandler:  { result in
                    switch result {
                    case .success(let value):
                        cell.imageView.image = value.image
                        cell.layoutIfNeeded()
                    case .failure(let err):
                        print("Error: \(err)")
                    }
                })
            }
        }
                
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let row     = indexPath.row
        let item    = self.list[row]
        
        if let handler = item.compeletion {
            handler()
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: bannerCollectionView.frame.size.width  , height: bannerCollectionView.frame.height)
    }
    
    //컬렉션뷰 감속 끝났을 때 현재 페이지 체크
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        cp = Int(scrollView.contentOffset.x) / Int(scrollView.frame.width)
        self.pageView.currentPage = cp
    }
    
}
