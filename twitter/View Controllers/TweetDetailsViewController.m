//
//  TweetDetailsViewController.m
//  twitter
//
//  Created by mac2492 on 6/30/21.
//  Copyright © 2021 Emerson Malca. All rights reserved.
//

#import "TweetDetailsViewController.h"
#import "UIImageView+AFNetworking.h"
#import "Tweet.h"
#import "APIManager.h"

@interface TweetDetailsViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *userProfilePicture;
@property (weak, nonatomic) IBOutlet UILabel *name;
@property (weak, nonatomic) IBOutlet UILabel *userHandle;
@property (weak, nonatomic) IBOutlet UILabel *tweetBody;
@property (weak, nonatomic) IBOutlet UILabel *tweetDate;
@property (weak, nonatomic) IBOutlet UILabel *retweets;
@property (weak, nonatomic) IBOutlet UILabel *quoteRetweetsLabel;
@property (weak, nonatomic) IBOutlet UILabel *favoritesLabel;

//Buttons
@property (weak, nonatomic) IBOutlet UIButton *retweetButton;
@property (weak, nonatomic) IBOutlet UIButton *favoriteButton;

@end

@implementation TweetDetailsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    //converts int to NSString
    NSString *favoriteCount = [@(self.tweet.favoriteCount) stringValue];
    NSString *retweetCount = [@(self.tweet.retweetCount) stringValue];
    
    //
    NSString *profileURLString = self.tweet.user.profilePicture;
    profileURLString = [profileURLString stringByReplacingOccurrencesOfString:@"_normal" withString:@""];
    NSURL *url = [NSURL URLWithString: profileURLString];
    
    
    self.name.text = self.tweet.user.name;
    self.userHandle.text = self.tweet.user.screenName;
    self.tweetBody.text = self.tweet.text;
    self.tweetDate.text = self.tweet.createdAtString;
    self.userProfilePicture.image = nil;
    [self.userProfilePicture setImageWithURL:url];
    self.userProfilePicture.layer.cornerRadius = self.userProfilePicture.frame.size.width /2;
    
    if (self.tweet.retweeted){
        [self.retweetButton setImage:[UIImage imageNamed:@"retweet-icon-green.png"] forState:UIControlStateNormal];
    }
    else{
        [self.retweetButton setImage:[UIImage imageNamed:@"retweet-icon.png"] forState:UIControlStateNormal];
    }
    if (self.tweet.favorited
        ){
        [self.favoriteButton setImage:[UIImage imageNamed:@"favor-icon-red.png"] forState:UIControlStateNormal];
    }
    else{
        [self.favoriteButton setImage:[UIImage imageNamed:@"favor-icon.png"] forState:UIControlStateNormal];
    }
    
    
    self.retweets.text = [retweetCount stringByAppendingString: @" Retweets" ];
    self.favoritesLabel.text = [favoriteCount stringByAppendingString: @" Likes" ];
    
    
}
- (IBAction)didTapRetweet:(id)sender {
    if (self.tweet.retweeted == NO){
        self.tweet.retweeted = YES;
        self.tweet.retweetCount += 1;
        [[APIManager shared] retweet:self.tweet completion:^(Tweet *tweet, NSError *error) {
             if(error){
                  NSLog(@"Error favoriting tweet: %@", error.localizedDescription);
                 
             }
             else{
                 NSLog(@"Successfully favorited the following Tweet: %@", tweet.text);
                 [self updateView:@"retweeted"];
             }
         }];
    }
    else{
        self.tweet.retweeted = NO;
        self.tweet.retweetCount -= 1;
        [[APIManager shared] undoRetweet:self.tweet completion:^(Tweet *tweet, NSError *error) {
             if(error){
                  NSLog(@"Error undo favoriting tweet: %@", error.localizedDescription);
                 
             }
             else{
                 NSLog(@"Successfully favorited the following Tweet: %@", tweet.text);
                 [self updateView:@"unRetweeted"];
             }
         }];
    }
}
- (IBAction)didTapFavorite:(id)sender {
    if (self.tweet.favorited == NO){
        self.tweet.favorited = YES;
        self.tweet.favoriteCount += 1;
        [[APIManager shared] favorite:self.tweet completion:^(Tweet *tweet, NSError *error) {
             if(error){
                  NSLog(@"Error favoriting tweet: %@", error.localizedDescription);
             }
             else{
                 NSLog(@"Successfully favorited the following Tweet: %@", tweet.text);
                 [self updateView:@"favored"];
             }
         }];
    }
    else{
        self.tweet.favorited = NO;
        self.tweet.favoriteCount -= 1;
        [[APIManager shared] undoFavorite:self.tweet completion:^(Tweet *tweet, NSError *error) {
             if(error){
                  NSLog(@"Error unfavoriting tweet: %@", error.localizedDescription);
                 
             }
             else{
                 NSLog(@"Successfully unfavorited the following Tweet: %@", tweet.text);
                 [self updateView:@"unFavored"];
             }
         }];
    }
}
-(void) updateView:(NSString *)typeOfAction{
        NSString *favoriteCount = [@(self.tweet.favoriteCount) stringValue];
        NSString *retweetCount = [@(self.tweet.retweetCount) stringValue];
        self.retweets.text = [retweetCount stringByAppendingString: @" Retweets" ];
        self.favoritesLabel.text = [favoriteCount stringByAppendingString: @" Likes" ];
    
    
        if ([typeOfAction isEqualToString:@"retweeted"]){
            [self.retweetButton setImage:[UIImage imageNamed:@"retweet-icon-green.png"] forState:UIControlStateNormal];
        }
        else if ([typeOfAction isEqualToString:@"unRetweeted"]){
            [self.retweetButton setImage:[UIImage imageNamed:@"retweet-icon.png"] forState:UIControlStateNormal];
        }
        else if ([typeOfAction isEqualToString:@"favored"]){
            [self.favoriteButton setImage:[UIImage imageNamed:@"favor-icon-red.png"] forState:UIControlStateNormal];
        }
        else if ([typeOfAction isEqualToString:@"unFavored"]){
            [self.favoriteButton setImage:[UIImage imageNamed:@"favor-icon.png"] forState:UIControlStateNormal];
        }
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
