// This file was autogenerated from Tests/html5lib/tokenizer/test1.test

#import <SenTestingKit/SenTestingKit.h>
#import "HTMLTokenizerTestUtilities.h"

@interface TokenizerTest1Tests : SenTestCase

@end

@implementation TokenizerTest1Tests
        
- (void)test00
{
    NSArray *expectedTokens = ReifiedTokensForTestTokens(@[@[@"DOCTYPE", @"html", [NSNull null], [NSNull null], @YES]]);
    for (NSString *state in @[@""]) {
        HTMLTokenizer *tokenizer = [[HTMLTokenizer alloc] initWithString:@"<!DOCTYPE html>" state:StateNamed(state)];
        STAssertEqualObjects(tokenizer.allObjects, expectedTokens, @"%@", @"Correct Doctype lowercase");
    }
}
        
- (void)test01
{
    NSArray *expectedTokens = ReifiedTokensForTestTokens(@[@[@"DOCTYPE", @"html", [NSNull null], [NSNull null], @YES]]);
    for (NSString *state in @[@""]) {
        HTMLTokenizer *tokenizer = [[HTMLTokenizer alloc] initWithString:@"<!DOCTYPE HTML>" state:StateNamed(state)];
        STAssertEqualObjects(tokenizer.allObjects, expectedTokens, @"%@", @"Correct Doctype uppercase");
    }
}
        
- (void)test02
{
    NSArray *expectedTokens = ReifiedTokensForTestTokens(@[@[@"DOCTYPE", @"html", [NSNull null], [NSNull null], @YES]]);
    for (NSString *state in @[@""]) {
        HTMLTokenizer *tokenizer = [[HTMLTokenizer alloc] initWithString:@"<!DOCTYPE HtMl>" state:StateNamed(state)];
        STAssertEqualObjects(tokenizer.allObjects, expectedTokens, @"%@", @"Correct Doctype mixed case");
    }
}
        
- (void)test03
{
    NSArray *expectedTokens = ReifiedTokensForTestTokens(@[@"ParseError", @[@"DOCTYPE", @"html", [NSNull null], [NSNull null], @NO]]);
    for (NSString *state in @[@""]) {
        HTMLTokenizer *tokenizer = [[HTMLTokenizer alloc] initWithString:@"<!DOCTYPE HtMl" state:StateNamed(state)];
        STAssertEqualObjects(tokenizer.allObjects, expectedTokens, @"%@", @"Correct Doctype case with EOF");
    }
}
        
- (void)test04
{
    NSArray *expectedTokens = ReifiedTokensForTestTokens(@[@"ParseError", @[@"Comment", @"DOC"]]);
    for (NSString *state in @[@""]) {
        HTMLTokenizer *tokenizer = [[HTMLTokenizer alloc] initWithString:@"<!DOC>" state:StateNamed(state)];
        STAssertEqualObjects(tokenizer.allObjects, expectedTokens, @"%@", @"Truncated doctype start");
    }
}
        
- (void)test05
{
    NSArray *expectedTokens = ReifiedTokensForTestTokens(@[@[@"DOCTYPE", @"foo", [NSNull null], [NSNull null], @YES]]);
    for (NSString *state in @[@""]) {
        HTMLTokenizer *tokenizer = [[HTMLTokenizer alloc] initWithString:@"<!DOCTYPE foo>" state:StateNamed(state)];
        STAssertEqualObjects(tokenizer.allObjects, expectedTokens, @"%@", @"Doctype in error");
    }
}
        
- (void)test06
{
    NSArray *expectedTokens = ReifiedTokensForTestTokens(@[@[@"StartTag", @"h", @{}]]);
    for (NSString *state in @[@""]) {
        HTMLTokenizer *tokenizer = [[HTMLTokenizer alloc] initWithString:@"<h>" state:StateNamed(state)];
        STAssertEqualObjects(tokenizer.allObjects, expectedTokens, @"%@", @"Single Start Tag");
    }
}
        
