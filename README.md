# TINYC Parser

### Requirements
The only requirement for this project is Swift Language and its compiler. <br>
Note: **For Windows operating systems at least Windows 10 is required.**

## How to use the project:
The program implementation can be executed on various platforms. Below are the instructions for running the code on different environments.

## 1- Installation & Usage

To install and use the Swift programming language Please follow the below instructions:
#### MAC OS:
**Swift Installation**<br>
Download and install Xcode with the following links: 
- 1: https://apps.apple.com/us/app/xcode/id497799835?mt=12
- 2: https://download.swift.org/swift-5.8-branch/xcode/swift-5.8-DEVELOPMENT-SNAPSHOT-2023-03-17-a/swift-5.8-DEVELOPMENT-SNAPSHOT-2023-03-17-a-osx.pkg

There are two ways to run this application in Mac OS:
1: Open the project with Xcode and run it.<br>
2: Run it from the terminal<br>
    `cd ~/TinyInSwift`<br>
    `swift build`<br>
    `swift run`<br>

#### 2- Windows:
Download swift language from this link:
https://download.swift.org/swift-5.8-branch/windows10/swift-5.8-DEVELOPMENT-SNAPSHOT-2023-01-09-a/swift-5.8-DEVELOPMENT-SNAPSHOT-2023-01-09-a-windows10.exe <br>
The installation will be like other Windows applications. It does not require any special dependencies.
To confirm the successful installation of Swift use the below command: <br>
`swift --version`

After Download and Installation, throw the command line tool to open your project directory.
The below commands will help you to build and run the project.<br>

`swift build`<br>
`swift run`<br>

#### 3- Linux:

Download link: https://www.swift.org/download/
After successful download, open the directory in which you have downloaded the file. Extract the file from the interface or use the below command:<br>
` sudo tar xzf {your file name with extensions} `<br>
Then move it to the "usr/share/swift" directory:<br>
`sudo mv {extracted_folder_name} /usr/share/swift`<br>
The last step is to add it to the PATH variable:<br>
` echo "export PATH=/usr/share/swift/usr/bin:$PATH >> ~/.bashrc` <br>
The below command will help you with using the project:<br>

`swift build`<br>
`swift run`

## Tech Stack
- The TinyCInSwift project is built entirely using the Swift programming language. Swift offers a modern and powerful development environment for building applications and tools.
## Used Libraries
- There are no third-party libraries that have been used for this project.
## Implementation Details
I have implementation in involved in two steps:
- **TinyTokenizer:** The aim of the tokenizer in this project is to convert the input source code into a stream of tokens. Tokens are small units of the source code that represent meaningful elements such as keywords, identifiers, literals, and operators. The tokenizer plays a crucial role in the initial phase of the parsing process, breaking down the source code into these tokens so that they can be processed and analyzed more easily by the parser.<br>
**The primary objectives of the tokenizer are:**

    - **Lexical Analysis:** The tokenizer performs lexical analysis, which involves scanning through the source code character by character and identifying the individual tokens present in the code. It separates the code into tokens based on whitespace, symbols, operators, and other defined patterns.

    - **Token Identification:** The tokenizer recognizes and categorizes different types of tokens based on the defined grammar rules. These token types can include keywords (e.g., "if," "while"), identifiers (variable names), literals (e.g., integers, strings), and symbols (e.g., parentheses, semicolons).

    - **Tokenization:** The tokenizer converts the identified tokens into a structured form that can be easily processed by the parser. Each token is typically represented as an object containing information about its type and value in the source code.

    - **Token Stream Generation:** The tokenizer generates a sequential stream of tokens from the source code. This stream is then passed to the parser for further analysis and processing.

    - **Ignored Elements:** The tokenizer may also handle ignored elements, such as whitespace and comments, by discarding them from the token stream. These elements are important for human readability but are often not needed during the parsing process.

- **TinyParser:** The main aim of the TinyParser is to implement a parser for a simplified programming language called "TINYC" based on a given grammar. The parser's primary goal is to analyze the structure of the input source code according to the defined grammar rules and perform various checks and validations on the code. The TinyParser facilitates the process of transforming human-readable source code into a structured representation that can be further processed or executed.<br>
Key objectives of the TinyParser include:

    - **Syntax Analysis:** The parser's core task is to analyze the syntax of the input source code. It verifies whether the code conforms to the rules defined in the grammar and detects any syntax errors or inconsistencies. Syntax analysis involves breaking down the source code into meaningful components (tokens) and organizing them into a structured hierarchy that represents the code's syntax.

    - **Semantic Analysis:** Beyond syntax, the parser performs basic semantic analysis to ensure that the code follows rules related to variable declarations, assignments, function calls, and more. It checks for issues like undeclared variables, mismatched data types, and other semantic violations.

    - **Type Checking:** The parser verifies that expressions, assignments, and function calls use compatible data types. It checks if the operands of operators are of appropriate types and whether function arguments match their corresponding parameters in terms of types.

    - **Control Flow Analysis:** The parser recognizes control flow structures such as conditional statements (if-else) and loops (while). It ensures that these constructs are properly nested and follow the correct syntax rules.

    - **Function Declarations and Calls:** The parser handles the parsing and validation of function declarations and function calls. It ensures that function parameters are correctly matched and that return values match the declared function return types.

    - **Array Handling:** The parser manages array declarations, indexing, and assignments. It checks the validity of array indices and ensures that array elements are accessed correctly.

    - **Error Handling:** When the parser identifies syntax or semantic errors, it generates meaningful error messages that can assist developers in understanding and fixing the issues in their code.

    - **Reporting Overflows:** In this specific TinyParser implementation, overflow checks are performed to detect integer overflows and buffer overflows. The parser reports these overflow issues as part of its analysis.
    
## Explanation of How the Code Works
The overall code works in three files Main.swift, TinyTokenizer.swift, and TinyParser.swift.

#### main.swift:
this file serves as the entry point for the Swift application. This is where the execution of the program starts. It typically contains the main function or code that initializes and runs the application. main.swift likely includes code that reads input, tokenizes it using the TinyTokenizer, and then parses the tokens using the TinyParser. Depending on the parsed results, it executes further processing or displays relevant information to the user.

#### TinyTokenizer.swift: 
This file breaks down the input source code into individual tokens. Tokens are the smallest meaningful units in your programming language, such as keywords, identifiers, operators, literals, and symbols. The TinyTokenizer scans through the source code and identifies these tokens, categorizing each token into its appropriate type (keyword, identifier, operator, etc.). It then generates a list of tokens that the TinyParser can use to analyze the structure of the code.

#### TinyParser.swift:
TinyParser.swift is the heart of the project. It implements the parser for the simplified programming language. The parser analyzes the list of tokens provided by the TinyTokenizer and performs various checks, including syntax validation, semantic analysis, type checking, control flow analysis, and more. It follows the grammar rules of the language to validate the input program. The parser also handles various language constructs like function declarations, assignments, expressions, conditionals, and loops.
#### functions.swift:
This is a part of TinyParser that handles related operations for functions.
#### declaration.swift:
This is a part of TinyParser that handles related operations for declaration.
#### assignments.swift:
This is a part of TinyParser that handles related operations for assignments.
#### expressions.swift:
This is a part of TinyParser that handles related operations for expressions.


