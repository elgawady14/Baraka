//
//  StockTickerCell.swift
//  Baraka
//
//  Created by Ahmed Abduljawad on 27/05/2022.
//

import UIKit

class StockTickerCell: UICollectionViewCell {

    @IBOutlet weak var symbolLabel: UILabel!
    @IBOutlet weak var tickerImage: UIImageView!
    @IBOutlet weak var priceLabel: UILabel!
    var currentIndex = 0
    var stockTicker: StockTicker! {
        didSet {
            symbolLabel.text = stockTicker.symbol
            priceLabel.text = "$\((stockTicker.prices.randomElement() ?? 0).round())"
            tickerImage.image = UIImage(systemName: stockTicker.prices[currentIndex] > .zero ?  "arrowtriangle.up.fill" : "arrowtriangle.down.fill")
            tickerImage.tintColor = stockTicker.prices[currentIndex] > .zero ? UIColor.systemGreen : UIColor.systemRed
        }
    }
    override func awakeFromNib() {
        super.awakeFromNib()
    }

}
