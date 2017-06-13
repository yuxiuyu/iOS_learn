//
//  test_threadTests.m
//  test_threadTests
//
//  Created by jiazhen-mac-01 on 17/2/14.
//  Copyright © 2017年 yxy. All rights reserved.
//

#import <XCTest/XCTest.h>
#import <AFNetworking/AFNetworking.h>
#define WAIT do{[self expectationForNotification:@"RSBaseTest" object:nil handler:nil];[self waitForExpectationsWithTimeout:30 handler:nil];}while(0);
#define NOTIFY  [[NSNotificationCenter defaultCenter] postNotificationName:@"RSBaseTest" object:nil];
@interface test_threadTests : XCTestCase

@end

@implementation test_threadTests

- (void)setUp {
    [super setUp];
   
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testExample {
    int a=0;
    a=3;
    XCTAssertTrue(a==0,@"a不等于0");
    // This is an example of a functional test case.
    // Use XCTAssert and related functions to verify your tests produce the correct results.
}
-(void)testReguest
{
    AFHTTPRequestOperationManager*requestManager=[AFHTTPRequestOperationManager manager];
    requestManager.responseSerializer.acceptableContentTypes=[NSSet setWithObjects:@"text/html", nil];
    [requestManager GET:@"http://www.weather.com.cn/adat/sk/101110101.html" parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSLog(@"responseObject:%@",responseObject);
        XCTAssertNotNil(responseObject,@"返回出错");
        NOTIFY
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"error:%@",error);
        XCTAssertNotNil(error,@"请求出错");
        NOTIFY
    }];
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

@end
