//
//  EventDetailViewController.m
//  BK
//
//  Created by Chen Jin on 5/7/15.
//  Copyright (c) 2015 Chen Jin. All rights reserved.
//

#import "EventDetailViewController.h"
#import <FBSDKCoreKit/FBSDKCoreKit.h>
#import <FBSDKLoginKit/FBSDKLoginKit.h>
#import <FBSDKShareKit/FBSDKShareKit.h>
#import "MapViewController.h"

@interface EventDetailViewController ()

@property (weak, nonatomic) IBOutlet UIImageView *eventImage;
@property (weak, nonatomic) IBOutlet UILabel *eventTime;
@property (weak, nonatomic) IBOutlet UILabel *eventContent;

@end

@implementation EventDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    NSString *name = self.event[@"name"];
    self.navigationItem.title = name;
    
    //set up background
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"background"]];
    
    //set up the image in detailed view
    NSString *image = self.event[@"image"];
    self.eventImage.image = [UIImage imageNamed:image];
    
    //set up the time in detailed view
    NSString *time = self.event[@"time"];
    self.eventTime.text = time;
    
    //set up the content in detailed view
    NSString *econtent = self.event[@"content"];
    self.eventContent.text = econtent;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark <UICollectionViewDataSource>

- (void) prepareForSegue: (UIStoryboardSegue *) segue sender: (id)sender {
    if ([segue.identifier isEqualToString:@"map"]) {        
        MapViewController *mvc = [segue destinationViewController];
        mvc.event = self.event;
    }
}

- (IBAction)shareButtonTouched: (id)sender {
   
    FBSDKShareLinkContent *content = [[FBSDKShareLinkContent alloc] init];
    content.contentURL = [NSURL URLWithString:self.event[@"url"]];
   [FBSDKShareDialog showFromViewController:self
                                 withContent:content
                                    delegate:nil];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
