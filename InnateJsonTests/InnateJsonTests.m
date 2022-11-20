//
//  InnateJsonTests.m
//  InnateJsonTests
//
//  Created by Shrish Deshpande on 11/19/22.
//

#import <XCTest/XCTest.h>
#import "InnateLexer.h"
#import "InnateParser.h"
#import "InnateValue.h"

@interface InnateJsonTests : XCTestCase

@end

@implementation InnateJsonTests

- (void)setUp {
}

- (void)tearDown {
}

- (void)testLexing {
    __block InnateLexer *lexer;
    __block NSArray<NSString *> *tokens;
    [self measureBlock:^{
        lexer = [[InnateLexer alloc] init:@"{\"glossary\":{\"title\":\"example glossary\",\"GlossDiv\":{\"title\":\"S\",\"GlossList\":{\"GlossEntry\":{\"ID\":\"SGML\",\"SortAs\":\"SGML\",\"GlossTerm\":\"Standard Generalized Markup Language\",\"Acronym\":\"SGML\",\"Abbrev\":\"ISO 8879:1986\",\"GlossDef\":{\"para\":\"A meta-markup language, used to create markup languages such as DocBook.\",\"GlossSeeAlso\":[\"GML\",\"XML\"]},\"GlossSee\":\"markup\"}}}}}"];
        tokens = [lexer lex];
    }];
    NSArray<NSString *> *expected = @[@"{", @"\"glossary\"", @":", @"{", @"\"title\"", @":", @"\"example glossary\"", @",", @"\"GlossDiv\"", @":", @"{", @"\"title\"", @":", @"\"S\"", @",", @"\"GlossList\"", @":", @"{", @"\"GlossEntry\"", @":", @"{", @"\"ID\"", @":", @"\"SGML\"", @",", @"\"SortAs\"", @":", @"\"SGML\"", @",", @"\"GlossTerm\"", @":", @"\"Standard Generalized Markup Language\"", @",", @"\"Acronym\"", @":", @"\"SGML\"", @",", @"\"Abbrev\"", @":", @"\"ISO 8879:1986\"", @",", @"\"GlossDef\"", @":", @"{", @"\"para\"", @":", @"\"A meta-markup language, used to create markup languages such as DocBook.\"", @",", @"\"GlossSeeAlso\"", @":", @"[", @"\"GML\"", @",", @"\"XML\"", @"]", @"}", @",", @"\"GlossSee\"", @":", @"\"markup\"", @"}", @"}", @"}", @"}", @"}"];
    XCTAssertEqualObjects(tokens, expected);
}

- (void)testParsing {
    NSArray<NSString *> *tokens = [[[InnateLexer alloc] init:@"{\"key\":\"value\"}"] lex];
    InnateParser *parser = [InnateParser parserWithTokens:tokens];
    id <InnateValue> value = [parser parse];
    XCTAssert([value isObject]);
    NSDictionary<NSString *, id <InnateValue>> *dict = value.asObject;
    XCTAssertNotNil(dict);
    XCTAssertEqualObjects(dict[@"key"].asString, @"value");
}

@end