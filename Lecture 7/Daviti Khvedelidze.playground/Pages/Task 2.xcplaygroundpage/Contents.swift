import Foundation

// Creating list of instances of Bloger class with array of Post class elements

let bloggersList = [
    Blogger(name: "Blogger1", posts:
                [Post(name: "post1", rating: 0, categories: [.movies, .fashion]),
                 Post(name: "post2", rating: -5, categories: [.movies, .books]),
                 Post(name: "post3", rating: 3, categories: [.sport, .news]),
                 Post(name: "post4", rating: -1, categories: [.books]),
                 Post(name: "post5", rating: 5, categories: [.books]),
                ]),
    Blogger(name: "Blogger2", posts:
                [Post(name: "post6", rating: 0, categories: [.books, .movies]),
                 Post(name: "post7", rating: 3, categories: [.sport, .movies]),
                 Post(name: "post8", rating: 5, categories: [.sport, .news, .movies]),
                 Post(name: "post9", rating: 2, categories: [.books, .fashion, .movies]),
                 Post(name: "post10", rating: 100, categories: [.books]),
                ])]



// Creating instance of Blog class which contains Blogger instansces
let blogOne = Blog(bloggers: bloggersList)

// Printing out average rating of the posts for concrete blogger
print(bloggersList[0].averageRatingOfPosts())

// The most popular post for concrete blogger
print(bloggersList[1].theMostPopularPost())

// Blogger count
print(blogOne.bloggerCount())

// Answers are mostly arrays because of the possibility of multiple answers
// The most popular bloggers which is determined by ratings on his/her posts
print(blogOne.theMostPopularBlogger())

// The most popular blogs on entire Blog
print(blogOne.theMostPopularPostOnBlog())

// Average rating of all the posts
print(blogOne.averageRatingOfPosts())

// The most used categories (here the answer is array of Category
print(blogOne.theMostUsedCategory())
