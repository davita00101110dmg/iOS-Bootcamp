public struct Post {
    public private(set) var name: String
    public private(set) var rating: Int
    
    public private(set) var categories: [Category]
    
    public init(name: String, rating: Int, categories: [Category]) {
        self.name = name
        
        if rating > 5 { self.rating = 5 }
        else if rating < 0 { self.rating = 0 }
        else { self.rating = rating }
        
        self.categories = categories
    }
}
