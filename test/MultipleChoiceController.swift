//
//  MultipleChoiceTableViewController.swift
//  test
//
//  Created by 番茄 on 7/24/18.
//  Copyright © 2018 fanqie. All rights reserved.
//

import UIKit

class MultipleChoiceController: UIViewController,UITableViewDataSource, UITableViewDelegate, MultipleChoiceDelegate {
    
    
    
    var table: UITableView!
    var bottmView: UIView!
    var dataArray : NSMutableArray!
    var suspendBtn : UIButton!
    var updataBtn : UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let dic = MultipleChoiceController.getData()
        
        dataArray = NSMutableArray();
        for _ in 0..<10 {
            dataArray.add(dic)
        }
        print(dataArray)
        
        
        table = UITableView()
        table.separatorStyle = UITableViewCellSeparatorStyle.none
        table.showsVerticalScrollIndicator = false
        //设置数据源
        table.dataSource = self
        //设置代理
        table.delegate = self
        table.backgroundColor = UIColor.init(red: 250.0/255.0, green: 250.0/255.0, blue: 250.0/255.0, alpha: 1.0)
        self.view.addSubview(table)
        //设置estimatedRowHeight属性默认值
        //        table.estimatedRowHeight = 44;
        //        //rowHeight属性设置为UITableViewAutomaticDimension
        //        table.rowHeight = UITableViewAutomaticDimension;
        
        
        bottmView = UIView()
        bottmView.backgroundColor = UIColor.white
        view.addSubview(bottmView)
        
        suspendBtn = UIButton()
        suspendBtn.setTitle("暂存", for: .normal)
        suspendBtn.layer.borderWidth = 0.5
        suspendBtn.tag = 1;
        suspendBtn.layer.borderColor = UIColor.lightGray.cgColor
        suspendBtn.titleLabel?.font =  UIFont.systemFont(ofSize: 15)
        suspendBtn.setTitleColor(UIColor.lightGray, for: .normal)
        suspendBtn.addTarget(self, action: #selector(updataAciton(button:)), for: .touchUpInside)
        bottmView.addSubview(suspendBtn)
        
        updataBtn = UIButton()
        updataBtn.setTitle("提交并完成测评", for: .normal)
        updataBtn.tag = 2;
        updataBtn.titleLabel?.font =  UIFont.systemFont(ofSize: 15)
        updataBtn.addTarget(self, action: #selector(updataAciton(button:)), for: .touchUpInside)
        updataBtn.backgroundColor = UIColor.red
        bottmView.addSubview(updataBtn)
        
        setFrameConstraints();
    }
    
    func setFrameConstraints(){
        bottmView.snp.makeConstraints { (make) in
            make.left.equalTo(view).offset(0)
            make.right.equalTo(view).offset(0)
            make.bottom.equalTo(view.snp.bottom).offset(0)
            make.height.equalTo(44)
        }
        suspendBtn.snp.makeConstraints { (make) in
            make.left.equalTo(bottmView).offset(-1)
            make.top.equalTo(bottmView).offset(0)
            make.bottom.equalTo(bottmView.snp.bottom).offset(0)
            make.width.equalTo(view.frame.size.width * 0.4)
        }
        updataBtn.snp.makeConstraints { (make) in
            make.left.equalTo(suspendBtn.snp.right).offset(-1)
            make.right.equalTo(bottmView).offset(0)
            make.top.equalTo(bottmView).offset(0)
            make.bottom.equalTo(bottmView).offset(0)
        }
        
        table.snp.makeConstraints { (make) in
            make.left.equalTo(view).offset(0)
            make.right.equalTo(view).offset(0)
            make.top.equalTo(view).offset(0)
            make.bottom.equalTo(bottmView.snp.top).offset(0)
        }
    }
    
    
    @objc func updataAciton(button:UIButton) {
        switch button.tag {
        case 1:
            break
            
        case 2:
            break
            
        default:
            break
            
        }
    }
    func selectResult(parma: String) {
        
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Table view data source
    
    func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return dataArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let indentifier = "ChoiceCell" + String(format: "%d%d", indexPath.row,indexPath.section)
        var cell:MultipleChoiceCell! = tableView.dequeueReusableCell(withIdentifier: indentifier)as?MultipleChoiceCell
        if cell == nil {
            cell = MultipleChoiceCell(style: .default, reuseIdentifier: indentifier, cellData:dataArray[indexPath.row] as! NSDictionary)
        }
        cell.delegate = self;
        cell.selectionStyle = UITableViewCellSelectionStyle.none
        cell.backgroundColor = UIColor.init(red: 250.0/255.0, green: 250.0/255.0, blue: 250.0/255.0, alpha: 1.0)
        return cell
    }
    
    
    /*
     // Override to support conditional editing of the table view.
     override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
     // Return false if you do not want the specified item to be editable.
     return true
     }
     */
    
    /*
     // Override to support editing the table view.
     override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
     if editingStyle == .delete {
     // Delete the row from the data source
     tableView.deleteRows(at: [indexPath], with: .fade)
     } else if editingStyle == .insert {
     // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
     }
     }
     */
    
    /*
     // Override to support rearranging the table view.
     override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
     
     }
     */
    
    /*
     // Override to support conditional rearranging of the table view.
     override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
     // Return false if you do not want the item to be re-orderable.
     return true
     }
     */
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
    static func  getData() -> NSDictionary {
        let mutable1 : NSMutableDictionary = NSMutableDictionary()
        mutable1.setObject("不符合", forKey:"question"  as NSCopying)
        mutable1.setObject(1, forKey:"answer"  as NSCopying)
        
        
        let mutable2 : NSMutableDictionary = NSMutableDictionary()
        mutable2.setObject("不太符合", forKey:"question"  as NSCopying)
        mutable2.setObject(0, forKey:"answer"  as NSCopying)
        
        
        let mutable3 : NSMutableDictionary = NSMutableDictionary()
        mutable3.setObject("中等", forKey:"question"  as NSCopying)
        mutable3.setObject(0, forKey:"answer"  as NSCopying)
        
        let mutable4 : NSMutableDictionary = NSMutableDictionary()
        mutable4.setObject("符合", forKey:"question"  as NSCopying)
        mutable4.setObject(0, forKey:"answer"  as NSCopying)
        
        let mutable5 : NSMutableDictionary = NSMutableDictionary()
        mutable5.setObject("完全符合", forKey:"question"  as NSCopying)
        mutable5.setObject(0, forKey:"answer"  as NSCopying)
        
        let arry:[NSDictionary] =  [mutable1, mutable2, mutable3,mutable4,mutable5]
        
        
        
        
        
        
        let dicAll : NSMutableDictionary = NSMutableDictionary()
        dicAll.setObject("在幼儿园或学校里遵守各项常规和纪律", forKey:"title"  as NSCopying)
        dicAll.setObject(arry, forKey:"data"  as NSCopying)
        
        
        
        
        
        //        muArray.add(mutable1)
        //        muArray.add(mutable2)
        //        muArray.add(mutable1)
        //        muArray.add(mutable2)
        //        muArray.add(mutable1)
        //
        //
        //        let muArrayAll = NSMutableArray()
        return dicAll
    }
}
