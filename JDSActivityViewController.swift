import UIKit

open class JDSActivityViewController: UIActivityViewController {
    
    fileprivate let defaultMargin: CGFloat = 16
    fileprivate let maxURLHeight: CGFloat = 100
    fileprivate let linkLabelInset: CGFloat = 10
    fileprivate let linkViewBottomSpace: CGFloat = 10
    
    fileprivate let animationDuration = 0.3
    
    fileprivate let linkBlue = UIColor(red: 0.05, green: 0.39, blue: 1.0, alpha: 1.0)
    
    fileprivate var linkView: UIView!
    var linkLabel = UILabel()
    
    open var link: String? = nil {
        didSet {
            linkLabel.text = link
        }
    }
    weak var contentView: UIView!
    var contentSize: CGSize = .zero
    
    deinit {
        Swift.print (#function)
    }
    
    override open func viewDidLoad() {
        super.viewDidLoad()
        
        linkView = UIView()
        linkView.backgroundColor = .clear
        linkView.tag = 1
        linkLabel.textAlignment = .center
        linkLabel.textColor = .black
        linkLabel.numberOfLines = 4
        linkLabel.font = linkLabel.font.withSize(15)
        linkView.layer.cornerRadius = 16
        linkView.clipsToBounds = true
        
        let finalLinkSize = linkLabel.sizeThatFits(CGSize(width: view.frame.width - defaultMargin - 2*linkLabelInset, height: maxURLHeight))
        
        linkView.frame = CGRect(x: 0, y: (linkViewBottomSpace + finalLinkSize.height + 2*linkLabelInset), width: view.frame.width - defaultMargin, height: finalLinkSize.height + 2*linkLabelInset)
        linkLabel.frame = linkView.bounds.insetBy(dx: linkLabelInset, dy: linkLabelInset)
        
        linkView.addSubview(linkLabel)
        view.addSubview(linkView)
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(linkDidTap(_:)))
        linkLabel.addGestureRecognizer(tap)
        linkLabel.isUserInteractionEnabled = true
    }
    
    func linkDidTap (_ gesture: UITapGestureRecognizer) {
        
    }
    
    open override func viewDidLayoutSubviews() {
        view.layoutIfNeeded()
        
        
        for viewBase in self.view.subviews {
            if viewBase.tag == 0 {
                contentView = viewBase
            }
        }
        
        contentSize = preferredContentSize
        
        var size = contentSize
        let ht = linkView.frame.height
        size.height += ht
        
        preferredContentSize = size
        
        size.height = ht
        linkView.frame.origin.y = 0
        linkView.frame.size = size
        linkLabel.frame = linkView.bounds.insetBy(dx: linkLabelInset, dy: linkLabelInset)
        
        contentView.frame.origin.y = ht
    }
}

