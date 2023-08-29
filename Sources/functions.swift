extension TinyParser{    
    
    /// Handling the functions structure.
    /// - Returns: Boolean value:
    ///     True: is function.
    ///     False: is not function.
    public func functions() -> Bool {
        if !functionDeclaration() {
            return false
        }
        return true
    }
    
    /// This method is handling the declarion of a function.
    /// - Returns: Boolean value
    ///     True: is matched with function structure
    ///     False: does not match or it has an issue.
    public func functionDeclaration() -> Bool {
        if types(),
           match(.identifier),
           match(.symbol, value: "("),
           paramList(), 
            match(.symbol, value: ")"),
           match(.symbol, value: "{"){
            if declarations() == 3{
                if statements()
                {
                    if returnStatement() {
                        if (match(.symbol, value: "}")){
                            return true
                        }else{
                            print("Missing the last '}'")
                            return false
                        }
                        
                    }else{
                        print("There is no return statement!!!")
                        return false 
                    }
                }else{
                    print("Fucntions statements error")
                }
                return true
            }
        }
        print("Function declaration parsing failed")
        return false
    }
    
    /// List of parameters for functions or in another places.
    /// - Returns: Boolean value
    ///     True: Is matching with parameters list structure.
    ///     False: is not matching.
    public func paramList() -> Bool {
        
        if (match(.keyword, value: "int") 
            || match(.keyword, value: "float") 
            || match(.keyword, value: "char") 
            || match(.keyword, value: "bool")), 
            match(.identifier) {
            while match(.symbol, value: ",") {
                if !(match(.keyword, value: "int") || match(.keyword, value: "float") || match(.keyword, value: "char") || match(.keyword, value: "bool")) {
                    return false
                }
                if !match(.identifier) {
                    return false
                }
            }
            return true
        }
        return false
    }
    
    /// List of arguments for functions in single case and with , seprations case.
    /// - Returns: Boolean value
    ///     True: Is matching.
    ///     False: is not matching.
    public func argumentList() -> Bool {
        if expression() {
            while match(.symbol, value: ",") {
                if !expression() {
                    return false
                }
            }
            return true
        }
        return true 
    }
    
}
