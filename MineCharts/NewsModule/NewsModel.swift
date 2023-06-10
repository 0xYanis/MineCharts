//
//  NewsModel.swift
//  MineCharts
//
//  Created by Yan Rybkin on 09.06.2023.
//

import Foundation

struct NewsModel: Identifiable {
    var id = UUID()
    var image: String
    var title: String
    var newsText: String
    var date: String
}

var fakeNews: [NewsModel] = [
    .init(
        image: "https://images.unsplash.com/photo-1628151015854-bc84256af7d4?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1172&q=80",
        title: "Bitcoin преодолел отметку в $26,000",
        newsText: "В четверг курс Bitcoin достиг отметки в $26,000 и стал наивысшим с момента падения курса криптовалюты в 2021 году.",
        date: "25.05.2023"),
    .init(
        image: "https://i.imgur.com/938bEk9.jpeg",
        title: "Курс Ethereum вырос на 11%",
        newsText: "Курс Ethereum вырос на 11% после того, как генеральный директор Tesla Илон Маск объявил, что его компания будет принимать эту криптовалюту в качестве оплаты за свою продукцию.",
        date: "24.05.2023"),
    .init(
        image: "https://images.unsplash.com/photo-1621932953986-15fcf084da0f?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1172&q=80",
        title: "Dogecoin взлетает на фоне информации о запуске SpaceX",
        newsText: "Криптовалюта Dogecoin выросла на 50% после того, как Илон Маск заявил, что его компания SpaceX запустит на Луну миссию, которая будет финансироваться этой криптовалютой.",
        date: "12.05.2023"),
    .init(
        image: "https://images.unsplash.com/photo-1642525027649-00d7397a6d4a?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1170&q=80",
        title: "Рынок NFT переживает бум",
        newsText: "Рынок цифровых активов, именуемых NFT, переживает бум. Художники, музыканты и спортсмены продавали свои произведения за миллионы долларов.",
        date: "22.04.2023"),
    .init(
        image: "https://images.unsplash.com/photo-1568044941821-bf7e9075c4e0?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=627&q=80",
        title: "Китай увеличил производство Bitcoin",
        newsText: "Китай стал лидером по добыче Bitcoin, увеличив число мощностей майнинга.",
        date: "20.04.2023"),
    .init(
        image: "https://images.unsplash.com/photo-1541185933-ef5d8ed016c2?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1170&q=80",
        title: "Elon Musk объявил, что SpaceX начнет майнить Bitcoin на Марсе",
        newsText: "Илон Маск объявил о планах майнинга Bitcoin на Марсе с помощью компании SpaceX. Он также назвал криптовалюту важным элементом будущей колонизации Марса.",
        date: "15.04.2023"),
    .init(
        image: "https://images.unsplash.com/photo-1611974789855-9c2a0a7236a3?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1170&q=80",
        title: "Курс Bitcoin резко упал",
        newsText: "Курс Bitcoin резко упал на 10%, что вызвало панику среди инвесторов. Эксперты связывают это с решением правительственных регуляторов пересмотреть законы относительно криптовалют.",
        date: "14.04.2023"),
    .init(
        image: "https://images.unsplash.com/photo-1582280871722-424e91cbee8b?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1074&q=80",
        title: "Майнеры Bitcoin начали переход на углерод-нейтральное электропитание",
        newsText: "Майнеры Bitcoin начали переход на углерод-нейтральное электропитание в своей деятельности, что может существенно сократить негативное влияние криптомайнинга на климат.",
        date: "10.04.2023"),
    .init(
        image: "https://images.unsplash.com/photo-1671723421737-b0bd366843f6?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=687&q=80",
        title: "Coinbase выходит на IPO",
        newsText: "Крупнейшая в мире криптовалютная биржа Coinbase выходит на IPO и ожидает получить более $100 млрд оценки в результате первичного публичного предложения своих акций.",
        date: "02.04.2023")
]

