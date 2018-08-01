//
//  ViewController.swift
//  test
//
//  Created by 番茄 on 7/24/18.
//  Copyright © 2018 fanqie. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let array = [ ["a", "b"], ["c", "d"] ]
        // 找出包含 d 的那一个数组元素
        let index = array.index(where: { $0.index(of: "f") != nil }) ?? 8
        print(index)
    }

    @IBAction func test(_ sender: Any) {
        let vc = MultipleChoiceController()
        self.navigationController?.pushViewController(vc, animated: true)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