- (void)test07
{
    NSArray *expectedTokens = ReifiedTokensForTestTokens(@[@"ParseError"]);
    for (NSString *state in @[@""]) {
        HTMLTokenizer *tokenizer = [[HTMLTokenizer alloc] initWithString:@"</>" state:StateNamed(state)];
        STAssertEqualObjects(tokenizer.allObjects, expectedTokens, @"%@", @"Empty end tag");
    }
}
        
- (void)test08
{
    NSArray *expectedTokens = ReifiedTokensForTestTokens(@[@"ParseError", @[@"Character", @"<>"]]);
    for (NSString *state in @[@""]) {
        HTMLTokenizer *tokenizer = [[HTMLTokenizer alloc] initWithString:@"<>" state:StateNamed(state)];
        STAssertEqualObjects(tokenizer.allObjects, expectedTokens, @"%@", @"Empty start tag");
    }
}
        
- (void)test09
{
    NSArray *expectedTokens = ReifiedTokensForTestTokens(@[@[@"StartTag", @"h", @{@"a": @"b"}]]);
    for (NSString *state in @[@""]) {
        HTMLTokenizer *tokenizer = [[HTMLTokenizer alloc] initWithString:@"<h a='b'>" state:StateNamed(state)];
        STAssertEqualObjects(tokenizer.allObjects, expectedTokens, @"%@", @"Start Tag w/attribute");
    }
}
        
- (void)test10
{
    NSArray *expectedTokens = ReifiedTokensForTestTokens(@[@[@"StartTag", @"h", @{@"a": @"b"}]]);
    for (NSString *state in @[@""]) {
        HTMLTokenizer *tokenizer = [[HTMLTokenizer alloc] initWithString:@"<h a=b>" state:StateNamed(state)];
        STAssertEqualObjects(tokenizer.allObjects, expectedTokens, @"%@", @"Start Tag w/attribute no quotes");
    }
}
        
- (void)test11
{
    NSArray *expectedTokens = ReifiedTokensForTestTokens(@[@[@"StartTag", @"h", @{}], @[@"EndTag", @"h"]]);
    for (NSString *state in @[@""]) {
        HTMLTokenizer *tokenizer = [[HTMLTokenizer alloc] initWithString:@"<h></h>" state:StateNamed(state)];
        STAssertEqualObjects(tokenizer.allObjects, expectedTokens, @"%@", @"Start/End Tag");
    }
}
        
- (void)test12
{
    NSArray *expectedTokens = ReifiedTokensForTestTokens(@[@[@"StartTag", @"p", @{}], @[@"Character", @"One"], @[@"StartTag", @"p", @{}], @[@"Character", @"Two"]]);
    for (NSString *state in @[@""]) {
        HTMLTokenizer *tokenizer = [[HTMLTokenizer alloc] initWithString:@"<p>One<p>Two" state:StateNamed(state)];
        STAssertEqualObjects(tokenizer.allObjects, expectedTokens, @"%@", @"Two unclosed start tags");
    }
}
        
- (void)test13
{
    NSArray *expectedTokens = ReifiedTokensForTestTokens(@[@[@"StartTag", @"h", @{}], @"ParseError", @[@"EndTag", @"h"]]);
    for (NSString *state in @[@""]) {
        HTMLTokenizer *tokenizer = [[HTMLTokenizer alloc] initWithString:@"<h></h a='b'>" state:StateNamed(state)];
        STAssertEqualObjects(tokenizer.allObjects, expectedTokens, @"%@", @"End Tag w/attribute");
    }
}
        
- (void)test14
{
    NSArray *expectedTokens = ReifiedTokensForTestTokens(@[@[@"StartTag", @"h", @{@"a": @"b", @"c": @"d"}]]);
    for (NSString *state in @[@""]) {
        HTMLTokenizer *tokenizer = [[HTMLTokenizer alloc] initWithString:@"<h a='b' c='d'>" state:StateNamed(state)];
        STAssertEqualObjects(tokenizer.allObjects, expectedTokens, @"%@", @"Multiple atts");
    }
}
        
