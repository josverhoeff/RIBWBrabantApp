//
//  NieuwslijstTableViewCell.m
//  RIBWBrabantApp
//
//  Created by Jos Verhoeff on 12-02-15.
//  Copyright (c) 2015 CERIUM. All rights reserved.
//

#import "NieuwslijstTableViewCell.h"

@interface NieuwslijstTableViewCell ()
@property (weak, nonatomic) IBOutlet UIImageView *unreadDotImageView;
@property (weak, nonatomic) IBOutlet UIImageView *thumbnailImageView;
@property (weak, nonatomic) IBOutlet UILabel *newsTitleLabel;
@property (weak, nonatomic) IBOutlet UILabel *newsSubtitleLabel;
@end

@implementation NieuwslijstTableViewCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)awakeFromNib
{
    // Initialization code
    BOOL b = true;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];
    
    // Configure the view for the selected state
}


#pragma mark - Setting the news item

- (void)setUnread:(BOOL)unread
{
    self.unreadDotImageView.hidden = (!unread);
}

- (void)setThumbnail:(UIImage *)thumbnail
{
    self.thumbnailImageView.image = (thumbnail)?:[UIImage imageNamed:@"newsitem_placeholder"];
}

- (void)setTitle:(NSString *)title
{
    self.newsTitleLabel.text = title;
}

- (void)setSubtitle:(NSString *)subtitle
{
    self.newsSubtitleLabel.text = subtitle;
}




@end
