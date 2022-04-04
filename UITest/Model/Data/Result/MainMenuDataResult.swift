import x3UI

@objc final class MainMenuDataResult: CustomTableViewDataResult {
    var items: [MainMenuDataSection] = Array()
    enum CodingKeys: String, CodingKey {
        case items
    }
    required init(from decoder: Decoder) throws {
        try super.init(from: decoder)
        let _container = try decoder.container(keyedBy: CodingKeys.self)
        self.items = try _container.decodeIfPresent([MainMenuDataSection].self, forKey: .items) ?? Array()
    }
    public required init(data: NSDictionary?) {
        super.init(data: data)
        for _item in data?["items"] as? NSArray ?? [] {
            self.items.append(MainMenuDataSection(data: _item as? NSDictionary))
        }
    }
    override func section<T>(_ section: Int) -> T? where T : CustomTableViewDataSection {
        if self.items.indices.contains(section) {
            return items[section] as? T
        } else {
            return nil
        }
    }
}
@objc final class MainMenuDataSection: CustomTableViewDataSection {
    @objc var imageName: String = ""
    var items: [MainMenuDataItem] = Array()
    
    enum CodingKeys: String, CodingKey {
        case imageName
        case items
    }
    public required init(from decoder: Decoder) throws {
        try super.init(from: decoder)
        let _container = try decoder.container(keyedBy: CodingKeys.self)
        self.imageName = try _container.decodeIfPresent(String.self, forKey: .imageName) ?? ""
        self.items = try _container.decodeIfPresent([MainMenuDataItem].self, forKey: .items) ?? Array()
    }
    public required init(data: NSDictionary?) {
        super.init(data: data)
        self.imageName = data?["imageName"] as? String ?? ""
        self.items.removeAll()
        for _item in data?["items"] as? NSArray ?? [] {
            self.items.append(MainMenuDataItem(data: _item as? NSDictionary))
        }
    }
    override func item<T>(_ item: Int) -> T? where T : CustomTableViewDataItem {
        if self.items.indices.contains(item) {
            return items[item] as? T
        } else {
            return nil
        }
    }
}
@objc final class MainMenuDataItem: CustomTableViewDataItem {
    @objc var posIndex: Int = -1
    @objc var isFavorite: Bool = false
    @objc var imageName: String = ""
    
    enum CodingKeys: String, CodingKey {
        case posIndex
        case isFavorite
        case imageName
    }
    public required init(from decoder: Decoder) throws {
        try super.init(from: decoder)
        let _container = try decoder.container(keyedBy: CodingKeys.self)
        self.posIndex = try _container.decodeIfPresent(Int.self, forKey: .posIndex) ?? -1
        self.isFavorite = try ((_container.decodeIfPresent(Int.self, forKey: .isFavorite) ?? 0) == 1)
        self.imageName = try _container.decodeIfPresent(String.self, forKey: .imageName) ?? ""
    }
    public required init(data: NSDictionary?) {
        super.init(data: data)
        self.posIndex = data?["posIndex"] as? Int ?? 0
        self.isFavorite = (data?["isFavorite"] as? Int ?? 0) == 1
        self.imageName = data?["imageName"] as? String ?? ""
    }
   
}


