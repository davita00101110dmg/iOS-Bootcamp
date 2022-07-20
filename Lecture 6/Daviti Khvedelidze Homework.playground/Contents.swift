import UIKit

enum Faculty: CaseIterable {
    case IT, economics, history
}

enum Subject: CaseIterable {
    case calculus, python, algorithms, macroeconomics, anthropology, financialEconomics, worldHistory
}

class University {
    let name: String
    let yearOfEstablishment: Int
    let studentList: [Student]
    let lecturerList: [Lecturer]
    let facultyList: [Faculty]
    
    init(name: String, yearOfEstablishment: Int, studentList: [Student], lecturerList: [Lecturer], facultyList: [Faculty]) {
        self.name = name
        self.yearOfEstablishment = yearOfEstablishment
        self.studentList = studentList
        self.lecturerList = lecturerList
        self.facultyList = facultyList
    }
}

class Student {
    let nameAndLastName: String
    let idNumber: Int
    let faculty: Faculty
    let submissionYear: Int
    var grades: [Grade]
    let subjects: [Subject]
    var GPA: Double {
        return GPA_Calculator(grades: self.grades)
    }
    
    init(nameAndLastName: String, idNumber: Int, faculty: Faculty, submissionYear: Int, grades: [Grade], subjects: [Subject]) {
        self.nameAndLastName = nameAndLastName
        self.idNumber = idNumber
        self.faculty = faculty
        self.submissionYear = submissionYear
        self.grades = grades
        self.subjects = subjects
    }
    
    func lengthOfStudy(currentYear: Int) -> Int {
        currentYear - submissionYear
    }
    
//    func separatedNameAndLastName() -> (name: String, lastname: String) {
//        (name, lastname)
//    }
    
    func separatedNameAndLastName() -> (name: String, lastname: String) {
        let name: String
        let lastname: String
        (name, lastname) = nameAndLastName.contains(" ") ? (String(nameAndLastName.split(separator: " ")[0]), String(nameAndLastName.split(separator: " ")[1])) : (nameAndLastName, "")
        
        return (name, lastname)
    }
    
    func birthYear(ageWhenSubmited: Int) -> Int {
        submissionYear - ageWhenSubmited
    }
    
    func A_GradeSubjects(grades: [Grade]) -> [Subject] {
        var subjectsList: [Subject] = []
        for grade in grades {
            if grade.totalScore > 89 {
                subjectsList.append(grade.subjects)
            }
        }
        if subjectsList.isEmpty {
            print("There is no A Grade subjects")
        } else {
            print("Your A grade subjects:")
        }
        return subjectsList
    }
    
    func failedSubjects(grades: [Grade]) -> [Subject] {
        var subjectsList: [Subject] = []
        for grade in grades {
            if grade.totalScore < 51 {
                subjectsList.append(grade.subjects)
            }
        }
        if subjectsList.isEmpty {
            print("There is no failed subjects!")
        } else {
            print("Failed because of points lack (>51):")
        }
        return subjectsList
    }
    
    func failedWithFinalSubjects(grades: [Grade]) -> [Subject] {
        var subjectsList: [Subject] = []
        for grade in grades {
            if grade.totalScore < 51 || grade.finalScore < 20 {
                subjectsList.append(grade.subjects)
            }
        }
        if subjectsList.isEmpty {
            print("There is no failed subjects!")
        } else {
            print("Failed because of the finals grade:")
        }
        return subjectsList
    }
    
    func GPA_Calculator(grades: [Grade]) -> Double {
        var gradesList: [Double] = []
        for grade in grades {
            gradesList.append(grade.totalScore)
        }
        let avarageGrade = gradesList.reduce(0, +) / Double(grades.count)
        var gpa: Double = 0.0
        
        switch avarageGrade {
        case 90...100:
            gpa = 4.0
        case 80...90:
            gpa = 3.0
        case 70...80:
            gpa = 2.0
        case 60...70:
            gpa = 1.0
        default:
            gpa = 0.0
        }
        
        return gpa
    }
}

struct Grade {
    let subjects: Subject
    let activityScore: Double
    let midtermScore: Double
    let finalScore: Double
    var totalScore: Double {
        return activityScore + midtermScore + finalScore
    }
    
    init(subjects: Subject, activityScore: Double, midtermScore: Double, finalScore: Double) {
        self.subjects = subjects
        self.activityScore = activityScore
        self.midtermScore = midtermScore
        self.finalScore = finalScore
    }
}

class Lecturer {
    let nameAndLastName: String
    let idNumber: Int
    let faculty: Faculty
    let teachingSubjects: [Subject]
    let table: Table
    
    init(nameAndLastName: String, idNumber: Int, faculty: Faculty, teachingSubjects: [Subject], table: Table) {
        self.nameAndLastName = nameAndLastName
        self.idNumber = idNumber
        self.faculty = faculty
        self.teachingSubjects = teachingSubjects
        self.table = table
    }
}

struct Table {
    var monday: WeekDay?
    var tuesday: WeekDay?
    var wednesday: WeekDay?
    var thursday: WeekDay?
    var friday: WeekDay?
    var sunday: WeekDay?
}

struct WeekDay {
    var lecturesToBeConducted: [Lecture]
    
    init(lecturesToBeConducted: [Lecture]) {
        self.lecturesToBeConducted = lecturesToBeConducted
    }
}

