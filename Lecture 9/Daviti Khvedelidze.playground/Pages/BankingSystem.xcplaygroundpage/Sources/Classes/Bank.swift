protocol BankPropertiesAndMethods {
    var title: String { get }
    var customers: [Customer] { get set }
    
    func customerRegistration(name: String, lastname: String, idNumber: Int)
    func requestForCard(forID customerID: Int, type desiredCard: Card)
    func requestForPersonalInfo(forID customerID: Int)
}

public class Bank: BankPropertiesAndMethods {
    let title: String
    var customers: [Customer]
    
    public init(title: String, customers: [Customer]) {
        self.title = title
        self.customers = customers
    }
    
    public func customerRegistration(name: String, lastname: String, idNumber: Int) {
        customers.append(Customer(name: name, lastname: lastname, idNumber: idNumber))
        print("Welcome to \(self.title) bank, \(name)!")
    }
    
    //    Using IDs in every function to reach the desired customer
    public func requestForCard(forID customerID: Int, type desiredCard: Card) {
        if customers.contains(where: { $0.idNumber == customerID }) {
            let customer = customers.filter { $0.idNumber == customerID }.first!
            if customer.cards.contains(desiredCard) {
                print("\(customer.name), you already have \(desiredCard) card")
            } else {
                desiredCard == .debit ? customer.cards.append(.debit) : customer.cards.append(.credit)
                print("\(customer.name), your request for the \(desiredCard) card is approved!")
            }
        } else {
            error()
        }
    }
    
    public func requestForPersonalInfo(forID customerID: Int) {
        if customers.contains(where: { $0.idNumber == customerID }) {
            let customer = customers.filter { $0.idNumber == customerID }.first!
            print("""
                  Name: \(customer.name)
                  Lastname: \(customer.lastname)
                  ID Number: \(customer.idNumber)
                  Cards: \(customer.cards.count > 0 ? String(customer.cards.count) : "None")
                  Balance: \(customer.balance)
                  Currency Accounts: \(customer.currencyAccounts.count > 0 ? String(customer.currencyAccounts.count) : "None")
                  """)
        } else {
            error()
        }
    }
}
