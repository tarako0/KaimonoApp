//
//  ViewController.swift
//  
//  
//  Created by (admin) on 2023/05/28
//  
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UITextViewDelegate{
    
    let label = UILabel()
    let textView = UITextView()
    let itemTableView = UITableView()
    let labelMemo = UILabel()
    let memoTextView = UITextView()
    var demoArray = ["りんご","バナナ","スイカ","メロン","パイナップル","キウイ","いちご","マスカット","ぶどう","もも"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUIs()
    }
    
    //画面がタップした時に呼ばれる
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        //キーボードを閉じる
        textView.resignFirstResponder()
        memoTextView.resignFirstResponder()
    }
    
    //UIを作成
    func setupUIs(){
        let guide = view.safeAreaLayoutGuide
        
        //背景色の設定
        view.backgroundColor = .systemGray5
        
        //ラベルをつくる"買い物リスト"
        view.addSubview(label)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.topAnchor.constraint(equalTo: guide.topAnchor, constant: 50).isActive = true
        label.leadingAnchor.constraint(equalTo: guide.leadingAnchor, constant: view.frame.width*0.1).isActive = true
        label.trailingAnchor.constraint(equalTo: guide.trailingAnchor, constant: -view.frame.width*0.1).isActive = true
        label.text = "買い物リスト"
        label.font = UIFont.preferredFont(forTextStyle: .title1)
        
        //買うものを入力するtextViewを作成
        view.addSubview(textView)
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.backgroundColor = .white
        textView.layer.cornerRadius = 10
        textView.font = UIFont.systemFont(ofSize: 16)
        textView.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 10).isActive = true
        textView.leadingAnchor.constraint(equalTo: guide.leadingAnchor, constant: view.frame.width*0.1).isActive = true
        textView.trailingAnchor.constraint(equalTo: guide.trailingAnchor, constant: -view.frame.width*0.1).isActive = true
        textView.heightAnchor.constraint(equalToConstant: 50).isActive = true
        textView.delegate = self
        //        textView.pa = "タップして入力"
        textView.textColor = .darkGray
        
        //買うものを一覧表示するtableViewを作成
        view.addSubview(itemTableView)
        itemTableView.translatesAutoresizingMaskIntoConstraints = false
        itemTableView.topAnchor.constraint(equalTo: textView.bottomAnchor, constant: 10).isActive = true
        itemTableView.leadingAnchor.constraint(equalTo: guide.leadingAnchor, constant: view.frame.width*0.1).isActive = true
        itemTableView.trailingAnchor.constraint(equalTo: guide.trailingAnchor, constant: -view.frame.width*0.1).isActive = true
        itemTableView.heightAnchor.constraint(equalToConstant: 300).isActive = true
        itemTableView.backgroundColor = .clear
        itemTableView.delegate = self
        itemTableView.dataSource = self
        itemTableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        itemTableView.tableFooterView = UIView()
        itemTableView.separatorStyle = .none
        
        //ラベルをつくる"メモ"
        view.addSubview(labelMemo)
        labelMemo.translatesAutoresizingMaskIntoConstraints = false
        labelMemo.topAnchor.constraint(equalTo: itemTableView.bottomAnchor, constant: 50).isActive = true
        labelMemo.leadingAnchor.constraint(equalTo: guide.leadingAnchor, constant: view.frame.width*0.1).isActive = true
        labelMemo.trailingAnchor.constraint(equalTo: guide.trailingAnchor, constant: -view.frame.width*0.1).isActive = true
        labelMemo.text = "メモ"
        labelMemo.font = UIFont.preferredFont(forTextStyle: .title1)
        
        //メモを入力するTextViewを作成
        view.addSubview(memoTextView)
        memoTextView.translatesAutoresizingMaskIntoConstraints = false
        memoTextView.topAnchor.constraint(equalTo: labelMemo.bottomAnchor, constant: 10).isActive = true
        memoTextView.leadingAnchor.constraint(equalTo: guide.leadingAnchor, constant: view.frame.width*0.1).isActive = true
        memoTextView.trailingAnchor.constraint(equalTo: guide.trailingAnchor, constant: -view.frame.width*0.1).isActive = true
        memoTextView.heightAnchor.constraint(equalToConstant: 200).isActive = true
        memoTextView.backgroundColor = .systemIndigo
        memoTextView.font = UIFont.systemFont(ofSize: 14)
        memoTextView.textColor = .darkGray
        memoTextView.text = ""
        memoTextView.backgroundColor = .white
        memoTextView.layer.cornerRadius = 10
        //        outlineTextView.textContainerInset = UIEdgeInsets.zero
        //        outlineTextView.textContainer.lineFragmentPadding = 0
        //        outlineTextView.isScrollEnabled = false
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        demoArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = "・"+demoArray[indexPath.row]
        cell.backgroundColor = .clear
        cell.textLabel?.textColor = .darkGray
        
        return cell
    }
    
    
}


