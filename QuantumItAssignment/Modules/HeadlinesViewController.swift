//
//  HeadlinesViewController.swift
//  QuantumItAssignment
//
//  Created by Sumayya Siddiqui on 25/08/23.
//

import UIKit
import Reachability
import MBProgressHUD

class HeadlinesViewController: UIViewController {
    
    @IBOutlet var lblHeadline: UILabel!
    @IBOutlet var collectionView: UICollectionView!
    
    var reachability: Reachability?
    var news: News?
    
    let dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        return formatter
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getNewsApi()

        let statusBarView = UIView(frame: UIApplication.shared.statusBarFrame)
        statusBarView.backgroundColor = .black
        view.addSubview(statusBarView)
        
        lblHeadline.font = UIFont(name: "RobotoSlab-Regular", size: 29)

    }
    override var preferredStatusBarStyle: UIStatusBarStyle {
          return .lightContent
      }
    
    
    @IBAction func btnBackTapped(_ sender: Any) {
        let headlinesVC = self.storyboard?.instantiateViewController(withIdentifier: "HeadlinesViewController") as! HeadlinesViewController
        self.navigationController?.pushViewController(headlinesVC, animated: true)
    }
    

}


extension HeadlinesViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return (self.news?.articles.count) ?? 0

    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "NewsCollectionViewCell", for: indexPath) as? NewsCollectionViewCell else { return UICollectionViewCell() }
            
            let item = news?.articles[indexPath.item]
            cell.lblAuthorName.text = item?.author
            cell.lblNewsHeadline.text = item?.title
        cell.lblDate.text = item?.publishedAt.formatted() // Use the publishedAt string directly
 
            cell.imgNews?.imageFromUrl(urlString: item?.urlToImage)
            
            return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
            guard let selectedArticle = news?.articles[indexPath.item] else {
                return
            }
            
            let newsDetailsVC = self.storyboard?.instantiateViewController(withIdentifier: "NewsDetailsViewController") as! NewsDetailsViewController
            newsDetailsVC.selectedArticle = selectedArticle
            self.navigationController?.pushViewController(newsDetailsVC, animated: true)
        }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let cellWidth: CGFloat = 361 // Set your desired width here
        let cellHeight: CGFloat = 230 // Set your desired height here
        return CGSize(width: cellWidth, height: cellHeight)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
            return 24.0
        }

    
  
}

extension HeadlinesViewController {
    func getNewsApi() {
        do {
            self.reachability = try Reachability.init()
        } catch {
            print("Unable tp start notifier")
        }
        if ((reachability?.connection) != .unavailable) {
            MBProgressHUD.showAdded(to: self.view, animated: true)
            
            guard let url = URL(string: APIManager.shared.newsApi) else { return }
            var request = URLRequest(url: url)
            request.httpMethod = "GET"
            request.addValue("application/json", forHTTPHeaderField: "Content-Type")
            
            APIManager.shared.load(urlRequest: request, type: News.self) { result in
                DispatchQueue.main.async {
                    MBProgressHUD.hide(for: self.view, animated: true)
                }
                switch result {
                case .success(let response):
                    self.news = response
                    self.collectionView.reloadData()
                    
                case .failure(let error):
                    print("error >>>>", error.localizedDescription)
                }
            }
        }
    }
}
