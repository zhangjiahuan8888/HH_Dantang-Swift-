//
//  HHDanTangCell.swift
//  HH_Dantang(Swift)
//
//  Created by 张家欢 on 16/8/5.
//  Copyright © 2016年 zhangjiahuan. All rights reserved.
//

import UIKit

class HHDanTangCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    //重写init方法
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    var homeItem: HHHomeItem? {
        didSet {
            let url = homeItem!.cover_image_url
            imgView.kf_setImageWithURL(NSURL(string: url!)!, placeholderImage: nil, optionsInfo: nil, progressBlock: nil) { (image, error, cacheType, imageURL) in
                //                self.placeholderBtn.hidden = true
            }
            titleLabel.text = homeItem!.title
            //            favoriteBtn.setTitle(" " + String(homeItem!.likes_count!) + " ", forState: .Normal)
        }
    }
    
    private func setupUI(){
        self.backgroundColor = UIColor.whiteColor()
        contentView.addSubview(imgView)
        imgView.snp_makeConstraints { (make) in
            make.edges.equalTo(contentView).inset(UIEdgeInsetsMake(0, 10, 10, 10))//上左下右
        }
        
        imgView.addSubview(titleLabel)
        titleLabel.snp_makeConstraints { (make) in
            make.left.equalTo(imgView).offset(5)
            make.bottom.equalTo(imgView).offset(-5)
        }
    }
    
    private lazy var imgView: UIImageView = {
        let imgV = UIImageView()
        imgV.layer.cornerRadius = 6
        imgV.layer.masksToBounds = true
        imgV.userInteractionEnabled = true
        return imgV
    }()
    
    private lazy var titleLabel:UILabel = {
        let label = UILabel()
        label.textColor = UIColor.whiteColor()
        return label
    }()

 
}
