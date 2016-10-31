//
//  ViewController.swift
//  sampleMiniGuideBook
//
//  Created by Eriko Ichinohe on 2016/02/11.
//  Copyright © 2016年 Eriko Ichinohe. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {

    @IBOutlet weak var myTableView: UITableView!
    var selectedName:String = ""
    
    var guideList:[NSString] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        //ファイルのパスを取得
        let filePath = Bundle.main.path(forResource: "guideList", ofType: "plist")
        
        //ファイルの内容を読み込んでディクショナリー型に代入
        let dic = NSDictionary(contentsOfFile: filePath!)
        
        //TableViewで扱いやすい形（エリア名の入ってる配列）を作成
        for(key,data) in dic!{
            guideList.append(key as! NSString)
            
        }

    }
    
    // 行数
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return guideList.count
    }
    
    // 表示するセルの中身
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: "myCell")
        //cell.textLabel!.text = "\(indexPath.row)行目"
        
        //文字色を茶色にする
        cell.textLabel?.textColor = UIColor.purple
        //矢印を右側につける
        cell.accessoryType = .disclosureIndicator
        
        cell.textLabel!.text = guideList[(indexPath as NSIndexPath).row] as String
        return cell
        
    }


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // 選択された時に行う処理
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("\((indexPath as NSIndexPath).row)行目を選択")
        selectedName = guideList[(indexPath as NSIndexPath).row] as String
        performSegue(withIdentifier: "showSecondView",sender: nil)
    }
    
    // Segueで画面遷移する時
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let secondVC = segue.destination as! secondViewController
        
        secondVC.scSelectedName = selectedName
    }


}