struct Lecture {
    let name: String
    let faculty: Faculty
    let startingTime: String
    let endingTime: String
    let auditoriumNumber: Int
}

// ფაკულტეტების ობიექტები
let faculties = [Faculty.IT,
                 Faculty.economics,
                 Faculty.history]

// საგნების ობიექტები
let subjectsForIT = [Subject.calculus,
                     Subject.python,
                     Subject.algorithms]

let subjectsForHistory = [Subject.anthropology,
                          Subject.worldHistory]

let subjectsForEconomics = [Subject.financialEconomics,
                            Subject.macroeconomics]

// სტუდენტების საგნების შეფასებები
let student1Grades = [Grade(subjects: subjectsForIT[0], activityScore: 30, midtermScore: 30, finalScore: 30),
                      Grade(subjects: subjectsForIT[1], activityScore: 35, midtermScore: 25, finalScore: 19),
                      Grade(subjects: subjectsForIT[2], activityScore: 0, midtermScore: 0, finalScore: 19)]

let student2Grades = [Grade(subjects: subjectsForEconomics[0], activityScore: 30, midtermScore: 30, finalScore: 40),
                      Grade(subjects: subjectsForEconomics[1], activityScore: 15, midtermScore: 20, finalScore: 40)]

// სტუდენტების ობიექტები
let student_1 = Student(nameAndLastName: "Daviti", idNumber: 59606246294, faculty: Faculty.IT, submissionYear: 2020, grades: student1Grades, subjects: subjectsForIT)

let student_2 = Student(nameAndLastName: "Giorgi Kuliashvili", idNumber: 58692341249, faculty: Faculty.economics, submissionYear: 2021, grades: student2Grades, subjects: subjectsForEconomics)

let students = [student_1, student_2]

// ლექციების ობიექტები
let mondayLecture_1 = Lecture(name: "Calculus", faculty: Faculty.IT, startingTime: "14:00", endingTime: "16:00", auditoriumNumber: 102)

let mondayLecture_2 = Lecture(name: "World History", faculty: Faculty.history, startingTime: "16:00", endingTime: "18:00", auditoriumNumber: 103)

let tuesdayLecture_1 = Lecture(name: "Financial Economics", faculty: Faculty.economics, startingTime: "09:00", endingTime: "11:00", auditoriumNumber: 200)

let mondayLectures = [mondayLecture_1, mondayLecture_2]
let tuesdayLectures = [tuesdayLecture_1]

// ცხრილის ობიექტი (ყველას ერთი ცხრილი გადავეცი)
let lecturesTable = Table(monday: WeekDay(lecturesToBeConducted: mondayLectures),
                          tuesday: WeekDay(lecturesToBeConducted: tuesdayLectures),
                          wednesday: nil,
                          thursday: nil,
                          friday: nil,
                          sunday: nil)

// ლექტორების ობიექტები
let lecturer1 = Lecturer(nameAndLastName: "Shota Zazashvili", idNumber: 59317482742, faculty: Faculty.IT, teachingSubjects: subjectsForIT, table: lecturesTable)

let lecturer2 = Lecturer(nameAndLastName: "Lia Gubashvili", idNumber: 39347422752, faculty: Faculty.economics, teachingSubjects: subjectsForEconomics, table: lecturesTable)

let lecturers = [lecturer1, lecturer2]

// უნივერსიტეტის ობიექტი
let university = University(name: "Business And Technology University", yearOfEstablishment: 2016, studentList: students, lecturerList: lecturers, facultyList: faculties)

// დავალებები

// 1. რომელიც პარამეტრად მიიღებს მიმდინარე წელს და დაგვიბრუნებს, რამდენი წელია, რაც სწავლობს ეს სტუდენტი

//print(student_1.lengthOfStudy(currentYear: 2022))

// 2. რომელიც დაგვიბრუნებს თაფლს (firstName: String, lastName: String), სადაც firstName და lastName სახელი და გვარისგან მიიღება (ჩავთვალოთ რომ ” ” სფეისი არის გამყოფი)

let fullName = student_1.separatedNameAndLastName()
print(fullName.name)

// 3. რომელიც გვეტყვის, რომელ წელს დაიბადა სტუდენტი (თუ პარამეტრად ჩავაწვდით, ჩაბარების დროს რამდენი წლისაც იყო, ვიგულისხმოთ, რომ 18 წლისანი აბარებენ უნივერსიტეტში)

//print(student_1.birthYear(ageWhenSubmited: 18))

// 4. რომელიც დაგვიბრუნებს იმ საგნების სიას, სადაც სტუდენტს 89+ ქულა აქვს

//for subject in student_2.A_GradeSubjects(grades: student2Grades) {
//    print(subject)
//}

// 5. რომელიც დაგვიბრუნებს იმ საგნებს, სადაც ჩაიჭრა სტუდენტი (51 ქულაზე ნაკლები აქვს)

//for subject in student_1.failedSubjects(grades: student1Grades) {
//    print(subject)
//}

// 6. რომელიც დაგვიბრუნებს იმ საგნებს, სადაც ჩაიჭრა სტუდენტი (ამ შემთხვევაში დავამატოთ პირობა, რომ საბოლოო გამოცდის ქულა მეტი უნდა იყოს 20-ზე)

//for subject in student_1.failedWithFinalSubjects(grades: student1Grades) {
//    print(subject)
//}
