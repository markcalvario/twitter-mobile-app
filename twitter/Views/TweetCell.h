//
//  TweetCell.h
//  twitter
//
//  Created by mac2492 on 6/28/21.
//  Copyright © 2021 Emerson Malca. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Tweet.h"

NS_ASSUME_NONNULL_BEGIN

@interface TweetCell : UITableViewCell
@property (nonatomic, weak) Tweet *tweet;
@property (weak, nonatomic) IBOutlet UIImageView *userProfile;
@property (weak, nonatomic) IBOutlet UILabel *username;
@property (weak, nonatomic) IBOutlet UILabel *userHandle;
@property (weak, nonatomic) IBOutlet UILabel *tweetDate;
@property (weak, nonatomic) IBOutlet UILabel *userTweetBody;
@property (weak, nonatomic) IBOutlet UILabel *numOfReplies;
@property (weak, nonatomic) IBOutlet UILabel *numOfRetweets;
@property (weak, nonatomic) IBOutlet UILabel *numOfLikes;



@end

NS_ASSUME_NONNULL_END
