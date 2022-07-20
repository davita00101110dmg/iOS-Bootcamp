public class Blogger {
    public private(set) var name: String
    public private(set) var posts: [Post]
    
    public func averageRatingOfPosts() -> Double {
        var sumOfPostRatings = 0
        self.posts.forEach { post in
            sumOfPostRatings += post.rating
        }
        let averageRating = Double(sumOfPostRatings) / Double(self.posts.count)
        
        return averageRating
    }
    
    public func theMostPopularPost() -> [String] {
        var postsTotalRatings = [String: Int](), mostPopularPosts = [String]()
        self.posts.forEach { post in
            postsTotalRatings[post.name] = (postsTotalRatings[post.name] ?? 0) + post.rating
        }
        
        postsTotalRatings.forEach { post in
            if post.value == postsTotalRatings.max(by: { $0.value < $1.value})?.value {
                mostPopularPosts.append(post.key)
            }
        }
        
        return mostPopularPosts
    }
    
    public init(name: String, posts: [Post]) {
        self.name = name
        self.posts = posts
    }
}