- (void)test15
{
    NSArray *expectedTokens = ReifiedTokensForTestTokens(@[@"ParseError", @[@"StartTag", @"h", @{@"a": @"b", @"c": @"d"}]]);
    for (NSString *state in @[@""]) {
        HTMLTokenizer *tokenizer = [[HTMLTokenizer alloc] initWithString:@"<h a='b'c='d'>" state:StateNamed(state)];
        STAssertEqualObjects(tokenizer.allObjects, expectedTokens, @"%@", @"Multiple atts no space");
    }
}
        
- (void)test16
{
    NSArray *expectedTokens = ReifiedTokensForTestTokens(@[@"ParseError", @[@"StartTag", @"h", @{@"a": @"b"}]]);
    for (NSString *state in @[@""]) {
        HTMLTokenizer *tokenizer = [[HTMLTokenizer alloc] initWithString:@"<h a='b' a='d'>" state:StateNamed(state)];
        STAssertEqualObjects(tokenizer.allObjects, expectedTokens, @"%@", @"Repeated attr");
    }
}
        
- (void)test17
{
    NSArray *expectedTokens = ReifiedTokensForTestTokens(@[@[@"Comment", @"comment"]]);
    for (NSString *state in @[@""]) {
        HTMLTokenizer *tokenizer = [[HTMLTokenizer alloc] initWithString:@"<!--comment-->" state:StateNamed(state)];
        STAssertEqualObjects(tokenizer.allObjects, expectedTokens, @"%@", @"Simple comment");
    }
}
        
- (void)test18
{
    NSArray *expectedTokens = ReifiedTokensForTestTokens(@[@"ParseError", @[@"Comment", @"-"]]);
    for (NSString *state in @[@""]) {
        HTMLTokenizer *tokenizer = [[HTMLTokenizer alloc] initWithString:@"<!----->" state:StateNamed(state)];
        STAssertEqualObjects(tokenizer.allObjects, expectedTokens, @"%@", @"Comment, Central dash no space");
    }
}
        
- (void)test19
{
    NSArray *expectedTokens = ReifiedTokensForTestTokens(@[@"ParseError", @[@"Comment", @" --comment "]]);
    for (NSString *state in @[@""]) {
        HTMLTokenizer *tokenizer = [[HTMLTokenizer alloc] initWithString:@"<!-- --comment -->" state:StateNamed(state)];
        STAssertEqualObjects(tokenizer.allObjects, expectedTokens, @"%@", @"Comment, two central dashes");
    }
}
        
- (void)test20
{
    NSArray *expectedTokens = ReifiedTokensForTestTokens(@[@"ParseError", @[@"Comment", @"comment"]]);
    for (NSString *state in @[@""]) {
        HTMLTokenizer *tokenizer = [[HTMLTokenizer alloc] initWithString:@"<!--comment" state:StateNamed(state)];
        STAssertEqualObjects(tokenizer.allObjects, expectedTokens, @"%@", @"Unfinished comment");
    }
}
        
- (void)test21
{
    NSArray *expectedTokens = ReifiedTokensForTestTokens(@[@"ParseError", @[@"Comment", @"-"]]);
    for (NSString *state in @[@""]) {
        HTMLTokenizer *tokenizer = [[HTMLTokenizer alloc] initWithString:@"<!-" state:StateNamed(state)];
        STAssertEqualObjects(tokenizer.allObjects, expectedTokens, @"%@", @"Start of a comment");
    }
}
        
- (void)test22
{
    NSArray *expectedTokens = ReifiedTokensForTestTokens(@[@"ParseError", @[@"Comment", @""]]);
    for (NSString *state in @[@""]) {
        HTMLTokenizer *tokenizer = [[HTMLTokenizer alloc] initWithString:@"<!-->" state:StateNamed(state)];
        STAssertEqualObjects(tokenizer.allObjects, expectedTokens, @"%@", @"Short comment");
    }
}
        
- (void)test23
{
    NSArray *expectedTokens = ReifiedTokensForTestTokens(@[@"ParseError", @[@"Comment", @""]]);
    for (NSString *state in @[@""]) {
        HTMLTokenizer *tokenizer = [[HTMLTokenizer alloc] initWithString:@"<!--->" state:StateNamed(state)];
        STAssertEqualObjects(tokenizer.allObjects, expectedTokens, @"%@", @"Short comment two");
    }
}
        
