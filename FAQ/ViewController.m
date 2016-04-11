//
//  ViewController.m
//  FAQ
//
//  Created by Aravind on 29/01/16.
//  Copyright © 2016 Aravind. All rights reserved.
//

#import "ViewController.h"
#import "SecondVC.h"
@interface ViewController ()<myCustomeDelegate>{
    NSInteger a;
    NSMutableArray *numbers;
}
- (IBAction)nextButtonTapped:(id)sender;

@end

@implementation ViewController

-(void)accessMyClassProtocolWithValue:(NSString *)vc{
    [self.myLabel setText:vc];
}
-(void)sampleCodeOne
{
    NSDictionary *dataDict = [NSDictionary dictionaryWithObjectsAndKeys:@"Debasis",@"firstName",@"Das",@"lastName", nil];
 
    
    
    NSOperationQueue *opQueue = [[NSOperationQueue alloc] init];
    //Create nsoperation
    NSInvocationOperation *invocOp = [[NSInvocationOperation alloc] initWithTarget:self selector:@selector(testMethodOne:) object:dataDict];
    [opQueue addOperation:invocOp];
    
}
-(void)testMethodOne:(id)obj
{
    NSLog(@"is testMethodOne running on main thread? ANS - %@",[NSThread isMainThread]? @"YES":@"NO");
    NSLog(@"obj %@",obj);
    
    //Do something using Obj or with Obj
}
-(void)sampleCodeTwo
{
    NSOperationQueue *operationQueue = [NSOperationQueue new];
    NSBlockOperation *blockCompletionOperation = [NSBlockOperation blockOperationWithBlock:^{
        NSLog(@"The block operation ended, Do something such as show a successmessage etc");
        //This the completion block operation
    }];
    NSBlockOperation *blockOperation = [NSBlockOperation blockOperationWithBlock:^{
        //This is the worker block operation
        [self methodOne];
    }];
    [blockCompletionOperation addDependency:blockOperation];
    [operationQueue addOperation:blockCompletionOperation];
    [operationQueue addOperation:blockOperation];
    
    
    
}

