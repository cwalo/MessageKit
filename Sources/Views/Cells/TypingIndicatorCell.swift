/*
 MIT License
 
 Copyright (c) 2017 MessageKit
 
 Permission is hereby granted, free of charge, to any person obtaining a copy
 of this software and associated documentation files (the "Software"), to deal
 in the Software without restriction, including without limitation the rights
 to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 copies of the Software, and to permit persons to whom the Software is
 furnished to do so, subject to the following conditions:
 
 The above copyright notice and this permission notice shall be included in all
 copies or substantial portions of the Software.
 
 THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
 SOFTWARE.
 */

import UIKit

open class TypingIndicatorCell: UICollectionViewCell, CollectionViewReusable {
    open class func reuseIdentifier() -> String { return "messagekit.cell.typing-indicator" }
    
    // MARK: - Properties
    
    open var indicatorView = UIView()
    
    // MARK: - Initializer
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        setupSubviews()
        contentView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    open override func apply(_ layoutAttributes: UICollectionViewLayoutAttributes) {
        super.apply(layoutAttributes)
        
        guard let attributes = layoutAttributes as? MessagesCollectionViewLayoutAttributes else { return }
        
        indicatorView.frame = attributes.typingIndicatorFrame
    }
    
    // MARK: - Methods
    
    internal func setupSubviews() {
        contentView.addSubview(indicatorView)
    }
    
    open func configure(in collectionView: MessagesCollectionView) {
        guard let indicatorDelegate = collectionView.typingIndicatorDelegate else { return }
        indicatorView = indicatorDelegate.viewForTypingIndicator()
        indicatorView.frame = indicatorDelegate.frameForIndicatorView()
        setupSubviews()
    }
    
}
