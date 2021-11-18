//
//  TabCollectionViewCell.swift
//  LatteIsHorse
//
//  Created by miori Lee on 2021/11/18.
//

import UIKit

class TabCollectionViewCell: UICollectionViewCell {
    
    static let registerID = "\(TabCollectionViewCell.self)"
    
    var tabLabel : UILabel = {
        let label = UILabel()
        label.font = UIFont.Pretendard(.regular, size: 14)
        label.textColor = .lhgray5
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override func awakeFromNib() {
        super.awakeFromNib()

        // Initialization code
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .none
        _ = [tabLabel].map {self.addSubview($0)}
        bindConstraints()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        self.backgroundColor = .none
        _ = [tabLabel].map {self.addSubview($0)}
        bindConstraints()
    }

    
    private func bindConstraints() {
        NSLayoutConstraint.activate([
            tabLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            tabLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor)
        ])
    }
    
    var collectionView : UICollectionView?

    override var isSelected: Bool {
            didSet {
                //menuLabel.font = isSelected ? .boldSystemFont(ofSize: 14) : .boldSystemFont(ofSize: 14)
                tabLabel.font = isSelected ?  UIFont.Pretendard(.semiBold, size: 14) : UIFont.Pretendard(.regular, size: 14)
                tabLabel.textColor = isSelected ? .btnBlue : .lhgray5
                tabLabel.text = isSelected ? "#\(tabLabel.text!)" : tabLabel.text!.replacingOccurrences(of: "#", with: "")
            }
        }

}


