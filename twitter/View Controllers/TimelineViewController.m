//
//  TimelineViewController.m
//  twitter
//
//  Created by emersonmalca on 5/28/18.
//  Copyright © 2018 Emerson Malca. All rights reserved.
//

#import "TimelineViewController.h"
#import "AppDelegate.h"
#import "TweetCell.h"
#import "LoginViewController.h"
#import "APIManager.h"
#import "UIImageView+AFNetworking.h"

@interface TimelineViewController ()<UITableViewDelegate, UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UIButton *logoutButton;
@property (nonatomic, strong) NSArray *arrayOfTweets;
@property (weak, nonatomic) IBOutlet UITableView *tweetsTableView;


@end

@implementation TimelineViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tweetsTableView.delegate = self;
    self.tweetsTableView.dataSource = self;
    
    // Get timeline
    [[APIManager shared] getHomeTimelineWithCompletion:^(NSArray *tweets, NSError *error) {
        if (tweets) {
            NSLog(@"😎😎😎 Successfully loaded home timeline");
            self.arrayOfTweets = tweets;
            [self.tweetsTableView reloadData];
        } else {
            NSLog(@"😫😫😫 Error getting home timeline: %@", error.localizedDescription);
        }
        
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


//Connected to Logoout Button; Function logs out user from Twitter
-(IBAction)logOutAction:(id)sender {
    AppDelegate *appDelegate = (AppDelegate *)[UIApplication sharedApplication].delegate;

    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    LoginViewController *loginViewController = [storyboard instantiateViewControllerWithIdentifier:@"LoginViewController"];
    appDelegate.window.rootViewController = loginViewController;
    
    [[APIManager shared] logout];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.arrayOfTweets.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    TweetCell *cell = [tableView dequeueReusableCellWithIdentifier:@"TweetCell"];
    
    Tweet *currentTweet = self.arrayOfTweets[indexPath.row];
    
    //Get User info
    NSString *name = currentTweet.user.name;
    NSString *screenName = currentTweet.user.screenName;
    NSString *profileURLString = currentTweet.user.profilePicture;
    
    
    NSURL *url = [NSURL URLWithString: profileURLString];
    
    
    //converts int to NSString
    NSString *favoriteCount = [@(currentTweet.favoriteCount) stringValue];
    NSString *retweetCount = [@(currentTweet.retweetCount) stringValue];
    
    
    cell.username.text = name;
    cell.userHandle.text = screenName;
    cell.userProfile.image = nil;
    [cell.userProfile setImageWithURL:url];
    cell.userTweetBody.text = currentTweet.text;
    cell.numOfLikes.text = favoriteCount;
    cell.tweetDate.text = currentTweet.createdAtString;
    cell.numOfRetweets.text = retweetCount;
    
    
    
    return cell;
}

@end
