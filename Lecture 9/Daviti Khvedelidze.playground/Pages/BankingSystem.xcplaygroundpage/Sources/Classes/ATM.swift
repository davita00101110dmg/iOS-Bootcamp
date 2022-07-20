protocol ATM_Methods {
    func checkBalance(forID customerID: Int)
    func withdrawMoney(forID customerID: Int, amount: Int)
    func depositMoney(forID customerID: Int, amount: Int)
}

public class ATM: Bank, ATM_Methods {
    public func checkBalance(forID customerID: Int) {
        if customers.contains(where: { $0.idNumber == customerID }) {
            let customer = customers.filter { $0.idNumber == customerID }.first!
            print("\(customer.name), your balance is \(customer.balance)")
        } else {
            error()
        }
    }
    
    public func withdrawMoney(forID customerID: Int, amount: Int) {
        if customers.contains(where: { $0.idNumber == customerID }) {
            let customer = customers.filter { $0.idNumber == customerID }.first!
            if customer.balance > 0 {
                if amount > 0 && (customer.balance - amount >= 0) {
                    customer.balance -= amount
                    print("\(customer.name), money is successfully withdrawn")
                } else {
                    print("\(customer.name), can't process this operation desired amount is less then 0, or you don't have enough funds")
                }
            } else {
                print("\(customer.name), can't process this operation your balance is 0")
            }
        }
        else {
            error()
        }
    }
    
    public func depositMoney(forID customerID: Int, amount: Int) {
        if customers.contains(where: { $0.idNumber == customerID }) {
            let customer = customers.filter { $0.idNumber == customerID }.first!
            if amount > 0 {
                customer.balance += amount
                print("\(customer.name), money is successfully deposited")
            } else {
                print("\(customer.name), can't process this operation, balance can't be less then 0")
            }
        } else {
            error()
        }
    }
}

