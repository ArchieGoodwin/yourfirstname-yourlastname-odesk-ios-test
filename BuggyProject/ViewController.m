//
//  ViewController.m
//  BuggyProject
//  Copyright (c) 2014 oDesk Corporation. All rights reserved.
//

#import "ViewController.h"
#import "SomeClass.h"
#import "CoreDataHelpers.h"

@interface ViewController ()

@end

@implementation ViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)firstBug:(id)sender {
	[SomeClass printTextInMain:@"Bug 1"];
}

- (IBAction)secondBug:(id)sender {
	NSInteger x = 123;
	void (^printX)() = ^() {
		NSLog(@"%i", x);
	};
	x++;
	printX();
}

- (IBAction)thirdBug:(id)sender {
	[CoreDataHelpers fillUnsortedData];
	NSArray *models = [CoreDataHelpers arrayForFetchRequestWithName:@"AllModels"];
	NSLog(@"%@", models);
}

- (IBAction)fourthBug:(id)sender {
	static NSInteger count = 1;
	if (count>1) {
		[CoreDataHelpers cleanData];
	}
	
	[CoreDataHelpers fillUnsortedData];
	NSArray *models = [CoreDataHelpers arrayForFetchRequestWithName:@"AllModels"];
	NSLog(@"%@", models);
	
	count++;
}

- (IBAction)fifthBug:(id)sender {
	[CoreDataHelpers fillUnsortedData];
	NSArray *models = [CoreDataHelpers arrayForFetchRequestWithName:@"AllModels"];
	NSLog(@"%@", models);
}

@end
