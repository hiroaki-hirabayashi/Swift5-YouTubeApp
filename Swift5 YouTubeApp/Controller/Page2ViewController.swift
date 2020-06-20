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

class Page2ViewController: UITableViewController, SegementSlideContentScrollViewDelegate {

    var youtubeData = YouTubeData()
    
    var videoIdArray = [String]()
    var publishedAtArray = [String]()
    var titleArray = [String]()
    var thumbnailsArray = [String]()
    var youtubeURLArray = [String]()
    var channelTitleArray = [String]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        getData()

    }
    
    var scrollView: UIScrollView {
        return tableView
    }
    // sectionの数を返す
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    // sectionごとのcellの数を返す
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return titleArray.count
    }
    
    //セルの内容、情報
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .subtitle, reuseIdentifier: "Cell")
        cell.selectionStyle = .none
        let profileImageURL = URL(string: self.thumbnailsArray[indexPath.row] as String)
        cell.imageView?.sd_setImage(with: profileImageURL, completed: nil)
        cell.textLabel?.text = self.titleArray[indexPath.row]
        cell.detailTextLabel?.text = self.publishedAtArray[indexPath.row]
        //Labelの行数を可変にする
        cell.textLabel?.adjustsFontSizeToFitWidth = true
        cell.detailTextLabel?.adjustsFontSizeToFitWidth = true
        cell.textLabel?.numberOfLines = 5
        cell.detailTextLabel?.numberOfLines = 5
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let indexNumber = indexPath.row
        let webViewController = WebViewController()
        let url = youtubeURLArray[indexNumber]
        UserDefaults.standard.set(url, forKey: "url")
        present(webViewController, animated: true, completion: nil)
    }
    
    //セルの高さ
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return view.frame.size.height/5
    }
    
    
    func getData() {
        
        var text = "https://www.googleapis.com/youtube/v3/search?key=APIKEY&q=犬&part=snippet&maxResults=40&order=date"
        let url = text.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
        
        //requestを送る
        AF.request(url!, method: .get, parameters: nil, encoding: JSONEncoding.default).responseJSON { (response) in
            
            //　JSON解析　40個値が来るのでfor文で配列に入れる
            switch response .result {
            case .success:
                for i in 0...39 {
                    let json: JSON = JSON(response.data as Any)
                    let videoId = json["items"][i]["id"]["videoId"].string
                    let publishedAt = json["items"][i]["snippet"]["publishedAt"].string
                    let title = json["items"][i]["snippet"]["title"].string
                    let thumbnails = json["items"][i]["snippet"]["thumbnails"]["default"]["url"].string
                    let youtubeURL = "https://www.youtube.com/watch?v=\(videoId)"
                    let channelTitle = json["items"][i]["snippet"]["channelTitle"].string
                    
                    self.videoIdArray.append(videoId!)
                    self.publishedAtArray.append(publishedAt!)
                    self.titleArray.append(title!)
                    self.thumbnailsArray.append(thumbnails!)
                    self.youtubeURLArray.append(youtubeURL)
                    self.channelTitleArray.append(channelTitle!)
                }
                
                break
            case .failure(let error):
                break
            }
            self.tableView.reloadData()
        }
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
