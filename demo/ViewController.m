//
//  ViewController.m
//  demo
//
//  Created by yangxutao on 17/3/1.
//  Copyright © 2017年 yangxutao. All rights reserved.
//

#import "ViewController.h"
#import <ReactiveCocoa/ReactiveCocoa.h>
#import <objc/runtime.h>
#import <objc/objc-sync.h>

#import <AddressBook/AddressBook.h>
#import <AddressBookUI/AddressBookUI.h>

#import <EventKit/EventKit.h>

#import <Messages/Messages.h>
#import <MessageUI/MessageUI.h>

//#import <Intents/Intents.h>
//#import <IntentsUI/IntentsUI.h>
//
//#import <UserNotifications/UserNotifications.h>
//#import <UserNotificationsUI/UserNotificationsUI.h>


@interface ViewController ()<ViewControllerDelegate>

@property (nonatomic, strong) dispatch_queue_t queue;

@property (nonatomic, strong) UITextField *userName;

@property (nonatomic, strong) UITextField *userPassword;

@property (nonatomic, strong) UIButton *loginBtn;


@end

@implementation ViewController


void printFunction(char *str) {
    printf("---- %s",str);
}

- (void)aaaaaa {
    
}
- (void)viewDidLoad {

     [super viewDidLoad];
    
    
    
    [self aaaaaa];
    
    
    
    
//    UIDocumentInteractionController
//    UIActivityViewController
    
//    RACTuple *tuble = [RACTuple tupleWithObjectsFromArray:@[@11,@22,@33]];
    RACSignal *signal1 = [RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
        [subscriber sendNext:@"55"];
        [subscriber sendNext:@"66"];
        [subscriber sendNext:@"2"];
        [subscriber sendCompleted];
        return [RACDisposable disposableWithBlock:^{
             NSLog(@"--- signal1");
        }];
    }];
    
    RACSignal *signal2  = [[RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
        [subscriber sendNext:@"2"];
         [subscriber sendNext:@"3"];
        [subscriber sendCompleted];
        return [RACDisposable disposableWithBlock:^{
            NSLog(@"--- signal2");
        }];
    }] then:^RACSignal *{
        return [RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
            [subscriber sendNext:@"44"];
            [subscriber sendCompleted];
            return [RACDisposable disposableWithBlock:^{
                ;
            }];
        }];
    }];
    
//    [signal2 subscribeNext:^(id x) {
//        NSLog(@"=== %@",x);
//    }];
    
    
    
//    int count = 100;
//    BOOL canSaled = YES;
//    @synchronized (self) {
//        if (count) {
//            count--;
//        } else {
//            canSaled = NO;
//        }
//    }
    
//    objc_sync_enter(self);
//    objc_sync_exit(self);

//    V : view controller'view （页面展示，不处理逻辑）
//    M: model (数据管理，提供数据)
//    VM:view-model （处理逻辑，提供数据给view展示，还负责对上游数据的修改：比如，更新模型、数据库 网络请求等）
    
//    在 iOS 10 中，我们只能用 SiriKit 来做六类事情，分别是：
//    
//    语音和视频通话
//    发送消息
//    发送或接收付款
//    搜索照片
//    约车
//    管理健身
    
    
    
//    UITextField *textField = [[UITextField alloc] initWithFrame:CGRectMake(0, 100, 200, 30)];
//    textField.placeholder = @"请输入...";
//    textField.font = [UIFont systemFontOfSize:15];
//    [self.view addSubview:textField];
    
//    [[[[textField rac_textSignal] map:^id(NSString *value) {
//        return @(value.length);
//    }] filter:^BOOL(NSNumber *number) {
//        return  number.integerValue > 4;
//    }] subscribeNext:^(id x) {
//        NSLog(@"====== %@",x);
//    }];

