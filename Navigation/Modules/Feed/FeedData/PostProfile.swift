//
//  PostProfile.swift
//  TestOne
//
//  Created by Alexander on 02.03.2023.
//

import UIKit

struct Post {
        let author: String
        var description: String
        let image: String
        var likes: Int
        var views: Int
}

extension Post {
    static func make() -> [Post] {
        [Post(author: "Александр Барыкин",
              description: "I will ride the bike for a long time",
              image: "ImageOne",
              likes: 15,
              views: 38),
         Post(author: "Моральный кодекс",
              description: "Первый луч, первый дождь. По весеннему Арбату ты идешь. Первый звук, первый снег. Эта песня о тебе и обо мне",
              image: "ImageTwo",
              likes: 58,
              views: 104),
         Post(author: "Руки вверх",
              description: "Крошка моя, я по тебе скучаю я от тебя письма не получаю. Ты далеко и даже не скучала, но я вернусь, вернусь, чтоб ты узнала",
              image: "ImageThree",
              likes: 48,
              views: 89),
         Post(author: "Демо",
              description: "Солнышко в руках и венок из звёзд в небесах и с других планет все видят нас, мне так хорошо с тобой мечтать об этом",
              image: "ImageFour",
              likes: 34,
              views: 68)
        ]
    }
}