- (void)test24
{
    NSArray *expectedTokens = ReifiedTokensForTestTokens(@[@[@"Comment", @""]]);
    for (NSString *state in @[@""]) {
        HTMLTokenizer *tokenizer = [[HTMLTokenizer alloc] initWithString:@"<!---->" state:StateNamed(state)];
        STAssertEqualObjects(tokenizer.allObjects, expectedTokens, @"%@", @"Short comment three");
    }
}
        
- (void)test25
{
    NSArray *expectedTokens = ReifiedTokensForTestTokens(@[@[@"Character", @"&"]]);
    for (NSString *state in @[@""]) {
        HTMLTokenizer *tokenizer = [[HTMLTokenizer alloc] initWithString:@"&" state:StateNamed(state)];
        STAssertEqualObjects(tokenizer.allObjects, expectedTokens, @"%@", @"Ampersand EOF");
    }
}
        
- (void)test26
{
    NSArray *expectedTokens = ReifiedTokensForTestTokens(@[@[@"Character", @"&&"]]);
    for (NSString *state in @[@""]) {
        HTMLTokenizer *tokenizer = [[HTMLTokenizer alloc] initWithString:@"&&" state:StateNamed(state)];
        STAssertEqualObjects(tokenizer.allObjects, expectedTokens, @"%@", @"Ampersand ampersand EOF");
    }
}
        
- (void)test27
{
    NSArray *expectedTokens = ReifiedTokensForTestTokens(@[@[@"Character", @"& "]]);
    for (NSString *state in @[@""]) {
        HTMLTokenizer *tokenizer = [[HTMLTokenizer alloc] initWithString:@"& " state:StateNamed(state)];
        STAssertEqualObjects(tokenizer.allObjects, expectedTokens, @"%@", @"Ampersand space EOF");
    }
}
        
- (void)test28
{
    NSArray *expectedTokens = ReifiedTokensForTestTokens(@[@"ParseError", @[@"Character", @"&f"]]);
    for (NSString *state in @[@""]) {
        HTMLTokenizer *tokenizer = [[HTMLTokenizer alloc] initWithString:@"&f" state:StateNamed(state)];
        STAssertEqualObjects(tokenizer.allObjects, expectedTokens, @"%@", @"Unfinished entity");
    }
}
        
- (void)test29
{
    NSArray *expectedTokens = ReifiedTokensForTestTokens(@[@"ParseError", @[@"Character", @"&#"]]);
    for (NSString *state in @[@""]) {
        HTMLTokenizer *tokenizer = [[HTMLTokenizer alloc] initWithString:@"&#" state:StateNamed(state)];
        STAssertEqualObjects(tokenizer.allObjects, expectedTokens, @"%@", @"Ampersand, number sign");
    }
}
        
- (void)test30
{
    NSArray *expectedTokens = ReifiedTokensForTestTokens(@[@"ParseError", @[@"Character", @"&#x"]]);
    for (NSString *state in @[@""]) {
        HTMLTokenizer *tokenizer = [[HTMLTokenizer alloc] initWithString:@"&#x" state:StateNamed(state)];
        STAssertEqualObjects(tokenizer.allObjects, expectedTokens, @"%@", @"Unfinished numeric entity");
    }
}
        
- (void)test31
{
    NSArray *expectedTokens = ReifiedTokensForTestTokens(@[@[@"Character", @"I'm ¬it"]]);
    for (NSString *state in @[@""]) {
        HTMLTokenizer *tokenizer = [[HTMLTokenizer alloc] initWithString:@"I'm &not;it" state:StateNamed(state)];
        STAssertEqualObjects(tokenizer.allObjects, expectedTokens, @"%@", @"Entity with trailing semicolon (1)");
    }
}
        
