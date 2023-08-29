## TinyC contains: 
- functions, 
- declarations, 
- definition, 
- arithmetic and 
- logical operations, 
- arrays, 
- if-else conditions, 
- a while loop construct, 
<br>and operations on arrays similar to C.
----
- Tiny contains four primary data types, namely, 
    - int, 
    - float, 
    - char, and 
    - bool.
<br>
- The entry point func-on of Tiny is a func-on name main and has the fixed declara-on “int main().” 
- The func-on declara-on of Tiny is similar to C. 
- Tiny supports 16 bits integers, 32 bits floats, and 8 bits characters. Tiny does not contain any construct to input or output. 
- Each variable must be assigned a value after its declaratioon. All variables must be declared at the beginning of the func-on and before they are used. 
- "*" Global variables are not possible
----

`<Program>` ::= `<MainMethod> <Functions>`<br>
`<Functions>`           ::=     `{ <FunctionDeclaration> }`<br>
`<FunctionDeclaration>` ::=     `<ReturnType> <Identifier> ( <ParamList> ) <Block>`<br>
`<ReturnType> `         ::=     `<Type> | void`<br>
`<ParamList>`           ::=     `[ <Param> { , <Param> } ]`
`<Param>`               ::=     `<Type> <Identifier> [ [ <IntType> ] ]`<br>
`<MainMethod>`          ::=     `<IntType> main ( ) { <Declarations> <Statements> }`<br>
`<Declarations> `       ::=     `{ <Declaration> }`<br>
`<Declaration>`         ::=     `<Types> <Identifier> [ [ <IntType> ] ] { , <Identifier> [ [ <IntType> ] ] } `;<br>
`<Types>`               ::=     `<IntType>` | `<BoolType>` | `<FloatType>` | `<CharType>` <br>
`<IntType>`             ::=     int <br>
`<BoolType>`            ::=     bool <br>
`<FloatType>`           ::=     float <br>
`<Chartype>`            ::=     char<br>
`<Statements>`          ::=     { `<Statement>` } <br>
`<Statement>`           ::=     `; | <Block> | <Assignment> | <IfStatement> | <WhileStatement> | ArrayStatement |`<br>
`<Block>`               ::=     `{ <Statements> }`<br>
`<Assignment>`          ::=     `<Identifier> [ [ <Expression> ] ] = <Expression>` ;<br>
`<IfStatement>`         ::=     `if ( <Expression> ) <Statemenst> [ else <Statements> ]` <br>
`<WhileStatement>`      ::=     `while ( <Expression> ) <Statement>`<br>
`<ArrayOperation>`      ::=     `<ArrayTarget> [ <Expression> ] = <Expression> ;`
`<ArrayTarget>`         ::=     `<Identifier> <ArrayRef>`
`<ArrayRef>`            ::=     `[ [ <Expression> ] ]`
`Expression`            ::=     `<Conjunction> {  || <Conjunction> }`<br>
`Conjunction`           ::=     `<Equality> { && <Equality> }`<br>
`Equality`              ::=     `<Relation> [ <EquOp> <Relation> ]`<br>
`EquOp`                 ::=     `== | !=`<br>
`Relation`              ::=     `<Addition> [<RelOp> <Addition>]`<br>
`RelOp`                 ::=     `< | <= | > | >=`<br>
`Addition`              ::=     `<Term> { <AddOp> <Term>}`<br>
`AddOp`                 ::=     `+ | -`<br>
`Term`                  ::=     `<Factor> { <MulOp> <Factor> }`<br>
`MulOp`                 ::=     `* | / | %`<br>
`Factor`                ::=     `[ <UnaryOp> ] <Primary>`<br>
`UnaryOp`               ::=     `- | !`<br>
`Primary`               ::=     `<Identifier> [[ <Expression> ]] | <Literal> | ( <Expression> ) | <Type> ( <Expression> )`<br>
`<Identifier>`          ::=     `<Letter> { <Letter> | <Digit> }`<br>
`<Letter>`              ::=     `a | b | c | d | e | f | g | h | i | j | k | l | m | n | o | p | q | r | s | t | u | v | w | x | y | z | A | B | C | D | E | F | G | H | I | J | K | L | M | N | O | P | Q | R | S | T | U | V | W | X | Y | Z` <br>
`<Digit>`               ::=     `0 | 1 | 2 | 3 | 4 | 5 | 6 | 7 | 8 | 9 `<br>
`<Literal>`             ::=     `<Integer> | <Boolean> | <Float> | <Char>`<br>
`<Integar>`             ::=     `<Digit> { <Digit> }`<br>
`<Boolean>`             ::=     `true | false`<br>
`<Float>`               ::=     `<Integer> . <Integer>`<br>
`<Char>`                ::=     `' <AsciiCharacter> '`<br>
`<AsciiCharacter>`      ::=     `<PrintableCharacter> | <EscapeSequence>`<br>
`<PrintableCharacter>`  ::=     `<Letter> | <Digit> | <Punctuation> | <Symbol>`<br>
`<EscapeSequence>`      ::=     `\\ ( a | b | f | n | r | t | v | ' | \ | \\ | ? )`<br>
`<punctuation>`         ::=     `. | , | ; | : | ! | ?`<br>
`<Symbol>`              ::=     `@ | # | $ | % | ^ | & | * | ( | ) | [ | ] | { | } | - | + | = | < | > | / | \ | |`<br>

