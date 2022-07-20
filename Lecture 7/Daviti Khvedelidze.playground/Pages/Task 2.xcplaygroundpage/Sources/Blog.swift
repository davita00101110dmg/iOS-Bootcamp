public class Blog {
/*
 Leaving only this variable fully public because the purpose of the Blog class is to take data. Therefore, we can change the value of the Bloggers variable to another array of Bloggers and use methods on them as well
 */
    public var bloggers: [Blogger]
    
    public func bloggerCount() -> Int {
        return bloggers.count
    }
    
    public func theMostPopularBlogger() -> [String] {
        var bloggersTotalRatings = [String: Int](), mostPopularBloggerArray = [String]()
        
        bloggers.forEach { blogger in
            blogger.posts.forEach { post in
                bloggersTotalRatings[blogger.name] = (bloggersTotalRatings[blogger.name] ?? 0) + post.rating
            }
        }
        
        bloggersTotalRatings.forEach { blogger in
            if blogger.value == bloggersTotalRatings.max(by: { $0.value < $1.value})?.value {
                mostPopularBloggerArray.append(blogger.key)
            }
        }
        
        return mostPopularBloggerArray
    }
    
    public func theMostPopularPostOnBlog() -> [String] {
        var postsTotalRatings = [String: Int](), mostPopularPosts = [String]()
        
        bloggers.forEach { blogger in
            blogger.posts.forEach { post in
                postsTotalRatings[post.name] = post.rating
            }
        }
        
        postsTotalRatings.forEach { post in
            if post.value == postsTotalRatings.max(by: { $0.value < $1.value})?.value {
                mostPopularPosts.append(post.key)
            }
        }
        
        return mostPopularPosts
    }
    
    
    public func averageRatingOfPosts() -> Double {
        var sumOfAllPostRatings = 0, sumOfAllPosts = 0
        
        bloggers.forEach { blogger in
            blogger.posts.forEach { post in
                sumOfAllPostRatings += post.rating
                sumOfAllPosts += 1
            }
        }
        
        let averageOfAll = Double(sumOfAllPostRatings) / Double(sumOfAllPosts)
        
        return averageOfAll
    }
    
    public func theMostUsedCategory() -> [String] {
        var categoriesCounter = [Category: Int](), mostPopularCategories = [String]()
        
        bloggers.forEach { blogger in
            blogger.posts.forEach { post in
                post.categories.forEach { category in
                    categoriesCounter[category] = (categoriesCounter[category] ?? 0) + 1
                }
            }
        }
        
        categoriesCounter.forEach { category in
            if category.value == categoriesCounter.max(by: { $0.value < $1.value})?.value {
                mostPopularCategories.append(category.key.rawValue)
            }
        }
        
        return mostPopularCategories
    }
    
    public init(bloggers: [Blogger]) {
        self.bloggers = bloggers
    }
}
