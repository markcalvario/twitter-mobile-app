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
#import "ComposeViewController.h"
#import <DateTools.h>

@interface TimelineViewController () <ComposeViewControllerDelegate, UITableViewDataSource, UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UIButton *logoutButton;
@property (nonatomic, strong) NSMutableArray *arrayOfTweets;
@property (weak, nonatomic) IBOutlet UITableView *tweetsTableView;

@property (nonatomic, strong) UIRefreshControl *refreshControl;


@end

@implementation TimelineViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tweetsTableView.delegate = self;
    self.tweetsTableView.dataSource = self;
    [self getTweets];
    
    
    self.refreshControl = [[UIRefreshControl alloc] init];
    [self.refreshControl addTarget:self action:@selector(getTweets) forControlEvents: UIControlEventValueChanged];
        [self.tweetsTableView insertSubview:self.refreshControl atIndex:0];
    
}

-(void) getTweets{
    // Get timeline
    [[APIManager shared] getHomeTimelineWithCompletion:^(NSMutableArray *tweets, NSError *error) {
        if (tweets) {
            NSLog(@"😎😎😎 Successfully loaded home timeline");
            self.arrayOfTweets = tweets;
            [self.tweetsTableView reloadData];
        } else {
            NSLog(@"😫😫😫 Error getting home timeline: %@", error.localizedDescription);
        }
        
    }];
    [self.refreshControl endRefreshing];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void) didTweet:(Tweet *)tweet{
    [self.arrayOfTweets addObject:tweet];
    [self getTweets];
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
    
    
    cell.tweet = currentTweet;
    cell.username.text = name;
    cell.userHandle.text = screenName;
    cell.userProfile.image = nil;
    [cell.userProfile setImageWithURL:url];
    cell.userTweetBody.text = currentTweet.text;
    cell.numOfLikes.text = favoriteCount;
    cell.tweetDate.text = currentTweet.createdAtString;
    cell.numOfRetweets.text = retweetCount;
    
    
    cell.userProfile.layer.cornerRadius = cell.userProfile.frame.size.width /2;
    
    return cell;
}
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    UINavigationController *navigationController = [segue destinationViewController];
    ComposeViewController *composeController = (ComposeViewController*)navigationController.topViewController;
    composeController.delegate = self;
}


@end
