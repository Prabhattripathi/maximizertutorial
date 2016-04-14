//
//  Created by azu on 12/10/02.
//


#import <QuartzCore/QuartzCore.h>
#import "ScrollViewToPDF.h"


@implementation ScrollViewToPDF
{

}

// based http://coderchrismills.wordpress.com/2011/06/25/making-a-pdf-from-a-uiwebview/
#define kDefaultPageHeight 792
#define kDefaultPageWidth  612
#define kMargin 50
+ (NSData *)pdfDataOfScrollView:(UIScrollView *)scrollView {
    CGRect origFrame = scrollView.frame;
    BOOL horizontalScrollIndicator = [scrollView showsHorizontalScrollIndicator];
    BOOL verticalScrollIndicator = [scrollView showsVerticalScrollIndicator];
    NSMutableData *pdfFile = [[NSMutableData alloc] init];
    CGDataConsumerRef pdfConsumer = CGDataConsumerCreateWithCFData((__bridge CFMutableDataRef) pdfFile);
    CGRect mediaBox = CGRectZero;
    CGFloat maxHeight = kDefaultPageHeight - 2 * kMargin;
    CGFloat maxWidth = kDefaultPageWidth - 2 * kMargin;
    CGFloat height = scrollView.contentSize.height;
    // Set up we the pdf we're going to be generating is
    [scrollView setFrame:CGRectMake(0.f, 0.f, maxWidth, maxHeight)];
    NSInteger pages = (NSInteger) ceil(height / maxHeight);

    NSMutableData *pdfData = [NSMutableData data];
    // スクリーンショットを撮る準備
    [self prepareForCapture:scrollView];
    UIGraphicsBeginPDFContextToData(pdfData, CGRectZero, nil);
    for (int i = 0 ;i < pages ;i++){
        if (maxHeight * (i + 1) > height){
            // Check to see if page draws more than the height of the UIWebView
            CGRect scrollViewFrame = [scrollView frame];
            scrollViewFrame.size.height -= (((i + 1) * maxHeight) - height);
            [scrollView setFrame:scrollViewFrame];
        }
        // Specify the size of the pdf page
        UIGraphicsBeginPDFPageWithInfo(CGRectMake(0, 0, kDefaultPageWidth, kDefaultPageHeight), nil);
        CGContextRef currentContext = UIGraphicsGetCurrentContext();
        // ページ数を打って
        [self drawPageNumber:(i + 1)];
        // Move the context for the margins
        // マージン
        CGContextTranslateCTM(currentContext, kMargin, -(maxHeight * i) + kMargin);
        // 中身をスクロールさせて描画する領域を変える
        [scrollView setContentOffset:CGPointMake(0, maxHeight * i) animated:NO];
        // draw the layer to the pdf, ignore the "renderInContext not found" warning.
        [scrollView.layer renderInContext:currentContext];
    }
    // all done with making the pdf
    UIGraphicsEndPDFContext();
    [scrollView setFrame:origFrame];
    [scrollView setContentOffset:CGPointMake(0, 0) animated:NO];
    [scrollView setShowsHorizontalScrollIndicator:horizontalScrollIndicator];
    [scrollView setShowsVerticalScrollIndicator:verticalScrollIndicator];
    return pdfData;
}

// ページ番号を描画
+ (void)drawPageNumber:(NSInteger)pageNum {
    NSString *pageString = [NSString stringWithFormat:@"Page %d", pageNum];
    UIFont *theFont = [UIFont systemFontOfSize:12];
    CGSize maxSize = CGSizeMake(612, 72);
    CGSize pageStringSize = [pageString sizeWithFont:theFont
        constrainedToSize:maxSize
        lineBreakMode:UILineBreakModeClip];
    CGRect stringRect = CGRectMake(((612.0 - pageStringSize.width) / 2.0),
        720.0 + ((72.0 - pageStringSize.height) / 2.0),
        pageStringSize.width,
        pageStringSize.height);

    [pageString drawInRect:stringRect withFont:theFont];
}

+ (void)prepareForCapture:(UIScrollView *)scrollView {
    /* スクリーンショット用の準備 */
    [scrollView setContentOffset:CGPointZero animated:NO];
    // インジケータを非表示にする
    [scrollView setShowsHorizontalScrollIndicator:NO];
    [scrollView setShowsVerticalScrollIndicator:NO];
}
@end