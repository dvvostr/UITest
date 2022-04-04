import x3UI

@objc final class TestDataResult: CustomDataResult {
    var items: [TestDataResultItem] = Array()
    enum CodingKeys: String, CodingKey {
        case items
    }
    required init(from decoder: Decoder) throws {
        try super.init(from: decoder)
        let _container = try decoder.container(keyedBy: CodingKeys.self)
        self.items = try _container.decodeIfPresent([TestDataResultItem].self, forKey: .items) ?? Array()
    }
    
    required convenience init(data: NSDictionary?) {
        fatalError("init(data:) has not been implemented")
    }
}
@objc final class TestDataResultItem: CustomDataResult {
    @objc var code: String = ""
    @objc var value: String = ""
    
    enum CodingKeys: String, CodingKey {
        case code
        case value
    }
    public required init(from decoder: Decoder) throws {
        try super.init(from: decoder)
        let _container = try decoder.container(keyedBy: CodingKeys.self)
        self.code = try _container.decodeIfPresent(String.self, forKey: .code) ?? ""
        self.value = try _container.decodeIfPresent(String.self, forKey: .value) ?? ""
    }
    
    required convenience init(data: NSDictionary?) {
        fatalError("init(data:) has not been implemented")
    }
    
    
}


