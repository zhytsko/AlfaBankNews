import UIKit

class ListTableViewCell: UITableViewCell {
    
    let cellView: UIView = {
        let view = UIView()
        view.backgroundColor = .gray
        view.alpha = 0.5
        view.setCellShadow()
        return view
    }()
    
    let nameLabel: UILabel = {
        let name = UILabel()
        name.text = "Name"
        name.textAlignment = NSTextAlignment.center
        name.font = UIFont(name: name.font.fontName, size: 20)
        return name
    }()
    
    let descriptionLabel: UILabel = {
        let label = UILabel()
        label.text = "Description"
        label.numberOfLines = 0
        return label
    }()
    
    var task: URLSessionTask?
    
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
        addSubview(descriptionLabel)
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
                            paddingTop: 5,
                            paddingLeft: 20,
                            paddingRight: 20,
                            height: 20)
        
        descriptionLabel.setAnchor(top: nameLabel.bottomAnchor,
                                   left: nameLabel.rightAnchor,
                                   bottom: nameLabel.bottomAnchor,
                                   right: nameLabel.rightAnchor,
                                   paddingLeft: 20,
                                   paddingBottom: 5,
                                   paddingRight: 20)
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        task?.cancel()
    }
}
