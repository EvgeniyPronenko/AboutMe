//
//  Persons.swift
//  AboutMe
//
//  Created by Евгений on 29.08.2021.
//

struct User {
    let login: String
    let password: String
    let person: Person
    
    static func getUser() -> User {
        User(
            login: "User",
            password: "Password" ,
            person: Person(name: "John", surname: "Smith")
        )
    }
}

struct Person {
    let name: String
    let surname: String
}
