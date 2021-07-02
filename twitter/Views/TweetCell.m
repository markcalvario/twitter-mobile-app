//
//  TweetCell.m
//  twitter
//
//  Created by mac2492 on 6/28/21.
//  Copyright © 2021 Emerson Malca. All rights reserved.
//

#import "TweetCell.h"
#import "APIManager.h"


@implementation TweetCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
- (IBAction)didTapFavorite:(id)sender {
    // TODO: Update the local tweet model
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

-(void) updateView:(NSString *)typeOfAction{
        NSString *favoriteCount = [@(self.tweet.favoriteCount) stringValue];
        NSString *retweetCount = [@(self.tweet.retweetCount) stringValue];
        self.numOfLikes.text = favoriteCount;
        self.numOfRetweets.text = retweetCount;
        
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

@end