- (void)test32
{
    NSArray *expectedTokens = ReifiedTokensForTestTokens(@[@[@"Character", @"I'm ∉"]]);
    for (NSString *state in @[@""]) {
        HTMLTokenizer *tokenizer = [[HTMLTokenizer alloc] initWithString:@"I'm &notin;" state:StateNamed(state)];
        STAssertEqualObjects(tokenizer.allObjects, expectedTokens, @"%@", @"Entity with trailing semicolon (2)");
    }
}
        
- (void)test33
{
    NSArray *expectedTokens = ReifiedTokensForTestTokens(@[@[@"Character", @"I'm "], @"ParseError", @[@"Character", @"¬it"]]);
    for (NSString *state in @[@""]) {
        HTMLTokenizer *tokenizer = [[HTMLTokenizer alloc] initWithString:@"I'm &notit" state:StateNamed(state)];
        STAssertEqualObjects(tokenizer.allObjects, expectedTokens, @"%@", @"Entity without trailing semicolon (1)");
    }
}
        
- (void)test34
{
    NSArray *expectedTokens = ReifiedTokensForTestTokens(@[@[@"Character", @"I'm "], @"ParseError", @[@"Character", @"¬in"]]);
    for (NSString *state in @[@""]) {
        HTMLTokenizer *tokenizer = [[HTMLTokenizer alloc] initWithString:@"I'm &notin" state:StateNamed(state)];
        STAssertEqualObjects(tokenizer.allObjects, expectedTokens, @"%@", @"Entity without trailing semicolon (2)");
    }
}
        
- (void)test35
{
    NSArray *expectedTokens = ReifiedTokensForTestTokens(@[@[@"Character", @"I'm "], @"ParseError", @[@"Character", @"&no"]]);
    for (NSString *state in @[@""]) {
        HTMLTokenizer *tokenizer = [[HTMLTokenizer alloc] initWithString:@"I'm &no" state:StateNamed(state)];
        STAssertEqualObjects(tokenizer.allObjects, expectedTokens, @"%@", @"Partial entity match at end of file");
    }
}
        
- (void)test36
{
    NSArray *expectedTokens = ReifiedTokensForTestTokens(@[@"ParseError", @[@"Character", @"&¬;"]]);
    for (NSString *state in @[@""]) {
        HTMLTokenizer *tokenizer = [[HTMLTokenizer alloc] initWithString:@"&¬;" state:StateNamed(state)];
        STAssertEqualObjects(tokenizer.allObjects, expectedTokens, @"%@", @"Non-ASCII character reference name");
    }
}
        
- (void)test37
{
    NSArray *expectedTokens = ReifiedTokensForTestTokens(@[@[@"Character", @"$"]]);
    for (NSString *state in @[@""]) {
        HTMLTokenizer *tokenizer = [[HTMLTokenizer alloc] initWithString:@"&#0036;" state:StateNamed(state)];
        STAssertEqualObjects(tokenizer.allObjects, expectedTokens, @"%@", @"ASCII decimal entity");
    }
}
        
- (void)test38
{
    NSArray *expectedTokens = ReifiedTokensForTestTokens(@[@[@"Character", @"?"]]);
    for (NSString *state in @[@""]) {
        HTMLTokenizer *tokenizer = [[HTMLTokenizer alloc] initWithString:@"&#x3f;" state:StateNamed(state)];
        STAssertEqualObjects(tokenizer.allObjects, expectedTokens, @"%@", @"ASCII hexadecimal entity");
    }
}
        
- (void)test39
{
    NSArray *expectedTokens = ReifiedTokensForTestTokens(@[@[@"StartTag", @"h", @{@"a": @"?"}], @[@"EndTag", @"h"]]);
    for (NSString *state in @[@""]) {
        HTMLTokenizer *tokenizer = [[HTMLTokenizer alloc] initWithString:@"<h a='&#x3f;'></h>" state:StateNamed(state)];
        STAssertEqualObjects(tokenizer.allObjects, expectedTokens, @"%@", @"Hexadecimal entity in attribute");
    }
}
        
