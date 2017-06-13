//
//  yxyuitestUITests.m
//  yxyuitestUITests
//
//  Created by jiazhen-mac-01 on 17/2/20.
//  Copyright © 2017年 yxy. All rights reserved.
//

#import <XCTest/XCTest.h>

@interface yxyuitestUITests : XCTestCase

@end

@implementation yxyuitestUITests

- (void)setUp {
    [super setUp];
    
    // Put setup code here. This method is called before the invocation of each test method in the class.
    
    
    // In UI tests it is usually best to stop immediately when a failure occurs.
    self.continueAfterFailure = NO;
    // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
    [[[XCUIApplication alloc] init] launch];
    
    // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}
- (void)testExample {
    
    XCUIApplication *app = [[XCUIApplication alloc] init];
    XCUIElementQuery *nameElementsQuery = [app.otherElements containingType:XCUIElementTypeStaticText identifier:@"Name"];
    XCUIElement *textField = [[nameElementsQuery childrenMatchingType:XCUIElementTypeTextField] elementBoundByIndex:1];
    [textField tap];
    [textField typeText:@"123"];
    
    XCUIElement *textField2 = [[nameElementsQuery childrenMatchingType:XCUIElementTypeTextField] elementBoundByIndex:0];
    [textField2 tap];
    [textField2 tap];
    [textField2 typeText:@"xiaoming"];
    [app.buttons[@"login"] tap];
    
    XCTAssertEqual(app.alerts.count, 0);
    
    
    // Use recording to get started writing UI tests.
    // Use XCTAssert and related functions to verify your tests produce the correct results.
}
-(void)testPush
{
    
    XCUIApplication *app = [[XCUIApplication alloc] init];
    [app.switches[@"1"] tap];
    
    XCUIElement *button = app.buttons[@"Button"];
    [button tap];
    [app.switches[@"0"] tap];
    [button tap];
    [[[[app.navigationBars[@"UIView"] childrenMatchingType:XCUIElementTypeButton] matchingIdentifier:@"Back"] elementBoundByIndex:0] tap];
    
}

@end
