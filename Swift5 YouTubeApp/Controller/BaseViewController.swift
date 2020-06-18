//
//  BaseViewController.swift
//  Swift5 YouTubeApp
//
//  Created by 平林宏淳 on 2020/06/18.
//  Copyright © 2020 Hiroaki_Hirabayashi. All rights reserved.
//

import UIKit
import SegementSlide


class BaseViewController: SegementSlideDefaultViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        defaultSelectedIndex = 0
        reloadData()
//        scrollToSlide(at: 0, animated: true)
    }
    
    //ヘッダー
    override func segementSlideHeaderView() -> UIView? {
        let headerView = UIImageView()
        headerView.isUserInteractionEnabled = true
        headerView.contentMode = .scaleAspectFill
        headerView.image = UIImage(named: "header")
        headerView.translatesAutoresizingMaskIntoConstraints = false
        let headerHeight: CGFloat
        if #available(iOS 11.0, *) {
            headerHeight = view.frame.height/4 + view.safeAreaInsets.top
            } else {
                headerHeight = view.frame.height/4 + topLayoutGuide.length
            }
            headerView.heightAnchor.constraint(equalToConstant: headerHeight).isActive = true
            return headerView
        }
    
    //タブ
    override var titlesInSwitcher: [String] {
        return ["IT","犬","ニュース","お笑い","料理","AAA",]
    }
    
    
        
        
        


}