- (void)test40
{
    NSArray *expectedTokens = ReifiedTokensForTestTokens(@[@"ParseError", @[@"StartTag", @"h", @{@"a": @"&notx"}]]);
    for (NSString *state in @[@""]) {
        HTMLTokenizer *tokenizer = [[HTMLTokenizer alloc] initWithString:@"<h a='&notx'>" state:StateNamed(state)];
        STAssertEqualObjects(tokenizer.allObjects, expectedTokens, @"%@", @"Entity in attribute without semicolon ending in x");
    }
}
        
- (void)test41
{
    NSArray *expectedTokens = ReifiedTokensForTestTokens(@[@"ParseError", @[@"StartTag", @"h", @{@"a": @"&not1"}]]);
    for (NSString *state in @[@""]) {
        HTMLTokenizer *tokenizer = [[HTMLTokenizer alloc] initWithString:@"<h a='&not1'>" state:StateNamed(state)];
        STAssertEqualObjects(tokenizer.allObjects, expectedTokens, @"%@", @"Entity in attribute without semicolon ending in 1");
    }
}
        
- (void)test42
{
    NSArray *expectedTokens = ReifiedTokensForTestTokens(@[@"ParseError", @[@"StartTag", @"h", @{@"a": @"&noti"}]]);
    for (NSString *state in @[@""]) {
        HTMLTokenizer *tokenizer = [[HTMLTokenizer alloc] initWithString:@"<h a='&noti'>" state:StateNamed(state)];
        STAssertEqualObjects(tokenizer.allObjects, expectedTokens, @"%@", @"Entity in attribute without semicolon ending in i");
    }
}
        
- (void)test43
{
    NSArray *expectedTokens = ReifiedTokensForTestTokens(@[@"ParseError", @[@"StartTag", @"h", @{@"a": @"©"}]]);
    for (NSString *state in @[@""]) {
        HTMLTokenizer *tokenizer = [[HTMLTokenizer alloc] initWithString:@"<h a='&COPY'>" state:StateNamed(state)];
        STAssertEqualObjects(tokenizer.allObjects, expectedTokens, @"%@", @"Entity in attribute without semicolon");
    }
}
        
- (void)test44
{
    NSArray *expectedTokens = ReifiedTokensForTestTokens(@[@[@"StartTag", @"s", @{@"o": @"&", @"t": @""}]]);
    for (NSString *state in @[@""]) {
        HTMLTokenizer *tokenizer = [[HTMLTokenizer alloc] initWithString:@"<s o=& t>" state:StateNamed(state)];
        STAssertEqualObjects(tokenizer.allObjects, expectedTokens, @"%@", @"Unquoted attribute ending in ampersand");
    }
}
        
- (void)test45
{
    NSArray *expectedTokens = ReifiedTokensForTestTokens(@[@[@"StartTag", @"a", @{@"a": @"a&"}], @[@"Character", @"foo"]]);
    for (NSString *state in @[@""]) {
        HTMLTokenizer *tokenizer = [[HTMLTokenizer alloc] initWithString:@"<a a=a&>foo" state:StateNamed(state)];
        STAssertEqualObjects(tokenizer.allObjects, expectedTokens, @"%@", @"Unquoted attribute at end of tag with final character of &, with tag followed by characters");
    }
}
        
- (void)test46
{
    NSArray *expectedTokens = ReifiedTokensForTestTokens(@[@[@"StartTag", @"plaintext", @{}], @[@"Character", @"foobar"]]);
    for (NSString *state in @[@""]) {
        HTMLTokenizer *tokenizer = [[HTMLTokenizer alloc] initWithString:@"<plaintext>foobar" state:StateNamed(state)];
        STAssertEqualObjects(tokenizer.allObjects, expectedTokens, @"%@", @"plaintext element");
    }
}
        
- (void)test47
{
    NSArray *expectedTokens = ReifiedTokensForTestTokens(@[@"ParseError", @[@"StartTag", @"a", @{@"a": @"f<"}]]);
    for (NSString *state in @[@""]) {
        HTMLTokenizer *tokenizer = [[HTMLTokenizer alloc] initWithString:@"<a a=f<>" state:StateNamed(state)];
        STAssertEqualObjects(tokenizer.allObjects, expectedTokens, @"%@", @"Open angled bracket in unquoted attribute value state");
    }
}

@end
