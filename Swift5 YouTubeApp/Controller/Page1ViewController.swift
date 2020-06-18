//
//  Page1ViewController.swift
//  Swift5 YouTubeApp
//
//  Created by 平林宏淳 on 2020/06/18.
//  Copyright © 2020 Hiroaki_Hirabayashi. All rights reserved.
//

import UIKit
import SegementSlide
import Alamofire
import SwiftyJSON
import SDWebImage

class Page1ViewController: UITableViewController, SegementSlideContentScrollViewDelegate {

    var youtubeData = YouTubeData()
    
    var videoIdArray = [String]()
    var publishedAtArray = [String]()
    var titleArray = [String]()
    var imageURLStringArray = [String]()
    var youtubeURLArray = [String]()
    var channelTitleArray = [String]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    var scrollView: UIScrollView {
        return tableView
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
