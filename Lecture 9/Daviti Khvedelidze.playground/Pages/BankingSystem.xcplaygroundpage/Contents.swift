let customers = [
    Customer(name: "Dato", lastname: "Khvedelidze", idNumber: 10, balance: 100, cards: [.debit], currencyAccounts: [.GEL, .EUR, .USD]),
    Customer(name: "Gio", lastname: "Yuliashvili", idNumber: 11, balance: -10, cards: [.credit], currencyAccounts: [.GEL]),
    Customer(name: "Zuka", lastname: "Skhirtladze", idNumber: 12, balance: 1000, cards: [.credit, .debit], currencyAccounts: [.GEL]),
    Customer(name: "Rati", lastname: "Modrekiladze", idNumber: 20)
]

let bank = Bank(title: "TBC", customers: customers)
let atm = ATM(title: "TBC", customers: customers)


// Client Registration
bank.customerRegistration(name: "Elene", lastname: "Davituliani", idNumber: 13)
print("---")

// Card Requests
bank.requestForCard(forID: 1, type: .credit)
bank.requestForCard(forID: 10, type: .credit)
bank.requestForCard(forID: 10, type: .debit)
print("---")

// Check Balance
atm.checkBalance(forID: 10)
atm.checkBalance(forID: 11)
atm.checkBalance(forID: 13)
print("---")

// Withdraw Money
atm.withdrawMoney(forID: 10, amount: 100)
atm.withdrawMoney(forID: 11, amount: 100)
atm.withdrawMoney(forID: 12, amount: 500)
print("---")

// Deposit Money
atm.depositMoney(forID: 11, amount: 1000)
atm.depositMoney(forID: 12, amount: -1000)
print("---")

// Request for personal data
bank.requestForPersonalInfo(forID: 1)
print("---")
bank.requestForPersonalInfo(forID: 12)
print("---")
bank.requestForPersonalInfo(forID: 13)
