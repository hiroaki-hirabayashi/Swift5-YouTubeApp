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
    
    //ヘッダー　メニュー画面
       override func segementSlideHeaderView() -> UIView? {
        let headerView = UIImageView()
        headerView.isUserInteractionEnabled = true
        headerView.contentMode = .scaleAspectFill
        headerView.image = UIImage(named: "header")
        headerView.translatesAutoresizingMaskIntoConstraints = false
        let headerHeight: CGFloat
        if #available(iOS 13.6, *) {
            headerHeight = view.frame.height/8 + view.safeAreaInsets.top
            } else {
                headerHeight = view.frame.height/8 + topLayoutGuide.length
            }
            headerView.heightAnchor.constraint(equalToConstant: headerHeight).isActive = true
            return headerView
        }
    
    //タブとタイトル
    override var titlesInSwitcher: [String] {
        return ["コロナ","犬","ニュース","お笑い","あたしンち","AAA",]
    }
    
    override func segementSlideContentViewController(at index: Int) -> SegementSlideContentScrollViewDelegate? {
        switch index {
        case 0:
            return Page1ViewController()
        case 1:
            return Page2ViewController()
        case 2:
            return Page3ViewController()
        case 3:
            return Page4ViewController()
        case 4:
            return Page5ViewController()
        case 5:
            return Page6ViewController()
        default:
            return Page1ViewController()
        }
    }


}

