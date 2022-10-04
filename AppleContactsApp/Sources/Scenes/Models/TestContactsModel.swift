//
//  TestContactsModel.swift
//  AppleContactsApp
//
//  Created by Анна Лошакова on 04.10.2022.
//

import Foundation

final class TestContactsModel {
    
    static func createModel() -> [Contact] {
        return [
            Contact(firstName: "Алена", secondName: "Есенина", phoneNumber: [89346573412]),
            Contact(firstName: "Алена Маникюр", secondName: "Петрова", phoneNumber: [89346574891]),
            Contact(firstName: "Алина Васильевна", secondName: "Есенина", phoneNumber: [89346573412]),
            Contact(firstName: "Анна", secondName: "Петрова", phoneNumber: [89346574592]),
            Contact(firstName: "Артем", phoneNumber: [89346571122]),
            Contact(firstName: "Бабушка Галя", isElected: true, phoneNumber: [89346579876]),
            Contact(firstName: "Бабушка Люба", isElected: true, phoneNumber: [89516573412]),
            Contact(firstName: "Боба", phoneNumber: [89346579811]),
            Contact(firstName: "Брат Ваня", phoneNumber: [89516573422]),
            Contact(firstName: "Вася", secondName: "Есенин", phoneNumber: [89123473412]),
            Contact(firstName: "Влада", secondName: "Иванова", phoneNumber: [89818573412]),
            Contact(firstName: "Глеб", phoneNumber: [89356573412]),
            Contact(firstName: "Гриша", phoneNumber: [89340983412]),
            Contact(firstName: "Данил", phoneNumber: [89346090412]),
            Contact(firstName: "Даша", phoneNumber: [89346003412]),
            Contact(firstName: "Дедушка Вита", phoneNumber: [89346113412]),
            Contact(firstName: "Дедушка Слава", phoneNumber: [89346333412]),
            Contact(firstName: "Денис", phoneNumber: [89324573412]),
            Contact(firstName: "Саша П", phoneNumber: [85234573412]),
            Contact(firstName: "Женя брови", phoneNumber: [81532573412]),
            Contact(firstName: "Кирилл", phoneNumber: [89340983400]),
            Contact(firstName: "Лена", phoneNumber: [89346099012]),
            Contact(firstName: "Леша", phoneNumber: [89346007712]),
            Contact(firstName: "Мама Теле2", isElected: true, phoneNumber: [89321573412]),
            Contact(firstName: "Мама мтс", isElected: true, phoneNumber: [85234513412]),
            Contact(firstName: "Миша", phoneNumber: [89321576544]),
            Contact(firstName: "Маша", phoneNumber: [89921576512]),
            Contact(firstName: "Надежда Петровна", phoneNumber: [85231513412]),
            Contact(firstName: "Фитнес-клуб ЛИДЕР", phoneNumber: [89991576512]),
            Contact(firstName: "Фитнес-клуб Муравей", phoneNumber: [89992276512]),
            Contact(firstName: "Эдуард", phoneNumber: [89991234512]),
            Contact(firstName: "Юля", phoneNumber: [89382276512]),
            Contact(firstName: "Юля ресницы", phoneNumber: [89101576512]),
            Contact(firstName: "Юрий", phoneNumber: [89902276512])
        ]
    }
}