//     [[textField.rac_textSignal throttle:1.0] subscribeNext:^(id x) {
//        NSLog(@"=====  %@",x);
//    }];
    

    
    
    
    
    
//    __block int num = 0;
//    RACSignal *signal = [[RACSignal createSignal:^RACDisposable *(id  subscriber) {
//        num++;
//        [subscriber sendNext:@(num)];
//        return nil;
//    }] replay];
//    
//    NSLog(@"Start subscriptions");
//    
//    // Subscriber 1 (S1)
//    [signal subscribeNext:^(id x) {
//        NSLog(@"S1: %@", x);
//    }];
//    
//    // Subscriber 2 (S2)
//    [signal subscribeNext:^(id x) {
//        NSLog(@"S2: %@", x);
//    }];
//    
//    // Subscriber 3 (S3)
//    [signal subscribeNext:^(id x) {
//        NSLog(@"S3: %@", x);
//    }];

    
    
    
    
    
    
    
    
//    [[signal1 finally:^{
//        NSLog(@"想要做的事");
//    }] subscribeNext:^(id x) {
//        ;
//    }];
    
    
//    RACSubject *letters = [RACSubject subject];
//    RACSubject *numbers = [RACSubject subject];
//    RACSignal *combined = [RACSignal
//                           combineLatest:@[ letters, numbers ]
//                           reduce:^(NSString *letter, NSString *number) {
//                               return [letter stringByAppendingString:number];
//                           }];
//    
//    // Outputs: B1 B2 C2 C3
//    [combined subscribeNext:^(id x) {
//        NSLog(@"%@", x);
//    }];
//    
//    [letters sendNext:@"A"];
//    [numbers sendNext:@"1"];
//    [letters sendNext:@"B"];
//    [numbers sendNext:@"2"];
//    [letters sendNext:@"C"];
//    [numbers sendNext:@"3"];
    
    
//    RACSubject *letters = [RACSubject subject];
//    RACSubject *numbers = [RACSubject subject];
//    RACSignal *merged = [RACSignal merge:@[ letters, numbers ]];
//    
//    // Outputs: A 1 B C 2
//    [merged subscribeNext:^(NSString *x) {
//        NSLog(@"%@", x);
//    }];
//    
//    [letters sendNext:@"A"];
//    [numbers sendNext:@"1"];
//    [letters sendNext:@"A"];
//    [letters sendNext:@"C"];
//    [numbers sendNext:@"2"];
//    
    
//    
//    RACSignal *letters = [@"A B C D E F G H I" componentsSeparatedByString:@" "].rac_sequence.signal;
//    
//    // The new signal only contains: 1 2 3 4 5 6 7 8 9
//    //
//    // But when subscribed to, it also outputs: A B C D E F G H I
//    RACSignal *sequenced = [[letters doNext:^(NSString *letter) {
//                                 NSLog(@"%@", letter);
//                             }] then:^{
//                                return [@"1 2 3 4 5 6 7 8 9" componentsSeparatedByString:@" "].rac_sequence.signal;
//                            }];
//
//    [sequenced subscribeNext:^(id x) {
//        NSLog(@"---%@",x);
//    }];
    
    
//    RACSequence *letters = [@"A B C D E F G H I" componentsSeparatedByString:@" "].rac_sequence;
//    [letters.signal subscribeNext:^(id x) {
//        NSLog(@"========  %@",x);
//    }];

    
    //忽略所有的next 等待 complete 然后返回一个新的信号；
//        RACSignal *thenSignal = [signal1 then:^RACSignal *{
//            return [RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
//                [subscriber sendNext:@"haha"];
//                [subscriber sendCompleted];
//                return [RACDisposable disposableWithBlock:^{
//                    ;
//                }];
//            }];
//        }];
//        [thenSignal subscribeNext:^(id x) {
//            NSLog(@"============  %@",x);
//        }];

    
//    RAC(self,userName.text) = signal1;
    
    
#pragma mark scanWithStart reduce
    // runnning  为第一次 聚合 的值，随着第二次合并到第二次的值；
