# Project 3 - *Mock Twitter*

**Mock Twitter** is a basic twitter app to read and compose tweets the [Twitter API](https://apps.twitter.com/).

Time spent: **25** hours spent in total

## User Stories

The following **required** functionality is completed:

- [X] User sees app icon in home screen and styled launch screen
- [X] User can sign in using OAuth login flow
- [X] User can Logout
- [X] User can view last 20 tweets from their home timeline
- [X] In the home timeline, user can view tweet with the user profile picture, username, tweet text, and timestamp.
- [X] User can pull to refresh.
- [X] User can tap the retweet and favorite buttons in a tweet cell to retweet and/or favorite a tweet.
- [X] User can compose a new tweet by tapping on a compose button.
- [X] Using AutoLayout, the Tweet cell should adjust its layout for iPhone 11, Pro and SE device sizes as well as accommodate device rotation.
- [X] User should display the relative timestamp for each tweet "8m", "7h"
- [X] Tweet Details Page: User can tap on a tweet to view it, with controls to retweet and favorite.

The following **optional** features are implemented:

- [ ] User can view their profile in a *profile tab*
  - Contains the user header view: picture and tagline
  - Contains a section with the users basic stats: # tweets, # following, # followers
  - [ ] Profile view should include that user's timeline
- [X] User should be able to unretweet and unfavorite and should decrement the retweet and favorite count. Refer to [[this guide|unretweeting]] for help on implementing unretweeting.
- [ ] Links in tweets are clickable.
- [ ] User can tap the profile image in any tweet to see another user's profile
  - Contains the user header view: picture and tagline
  - Contains a section with the users basic stats: # tweets, # following, # followers
- [ ] User can load more tweets once they reach the bottom of the feed using infinite loading similar to the actual Twitter client.
- [ ] When composing, you should have a countdown for the number of characters remaining for the tweet (out of 280) (**1 point**)
- [X] After creating a new tweet, a user should be able to view it in the timeline immediately without refetching the timeline from the network.
- [ ] User can reply to any tweet, and replies should be prefixed with the username and the reply_id should be set when posting the tweet (**2 points**)
- [ ] User sees embedded images in tweet if available
- [ ] User can switch between timeline, mentions, or profile view through a tab bar (**3 points**)
- [ ] Profile Page: pulling down the profile page should blur and resize the header image. (**4 points**)


The following **additional** features are implemented:

- [ ] List anything else that you can get done to improve the app functionality!

Please list two areas of the assignment you'd like to **discuss further with your peers** during the next class (examples include better ways to implement something, how to extend your app in certain ways, etc):

1.
2.

## Video Walkthrough

Here's a walkthrough of implemented user stories:

<img src='https://user-images.githubusercontent.com/58496944/124212576-106cf580-daa4-11eb-8843-0bb71ad2d26e.gif' title='Video Walkthrough' width='500' alt='Video Walkthrough' />
<img src='https://user-images.githubusercontent.com/58496944/124212807-72c5f600-daa4-11eb-94c0-00f159614f2f.gif' title='Video Walkthrough' width='500' alt='Video Walkthrough'/>
<img src='https://user-images.githubusercontent.com/58496944/124213135-ebc54d80-daa4-11eb-8347-7c9b7ccb42f8.gif' title='Video Walkthrough' width='500' alt='Video Walkthrough'/>
<img src='https://user-images.githubusercontent.com/58496944/124213534-98073400-daa5-11eb-96dd-65b3c5bf0838.gif' title='Video Walkthrough' width='500' alt='Video Walkthrough'/>
<img src='https://user-images.githubusercontent.com/58496944/124213760-faf8cb00-daa5-11eb-91c5-d1ab989da8db.gif' title='Video Walkthrough' width='500' alt='Video Walkthrough'/>
<img src='https://user-images.githubusercontent.com/58496944/124214127-9b4eef80-daa6-11eb-8e1d-7c7db60e0018.gif' title='Video Walkthrough' width='500' alt='Video Walkthrough'/>
<img src='https://user-images.githubusercontent.com/58496944/124214476-1d3f1880-daa7-11eb-9cc8-aadb06b970a3.gif' title='Video Walkthrough' width='500' alt='Video Walkthrough'/>




GIF created with [Kap](https://getkap.co/).

## Notes

Describe any challenges encountered while building the app.
 * Autolayout was pretty challenging

## Credits

List an 3rd party libraries, icons, graphics, or other assets you used in your app.

- [AFNetworking](https://github.com/AFNetworking/AFNetworking) - networking task library

## License

    Copyright [yyyy] [name of copyright owner]

    Licensed under the Apache License, Version 2.0 (the "License");
    you may not use this file except in compliance with the License.
    You may obtain a copy of the License at

        http://www.apache.org/licenses/LICENSE-2.0

    Unless required by applicable law or agreed to in writing, software
    distributed under the License is distributed on an "AS IS" BASIS,
    WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
    See the License for the specific language governing permissions and
    limitations under the License.
