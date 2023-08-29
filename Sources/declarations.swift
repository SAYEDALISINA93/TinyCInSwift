extension TinyParser{
    
    /// Checking the list of identifiers.
    /// - Returns: an boolean value:
    ///     True: is list of identifiers
    ///     False: is not list of identifiers
    public func identifierList() -> Bool {
        if match(.identifier) {
            while match(.symbol, value: ",") {
                if !match(.identifier) {
                    return false
                }
            }
            return true
        }
        return false
    }
    
    /// Handling the type keywords
    /// - Returns: an boolean value:
    ///     True: is type.
    ///     False: is not type.
    public func types() -> Bool {
        return match(.keyword, value: "int") ||
        match(.keyword, value: "float") ||
        match(.keyword, value: "char") ||
        match(.keyword, value: "bool")
    }
    

    /// It has the responsiblity of all declarations.
    /// - Returns: an iteger value
    ///  0: does not match,
    ///  1: correct,
    ///  2: syntax error
    ///  3: continue checking others
    public func declarations() -> Int {
        for _ in currentIndex...tokens.count
        {
            switch declaration() {
            case 0:
                return 0
            case 1:
                // matched
                continue
            case 2:
                // syntax eroor
                return 2
            case 3:
                // move to next step
                return 3
            default:
                return 1
            }
        }
        
        return 0
    }
    

    /// This method is handling the structure of declaration.
    /// - Returns: an iteger value
    ///  0: does not match,
    ///  1: matched,
    ///  2: syntax error
    ///  3: continue checking others
    public func declaration() -> Int {
        
        if types()
        {
            if identifierList() && match(.symbol, value: ";"){
                return 1
            }else{
                return 2
            }
        }
        else
        {
            let startIndex = currentIndex
            let x = checkAssignment()
            
            if (x == 1){
                currentIndex = startIndex
                return 3
            }else{
                // return false because after declaration, assignment should come
                return 0
            }
        }
    }
}
