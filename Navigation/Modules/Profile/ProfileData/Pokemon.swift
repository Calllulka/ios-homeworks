//
//  Pokemon.swift
//  TestOne
//
//  Created by Alexander on 07.03.2023.
//
import UIKit

struct Pokemon {
    
    let name: String
    
    static func makeArray() -> [UIImage] {
        let array = [UIImage(named: "Image-1")!,
        UIImage(named: "Image-2"),
        UIImage(named: "Image-3"),
        UIImage(named: "Image-4"),
        UIImage(named: "Image-5"),
        UIImage(named: "Image-6"),
        UIImage(named: "Image-7"),
        UIImage(named: "Image-8"),
        UIImage(named: "Image-9"),
        UIImage(named: "Image-10"),
        UIImage(named: "Image-11"),
        UIImage(named: "Image-12"),
        UIImage(named: "Image-13"),
        UIImage(named: "Image-14"),
        UIImage(named: "Image-15"),
        UIImage(named: "Image-16"),
        UIImage(named: "Image-17"),
        UIImage(named: "Image-18"),
        UIImage(named: "Image-19"),
        UIImage(named: "Image-20")
        ]
        return array.compactMap { $0 }
    }
}
