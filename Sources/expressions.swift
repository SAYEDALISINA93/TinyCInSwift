extension TinyParser {
    /// This method is handling the expression operation,
    /// - Returns: Boolean value.
    public func expression() -> Bool {
        return conjunction()
    }
    
    /// This method is handling the conjunction operation.
    /// - Returns: Boolean value.
    public func conjunction() -> Bool {
        if !equality() {
            return false
        }
        
        while match(.symbol, value: "&&") {
            if !equality() {
                return false
            }
        }
        
        return true
    }
    
    /// This method is handling the queality.
    /// - Returns: Boolean value.
    public func equality() -> Bool {
        if !relation() {
            return false
        }
        
        while match(.symbol, value: "==") || match(.symbol, value: "!=") {
            if !relation() {
                return false
            }
        }
        
        return true
    }
    
    /// Handling the realtion operation.
    /// - Returns: Boolean value.
    public func relation() -> Bool {
        if !addition() {
            return false
        }
        
        while match(.symbol, value: "<") || match(.symbol, value: "<=")
                || match(.symbol, value: ">") || match(.symbol, value: ">=") {
            if !addition() {
                return false
            }
        }
        
        return true
    }
    
    /// Hanlde the addition operation.
    /// - Returns: Boolean value.
    public func addition() -> Bool {
        if !multiplication() {
            return false
        }
        
        while match(.symbol, value: "+") || match(.symbol, value: "-") {
            if !multiplication() {
                return false
            }
        }
        
        return true
    }
    
    /// Handle the multipication.
    /// - Returns: Boolean value.
    public func multiplication() -> Bool {
        return primary() 
    }
    
    /// It is the lowest level of expresion
    /// - Returns: Boolean value.
    ///     True: Match the condition.
    ///     False: Does not match the condition.
    public func primary() -> Bool {
        if match(.literal) 
            || match(.stringLiteral) 
        {
            return true 
        } 
        else if match(.identifier) {
            if match(.symbol, value: "(") {
                if argumentList() {
                    return match(.symbol, value: ")")
                }
                return false
            }
            return true 
        }
        else if (match(.keyword, value: "true") 
                 || match(.keyword, value: "false")){
            return true
        }
        else if match(.symbol, value: "(") {
            if expression() {
                return match(.symbol, value: ")")
            }
        }
        return false 
    }
}