-(void)methodOne
{
    NSLog(@"is testMethodOne running on main thread? ANS - %@",[NSThread isMainThread]? @"YES":@"NO");
    for (int i = 0; i<5; i++)
    {
        NSLog(@"sleeps for 1 sec and i is %d",i);
//        sleep(1);
    }
}

 - (void)viewDidLoad {
    [super viewDidLoad];
     
     /****   NSOPERATION EXAMPLE *******/
     
     [self sampleCodeOne];
     
     [self sampleCodeTwo];
     
     
     
    NSLog(@"viewdidLoad");
    
    //*****     SORT AN ARRAY OF NUMBERS    *********//
    
    numbers = [NSMutableArray arrayWithObjects:@"23",@"121",@"12",@"340",@"0",@"2",nil];
    
    
    for (int i = 0; i < numbers.count; i++)
    {
        for ( int j = i ; j < numbers.count; ++j)
        {
            NSInteger iValue = [[numbers objectAtIndex:i] integerValue];
            NSInteger jValue = [[numbers objectAtIndex:j] integerValue];
            if (iValue > jValue)
            {
                a =  iValue;
                [numbers replaceObjectAtIndex:i withObject:[NSString stringWithFormat:@"%ld",(long)jValue]];
                [numbers replaceObjectAtIndex:j  withObject:[NSString stringWithFormat:@"%ld",(long)a]];
                //                NSLog(@"%@",numbers);
            }
        }
    }
    NSLog(@"%@",numbers);
/*  END */
    
    /* FIBONACCI SERIES*/
    int no =6;
    int next,first=0,second = 1 ;
    
    for (int c = 0 ; c < no; c++ )
    {
        if ( c <= 1 )
            next = c;
        else
        {
            next = first + second;
            first = second;
            second = next;
        }
        printf("%d\n",next);
    }
    /*  END */

    
    /*  PALINDROM OF A STRING*/
    
    NSString *str = @"WOW";
    NSMutableString *copyStr = [[NSMutableString alloc] init];
    for (NSInteger i = str.length; i>0; i--) {
        NSString *lastStr = [str substringWithRange:NSMakeRange(i-1, 1)];
        [copyStr appendString:lastStr];
    }
    if ([str isEqualToString:copyStr]) {
        NSLog(@"Palidrom string");
    }else{
        NSLog(@" not Palidrom string");
    }
    /*  END */

    
/*  Armstrong Number 153 = 1*1*1 + 5*5*5 + 3*3*3    */
    
    
    int n = 153, n1, rem, num=0;
    
    
    n1=n;
    while(n1!=0)
    {
        rem=n1%10;
        num+=rem*rem*rem;
        n1/=10;
    }
    if(num==n)
        printf("%d is an Armstrong number.",n);
    else
        printf("%d is not an Armstrong number.",n);
    /*  END */

    //    [self performSelector:@selector(mymethod) withObject:self afterDelay:10.f];
    
    // Do any additional setup after loading the view, typically from a nib.
}
-(void)mymethod{
    [self.view removeFromSuperview];
    self.view = nil;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
    
    if (![self isViewLoaded]) {
        /* release your custom data which will be rebuilt in loadView or viewDidLoad */
    }
}
- (void)loadView{
    [super loadView];
    NSLog(@"loadView");
} // This is where subclasses should create their custom view hierarchy if they aren't using a nib. Should never be called directly.
- (void)loadViewIfNeeded {
    [super loadViewIfNeeded];NSLog(@"loadViewIfNeeded");
}//NS_AVAILABLE_IOS(9_0); // Loads the view controller's view if it has not already been set.
- (void)viewWillUnload{
    [super viewWillUnload];NSLog(@"viewWillUnload");
}// NS_DEPRECATED_IOS(5_0,6_0);
- (void)viewDidUnload{
    [super viewDidUnload];NSLog(@"viewDidUnload");
}// NS_DEPRECATED_IOS(3_0,6_0); // Called after the view controller's view is released and set to nil. For example, a memory warning which causes the view to be purged. Not invoked as a result of -dealloc.

//- (void)viewDidLoad{} // Called after the view has been loaded. For view controllers created in code, this is after -loadView. For view controllers unarchived from a nib, this is after the view is set.
- (void)viewWillAppear:(BOOL)animated{[super viewWillAppear:animated];    NSLog(@"viewWillAppear");
}   // Called when the view is about to made visible. Default does nothing
- (void)viewDidAppear:(BOOL)animated{  [super viewDidAppear:animated];  NSLog(@"viewDidAppear");
}     // Called when the view has been fully transitioned onto the screen. Default does nothing
- (void)viewWillDisappear:(BOOL)animated{    NSLog(@"viewWillDisappear");
} // Called when the view is dismissed, covered or otherwise hidden. Default does nothing
- (void)viewDidDisappear:(BOOL)animated{    NSLog(@"viewDidDisappear");
}  // Called after the view was dismissed, covered or otherwise hidden. Default does nothing

// Called just before the view controller's view's layoutSubviews method is invoked. Subclasses can implement as necessary. The default is a nop.
- (void)viewWillLayoutSubviews{  [super viewWillLayoutSubviews];  NSLog(@"viewWillLayoutSubviews");
}// NS_AVAILABLE_IOS(5_0);
// Called just after the view controller's view's layoutSubviews method is invoked. Subclasses can implement as necessary. The default is a nop.
- (void)viewDidLayoutSubviews{
    [super viewDidLayoutSubviews];
    NSLog(@"viewDidLayoutSubviews");
    
}//NS_AVAILABLE_IOS(5_0);
- (IBAction)nextButtonTapped:(id)sender {
    SecondVC *secVc = [[SecondVC alloc] init];
    secVc.delegate  =self;
    secVc->myPublicVariable = 10;
      [self.navigationController pushViewController:secVc animated:YES];
}
@end