//    [[signal1 scanWithStart:@"1" reduce:^id(id running, id next) {
//        NSString * str = [NSString stringWithFormat:@"%@=====%@",running,next];
//        return str;
//    }] subscribeNext:^(id x) {
//        NSLog(@"===== %@",x);
//    }];
//    打印：
//    2017-03-23 11:24:07.530 demo[13982:1015959] ===== 1=====1
//    2017-03-23 11:24:08.642 demo[13982:1015959] ===== 1=====1=====4
//    2017-03-23 11:24:17.776 demo[13982:1015959] ===== 1=====1=====4=====55
//
    
    
    
    
#pragma mark - doNext doComplete doError
//    [[[[signal1 doNext:^(id x) {
//        NSLog(@"------ 执行sendNext之前先会执行这个block");
//    }] doCompleted:^{
//        NSLog(@"----- 执行sendComplete之前先会执行这个block");
//    }] doError:^(NSError *error) {
//        NSLog(@"----- 执行sendError之前会执行这个block");
//    }] subscribeNext:^(id x) {
//        NSLog(@"---- %@",x);
//    }];
//    打印结果：
//    2017-03-23 11:10:26.109 demo[13849:1005198] ------ 执行sendNext之前先会执行这个block
//    2017-03-23 11:10:26.110 demo[13849:1005198] ---- 1
//    2017-03-23 11:10:26.110 demo[13849:1005198] ------ 执行sendNext之前先会执行这个block
//    2017-03-23 11:10:26.110 demo[13849:1005198] ---- 4
//    2017-03-23 11:10:26.110 demo[13849:1005198] ------ 执行sendNext之前先会执行这个block
//    2017-03-23 11:10:26.110 demo[13849:1005198] ---- 55
//    2017-03-23 11:10:26.110 demo[13849:1005198] ----- 执行sendComplete之前先会执行这个block
//    
    
#pragma mark switchToLatest
//    RACSubject *signalOfSignals = [RACSubject subject];
//    RACSubject *signal = [RACSubject subject];
//    
//    // 获取信号中信号最近发出信号，订阅最近发出的信号。
//    // 注意switchToLatest：只能用于信号中的信号
//    [signalOfSignals.switchToLatest subscribeNext:^(id x) {
//        NSLog(@"%@",x);
//    }];
//    [signalOfSignals sendNext:signal];
//    [signal sendNext:@1];
    
    
#pragma -mark combineLatestWith 的作用是，signal1 所发出数据的最后一个 和 signal2 发出的数据 一一结合成 RACTuple 元组；
//    RACSignal *combineSignal = [signal1 combineLatestWith:signal2];
//    [combineSignal subscribeNext:^(id x) {
//        NSLog(@"---------   %@",x);
//    }];
    
    
    //当第一次接受到的数据 也就是 sendNext 发出的数据 和 第二次的不一样时，distinctUntilChanged 产生的新信号就会 sendNext 发出数据；
//    [[_userName.rac_textSignal distinctUntilChanged] subscribeNext:^(id x) {
//        NSLog(@"====== %@",x);
//    }];
    
    
    
    

    
}

