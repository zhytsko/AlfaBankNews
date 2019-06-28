import UIKit

class ListTableViewCell: UITableViewCell {
    
    let cellView: UIView = {
        let view = UIView()
        view.backgroundColor = .red
        view.alpha = 0.5
        view.setCellShadow()
        return view
    }()
    
    let nameLabel: UILabel = {
        let name = UILabel()
        name.text = "Name"
        name.textAlignment = NSTextAlignment.center
        name.font = UIFont(name: name.font.fontName, size: 20)
        name.numberOfLines = 0
        return name
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setup() {
        addSubview(cellView)
        addSubview(nameLabel)
        cellView.setAnchor(top: topAnchor,
                           left: leftAnchor,
                           bottom: bottomAnchor,
                           right: rightAnchor,
                           paddingTop: 4,
                           paddingLeft: 8,
                           paddingBottom: 4,
                           paddingRight: 8)
        
        nameLabel.setAnchor(top: topAnchor,
                            left: leftAnchor,
                            right: rightAnchor,
                            paddingLeft: 5,
                            paddingRight: 5)
        
        nameLabel.centerYAnchor.constraint(equalTo: cellView.centerYAnchor).isActive = true
    }
    
}
