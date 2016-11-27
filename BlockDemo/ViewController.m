//
//  ViewController.m
//  BlockDemo
//
//  Created by Santosh Vishwakarma on 21/02/16.
//  Copyright (c) 2016 LM. All rights reserved.
//

#import "ViewController.h"
#import "PhotoViewController.h"

@interface ViewController ()

@end

@implementation ViewController

//void (^responseHandler)(NSData *data, NSError *error);

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}



- (IBAction)loadImageButtonAction:(id)sender {
    
    //
    UIStoryboard *storyBoard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    PhotoViewController *photoVC = [storyBoard instantiateViewControllerWithIdentifier:@"photoViewController"];
    photoVC.imageURL = @"http://www.prime-junta.net/pont/img/How_to/ha_Testing_lenses/high_acc_low_res.jpg";
    [self.navigationController pushViewController:photoVC animated:YES];
    //[self presentViewController:photoVC animated:YES completion:nil];
    //[photoVC loadImageFromNetwork:@"http://www.prime-junta.net/pont/img/How_to/ha_Testing_lenses/high_acc_low_res.jpg"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