//登录 两句代码解决
- (void)login {
    
    _userName = [[UITextField alloc] initWithFrame:CGRectMake(50, 100, 200, 40)];
    _userName.placeholder = @"userName";
    _userName.font = [UIFont systemFontOfSize:16];
    _userName.textAlignment = NSTextAlignmentLeft;
    _userName.backgroundColor = [UIColor purpleColor];
    [self.view addSubview:_userName];
    
    _userPassword = [[UITextField alloc] initWithFrame:CGRectMake(50, 160, 200, 40)];
    _userPassword.placeholder = @"password";
    _userPassword.font = [UIFont systemFontOfSize:16];
    _userPassword.textAlignment = NSTextAlignmentLeft;
    _userPassword.backgroundColor = [UIColor purpleColor];
    [self.view addSubview:_userPassword];
    
    _loginBtn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    _loginBtn.frame = CGRectMake(10, 230, 300, 40);
    [_loginBtn setTitle:@"login" forState:UIControlStateNormal];
    _loginBtn.titleLabel.font = [UIFont systemFontOfSize:16];
    _loginBtn.backgroundColor = [UIColor greenColor];
    [self.view addSubview:_loginBtn];

    
    RAC(_loginBtn,enabled) = [RACSignal combineLatest:@[_userName.rac_textSignal,_userPassword.rac_textSignal] reduce:^id(NSString *name,NSString *password){
        return @(name.length >= 3 && password.length >= 6);
    }];
    
    [[_loginBtn rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(id x) {
        
    }];

}


- (void)test2 {
    //    RACSignal *signal = [RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {//RACPassthroughSubscriber
    //        NSLog(@"send A");
    //        [subscriber sendNext:@"A"];
    //        [subscriber sendCompleted];
    //        return [RACDisposable disposableWithBlock:^{
    //            NSLog(@"Original Signal Dispose.");
    //        }];
    //    }];
    //    //将冷信号转成热信号
    ////    RACSignal *hotSignal = [signal replay];
    //
    //    [signal subscribeNext:^(id x) {
    //        NSLog(@"S1: %@",x);
    //    }];
    //
    //    [signal subscribeNext:^(id x) {
    //        NSLog(@"S2: %@",x);
    //    }];
    
    
    //    [[[RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
    //        [subscriber sendNext:@"1"];
    //        [subscriber sendNext:@"2"];
    //        [subscriber sendNext:@"3"];
    //        [subscriber sendNext:@"4"];
    //        [subscriber sendNext:@"5"];
    //        [subscriber sendCompleted];
    //        return nil;
    //    }] takeUntilBlock:^BOOL(id x) {
    //        return [x isEqualToString:@"3"];
    //    }] subscribeNext:^(id x) {
    //        NSLog(@"S: %@", x);
    //    }];

}

- (void)test1 {
    //    _queue = dispatch_queue_create("myQueue", DISPATCH_QUEUE_SERIAL);
    _queue = dispatch_get_main_queue();
    //同步
    //    dispatch_sync(_queue, ^{
    //        NSLog(@"=======");
    //    });
    //    NSLog(@"--------");
    
    
    unsigned int count;
    //获取属性列表
    objc_property_t *propertyList = class_copyPropertyList([self class], &count);
    for (unsigned int i=0; i<count; i++) {
        const char *propertyname = property_getName(propertyList[i]);
        NSLog(@"property----="">%@", [NSString stringWithUTF8String:propertyname]);
    }
    //获取方法列表
    Method *methodList = class_copyMethodList([self class], &count);
    for (unsigned int i; i<count; i++) {
        Method method = methodList[i];
        NSLog(@"method----="">%@", NSStringFromSelector(method_getName(method)));
    }
    //获取成员变量列表
    Ivar *ivarList = class_copyIvarList([self class], &count);
    for (unsigned int i; i<count; i++) {
        Ivar myivar = ivarList[i];
        const char *ivarname =  ivar_getName(myivar);
        NSLog(@"ivar----="">%@", [NSString stringWithUTF8String:ivarname]);
    }
    //获取协议列表
    __unsafe_unretained Protocol **protocolList = class_copyProtocolList([self class], &count);
    for (unsigned int i; i<count; i++) {
        Protocol *myprotocal = protocolList[i];
        const char *protocolname = protocol_getName(myprotocal);
        NSLog(@"protocol----="">%@", [NSString stringWithUTF8String:protocolname]);
    }

}


- (void)test {
    
    //定时器
//        [[RACSignal interval:3.0 onScheduler:[RACScheduler mainThreadScheduler] withLeeway:2.0] subscribeNext:^(id x) {
//            NSLog(@"==============");
//        }];
    
    //延时去做
    //    [[RACScheduler mainThreadScheduler] afterDelay:2.0 schedule:^{
    //        NSLog(@"==============");
    //    }];
    
    //代理
    //    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"rac" message:nil delegate:nil cancelButtonTitle:@"cancel" otherButtonTitles:@"done", nil];
    //    [alertView show];
    //
    //    [[alertView rac_signalForSelector:@selector(alertView:clickedButtonAtIndex:) fromProtocol:@protocol(UIAlertViewDelegate)] subscribeNext:^(id x) {
    //        ;
    //    }];
    //    [[alertView rac_buttonClickedSignal] subscribeNext:^(id x) {
    //        ;
    //    }];
    
    
//        UITextField *textField = [[UITextField alloc] initWithFrame:CGRectMake(0, 100, 200, 30)];
//        textField.placeholder = @"请输入...";
//        textField.font = [UIFont systemFontOfSize:15];
//        [self.view addSubview:textField];
//        [[[[textField rac_textSignal] map:^id(NSString *value) {
//            return @(value.length);
//        }] filter:^BOOL(NSNumber *number) {
//            return  number.integerValue > 4;
//        }] subscribeNext:^(id x) {
//            NSLog(@"====== %@",x);
//        }];
    
    //延时操作
    //    RACSignal *signal = [[RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
    //        [subscriber sendNext:@"wwwww"];
    //        [subscriber sendCompleted];
    //        return [RACDisposable disposableWithBlock:^{
    //            ;
    //        }];
    //    }] delay:2.0];
    //    [signal subscribeNext:^(id x) {
    //        ;
    //    }];
    
    /*
     
     take表示只取前两次；skip表示跳过前两次；takeLast 表示取倒数的前两次
     takeWhileBlock BOOL值，意思是当返回YES的时候，订阅者才能收到信号
     skipWhileBlock BOOL值，意思是当返回YES的时候，订阅者就会跳过信号，NO的时候才接受
     skipUntilBlock BOOL值，意思是 返回NO的时候，不会收到消息， 直到返回YES的时候才开始收消息。
     repeat 重复发送信息
     */
    //    RACSignal *signal = [RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
    //        [subscriber sendNext:@"4"];
    //        [subscriber sendCompleted];
    //        return  [RACDisposable disposableWithBlock:^{
    //            ;
    //        }];
    //    }];
    //
    //    RACSignal *signal1 = [[RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
    //        [subscriber sendNext:@"1"];
    //        [subscriber sendNext:@"2"];
    //        [subscriber sendNext:@"3"];
    //        [subscriber sendCompleted];
    //        return [RACDisposable disposableWithBlock:^{
    //            ;
    //        }];
    //    }] takeUntil:signal];
    //    [signal1 subscribeNext:^(id x) {
    //        NSLog(@"===== %@",x);
    //    }];
    //    [signal subscribeNext:^(id x) {
    //        NSLog(@"===== %@",x);
    //    }];
    
    
    //    RACSignal *signal1 = [RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
    //        [subscriber sendNext:@"signal1"];
    //        NSError *error = [NSError errorWithDomain:@"http://" code:0 userInfo:@{@"code":@"xxx"}];
    //        [subscriber sendError:error];
    ////        [subscriber sendCompleted];
    //        return [RACDisposable disposableWithBlock:^{
    //            ;
    //        }];
    //    }];
    //
    //    RACSignal *signal2 = [RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
    //        [subscriber sendNext:@"signal2"];
    //        [subscriber sendCompleted];
    //        return [RACDisposable disposableWithBlock:^{
    //            ;
    //        }];
    //    }];
    //    [[RACSignal merge:@[signal1,signal2]] subscribeNext:^(id x) {
    //        NSLog(@"------%@",x);
    //    }];
    //    [[RACSignal concat:@[signal1,signal2]] subscribeNext:^(id x) {
    //         NSLog(@"------%@",x);
    //    }];
    //
    //    NSLog(@"====== %@",[signal2 name]);
    
    //秒表
    //    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 100, 200, 30)];
    //    label.backgroundColor = [UIColor greenColor];
    //    label.font = [UIFont systemFontOfSize:16];
    //    [self.view addSubview:label];
    //    RAC(label,text) = [[RACSignal interval:1.0 onScheduler:[RACScheduler mainThreadScheduler]] map:^id(id value) {
    //        return [value description];
    //    }];
    
    
    //    RACSignal *signal = [[[RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
    //        [subscriber sendNext:@"1"];
    //        [subscriber sendNext:@"2"];
    //        [subscriber sendCompleted];
    //        return [RACDisposable disposableWithBlock:^{
    //            ;
    //        }];
    //    }] map:^id(id value) {
    //        if ([value isEqualToString:@"1"]) {
    //            RACSignal *signal = [RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
    //                [subscriber sendNext:@"3"];
    //                [subscriber sendCompleted];
    //                return [RACDisposable disposableWithBlock:^{
    //                    ;
    //                }];
    //            }];
    //            return signal;
    //        }
    //        return nil;
    //    }] flattenMap:^RACStream *(id value) {
    //        RACSignal *signal = value;
    //        [signal subscribeNext:^(id x) {
    //            if ([x isEqualToString:@"3"]) {
    //                NSLog(@"操作成功");
    //            }
    //        }];
    //        return signal;
    //    }];
    //    [signal subscribeNext:^(id x) {
    //        NSLog(@"==== %@",x);
    //    }];
    
    
    //    RACSignal *signal = [RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
    //        [subscriber sendNext:@"1"];
    //        [subscriber sendCompleted];
    //        return [RACDisposable disposableWithBlock:^{
    //            ;
    //        }];
    //    }];
    
    //元组
    //    NSArray *array = @[@10,@14,@12];
    //    [array.rac_sequence.signal subscribeNext:^(id x) {
    //        NSLog(@"==== %@",x);
    //    }];
    //    NSDictionary *dic = @{@"name":@"uuuu",@"age":@"333"};
    //    [dic.rac_sequence.signal subscribeNext:^(RACTuple *tuple) {
    //        RACTupleUnpack(NSString *key,NSString *value) = tuple;
    //        NSLog(@"===key = %@",key);
    //        NSLog(@"===value = %@",value);
    //    }];
    
    
    
    //    UITextField *textField = [[UITextField alloc] initWithFrame:CGRectMake(0, 100, 200, 30)];
    //    textField.placeholder = @"请输入...";
    //    textField.borderStyle = UITextBorderStyleRoundedRect;
    //    textField.font = [UIFont systemFontOfSize:15];
    //    [self.view addSubview:textField];
    //
    //    UIButton *loginBtn = [[UIButton alloc] initWithFrame:CGRectMake(60, 150, 50, 30)];
    //    [loginBtn setTitle:@"login" forState:UIControlStateNormal];
    //    [self.view addSubview:loginBtn];
    
    
    //    RACCommand *command = [[RACCommand alloc] initWithSignalBlock:^RACSignal *(id input) {
    //        RACSignal *signal = [RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
    //            [subscriber sendNext:input];
    //            [subscriber sendCompleted];
    //            return [RACDisposable disposableWithBlock:^{
    //                ;
    //            }];
    //        }];
    //        return [textField.rac_textSignal map:^id(id value) {
    //            if ([value length] > 4) {
    //                return @([value length]);
    //            }
    //            return nil;
    //        }];
    //        return textField.rac_textSignal;
    //    }];
    
    //    [[command execute:@"333"] subscribeNext:^(id x) {
    //        NSLog(@"==== %@",x);
    //    }];
    //    [[command executionSignals] subscribeNext:^(RACSignal *signal) {
    //        [signal subscribeNext:^(id x) {
    //            NSLog(@"====== %@",x);
    //        }];
    //    }];
    //
    //    [command execute:@""];
    
    
    
    //    UIButton *loginBtn = [[UIButton alloc] initWithFrame:CGRectMake(60, 150, 50, 30)];
    //    loginBtn.backgroundColor = [UIColor greenColor];
    //    [loginBtn setTitle:@"login" forState:UIControlStateNormal];
    //    [self.view addSubview:loginBtn];
    //
    //    RACCommand *command = [[RACCommand alloc] initWithSignalBlock:^RACSignal *(id input) {
    //        RACSignal *signal = [RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
    //            [subscriber sendNext:@"222"];
    //            [subscriber sendCompleted];
    //            return nil;
    //        }];
    //        return signal;
    //    }];
    //    [command execute:@"11"];
    //    loginBtn.rac_command = command;
    
    
    //    RACSignal *signal = [RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
    //        NSArray *arr = [NSArray arrayWithObjects:@"22",@"33", nil];
    //        [subscriber sendNext:arr];
    //        [subscriber sendCompleted];
    //        return [RACDisposable disposableWithBlock:^{
    //            NSLog(@"加载完毕");
    //        }];
    //    }];
    //
    //    RACSignal *signal2 = [signal scanWithStart:[NSMutableArray array] reduce:^id(NSMutableArray *running, id next) {
    //        NSLog(@"===== %@",running);
    //        [running addObjectsFromArray:next];
    //        return running;
    //    }];
    //    [signal2 subscribeNext:^(id x) {
    //        ;
    //    }];
    
    
    
    
    //    NSString *(^countBlock)(int a,int b) = ^(int a,int b){
    //        return [NSString stringWithFormat:@"%d====%d",a,b];;
    //    };
    //    NSLog(@"%@",countBlock(3,5));
    
    
    
    
    RACSignal *signal = [RACSignal createSignal:
                         ^RACDisposable *(id<RACSubscriber> subscriber)
                         {
                             [subscriber sendNext:@1];
                             [subscriber sendNext:@90];
                             [subscriber sendNext:@34];
                             [subscriber sendCompleted];
                             return [RACDisposable disposableWithBlock:^{
                                 NSLog(@"signal dispose");
                             }];
                         }];
    
    
    RACSignal *signal1 = [RACSignal createSignal:
                          ^RACDisposable *(id<RACSubscriber> subscriber)
                          {
                              [subscriber sendNext:@2];
                              [subscriber sendNext:@3];
                              [subscriber sendNext:@6];
                              [subscriber sendCompleted];
                              return [RACDisposable disposableWithBlock:^{
                                  NSLog(@"signal dispose");
                              }];
                          }];
    
        RACSignal *concatSignal = [signal concat:signal1];
//    PS:  merge 和 concat 的区别； concat合并是当第一个信号发送完complete消息后紧接着发送第二个信号的数据；merge 是一个信号发送完数据接着就返回dispose，然后才开始发送第二个信号的数据，返回dispose；
//    concat
        [concatSignal subscribeNext:^(id x) {
            NSLog(@"subscribe value = %@", x);
        }];
//    merge
        RACSignal *mergeSignal = [signal merge:signal1];
        [mergeSignal subscribeNext:^(id x) {
            NSLog(@"=========== %@",x);
        }];
    
    //zipWith 拉链
    //当把两个信号通过zipWith之后，就像上面的那张图一样，拉链的两边被中间的拉索拉到了一起。既然是拉链，那么一一的位置是有对应的，上面的拉链第一个位置只能对着下面拉链第一个位置，这样拉链才能拉到一起去。
    //注意：返回的是元组
    
    //    RACSignal *zipSignal = [signal zipWith:signal1];
    //    [zipSignal subscribeNext:^(id x) {
    //        RACTuple *tuple = x;
    //        NSArray *arr = [tuple.rac_sequence array];
    //         NSLog(@"=========== %@",arr);
    //    }];
    
    
    //    RACSignal *bindSignal = [signal bind:^RACStreamBindBlock{
    //        return ^RACSignal *(NSNumber *value,BOOL *stop){
    //            value = @(value.integerValue * 2);
    //            return [RACSignal return:value];
    //        };
    //    }];
    //
    //    [bindSignal subscribeNext:^(id x) {
    //        NSLog(@"====== %@",x);
    //    }];
    
    
    //    RACSignal *replaceSignal = [[signal mapReplace:@"333"] not];
    //    [replaceSignal subscribeNext:^(id x) {
    //        NSLog(@"=========== %@",x);
    //    }];
    
    //    RACSignal *thenSignal = [signal then:^RACSignal *{
    //        return [RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
    //            [subscriber sendNext:@"haha"];
    //            [subscriber sendCompleted];
    //            return [RACDisposable disposableWithBlock:^{
    //                ;
    //            }];
    //        }];
    //    }];
    //    [thenSignal subscribeNext:^(id x) {
    //        NSLog(@"============  %@",x);
    //    }];
    
    //retry是在出现错误的情况下，再试2次；
    //    RACSignal *repeatSignal = [signal retry:2];
    //    [repeatSignal subscribeNext:^(id x) {
    //        NSLog(@"=========== %@",x);
    //    }];
    
    //    RACSignal *delaySignal = [signal combineLatestWith:signal1];
    //    [delaySignal subscribeNext:^(id x) {
    //        NSLog(@"------------- %@",x);
    //    }];
    
    
    //    [[signal finally:^{
    //        NSLog(@"已完成");
    //    }] subscribeNext:^(id x) {
    //        NSLog(@"-------- %@",x);
    //    }];
    
    //    [[signal collect]subscribeNext:^(id x) {
    //        NSLog(@"----------- %@",x);
    //    }];
    
    //    [[signal concat] subscribeNext:^(id x) {
    //        NSLog(@"------------ %@",x);
    //    }];

}













@end
