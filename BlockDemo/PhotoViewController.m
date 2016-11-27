//
//  PhotoViewController.m
//  BlockDemo
//
//  Created by Trainer on 21/02/16.
//  Copyright (c) 2016 LM. All rights reserved.
//

#import "PhotoViewController.h"

@interface PhotoViewController ()

@property (nonatomic, copy) void (^resposeHandler) (NSData *data, NSError *error);
@property (nonatomic, strong)UIImage *image;

@property (nonatomic, strong) NSMutableArray *dataArray;

@end

@implementation PhotoViewController

void(^dataHandler)(NSData *, NSError *);
void (^errorBlock)(void);



- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.dataArray= [[NSMutableArray alloc] initWithArray:@[@1,@2,@3,@4,@5]];
    
    __weak PhotoViewController *selfRef = self;
    self.resposeHandler = ^void(NSData *data, NSError *error) {
        
        selfRef.image = [UIImage imageWithData:data];
        dispatch_async(dispatch_get_main_queue(), ^ {
            UIImageView *imageView = [[UIImageView alloc] initWithImage:selfRef.image];
            [selfRef.view addSubview:imageView];
        });
        
    };
    if(self.image == nil) {
        [self loadImagesFromNetwork:self.imageURL withResponseBlock:self.resposeHandler];
    }
    
    // Dispatch blocks
    
    dispatch_block_t myBlock = ^ {
        
        NSLog(@"%@", self);
    };
    
    myBlock();
    
}

- (void) loadImagesFromNetwork : (NSString *)imageUrl withResponseBlock : (void(^)(NSData *, NSError *))responseBlock {
    // Session configuration
    NSURLSessionConfiguration *config = [NSURLSessionConfiguration ephemeralSessionConfiguration];
    // Session
    NSURLSession *session = [NSURLSession sessionWithConfiguration:config];
    // SessionDataTask
    NSURLSessionDataTask *task= [session dataTaskWithURL:[NSURL URLWithString:imageUrl] completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
        responseBlock(data, error);
    }];
    // Start task
    [task resume];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)dealloc {
    
}

@end
