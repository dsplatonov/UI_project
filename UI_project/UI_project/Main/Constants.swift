//
//  Constants.swift
//  Constants
//
//  Created by Дмитрий on 13.09.2021.
//

import UIKit

enum Constants {
    
    enum Storyboard {
        
    }
    
    enum Cell {
        static let example: String = "ExampleCell"
        static let exampleSecond: String = "ExampleSecondCell"
        static let exampleCollection: String = "ExampleCollection"
        static let drawing: String = "DrawingCell"
        static let header: String = "HeaderFooterForDrawing"
        static let news: String = "NewsTableViewCell"
    }
    
    enum Nib {
        static let header: UINib = .init(nibName: "HeaderFooterForDrawing", bundle: nil)
        static let news: UINib = .init(nibName: "NewsTableViewCell", bundle: nil)
    }
}
