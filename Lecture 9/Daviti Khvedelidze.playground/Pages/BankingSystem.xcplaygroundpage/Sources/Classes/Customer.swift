protocol CustomerProperties {
    var name: String { get }
    var lastname: String { get }
    var idNumber: Int { get }
    var cards: [Card] { get set }
    var balance: Int { get set }
    var currencyAccounts: [CurrencyAccount] { get set }
}

public class Customer: CustomerProperties {
    let name: String
    let lastname: String
    let idNumber: Int
    var cards: [Card]
    var balance: Int
    var currencyAccounts: [CurrencyAccount]
    
    public init(name: String, lastname: String, idNumber: Int, balance: Int, cards: [Card], currencyAccounts: [CurrencyAccount]) {
        self.name = name
        self.lastname = lastname
        self.idNumber = idNumber
        
        if balance < 0 { self.balance = 0 }
        else { self.balance = balance }
        
        self.cards = cards
        self.currencyAccounts = currencyAccounts
    }
    
    //    Adding convenience init to initialize client with only name lastname and ID with customerRegistration function.
    public convenience init(name: String, lastname: String, idNumber: Int) {
        self.init(name: name, lastname: lastname, idNumber: idNumber, balance: 0, cards: [], currencyAccounts: [])
    }
}
