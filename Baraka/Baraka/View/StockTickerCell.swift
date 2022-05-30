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
    var stockTicker: StockTicker! {
        didSet {
            symbolLabel.text = stockTicker.symbol
            // Randomly fetch a new price everytime the cell get loaded.
            let currentPriceIndex = stockTicker.prices.indices.randomElement() ?? 0
            let currentPrice = stockTicker.prices[currentPriceIndex].round()
            priceLabel.text = "$\(currentPrice)"
            tickerImage.image = UIImage(systemName: currentPrice > .zero ?  "arrowtriangle.up.fill" : "arrowtriangle.down.fill")
            tickerImage.tintColor = currentPrice > .zero ? UIColor.systemGreen : UIColor.systemRed
        }
    }
    override func awakeFromNib() {
        super.awakeFromNib()
    }

}
