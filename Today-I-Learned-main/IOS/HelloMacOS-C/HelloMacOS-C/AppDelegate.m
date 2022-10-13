//
//  AppDelegate.m
//  HelloMacOS-C
//
//  Created by JeongMin Ko on 2022/10/13.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@property (strong) IBOutlet NSWindow *window;
- (IBAction)pressButton:(id)sender;

@property (weak) IBOutlet NSTextField *resultText;

@end


@implementation AppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
    // Insert code here to initialize your application
}


- (void)applicationWillTerminate:(NSNotification *)aNotification {
    // Insert code here to tear down your application
}


- (BOOL)applicationSupportsSecureRestorableState:(NSApplication *)app {
    return YES;
}


- (IBAction)pressButton:(id)sender {
    NSLog(@"Hello World");
    NSString *string = @"Hello World";
    self.resultText.intValue = string;
    
    // NSSpeechSynthesizer 음성합성기를 이용해서 Hello World를 읽어보자!
       NSSpeechSynthesizer *synthesizer = [[NSSpeechSynthesizer alloc] init];
       [synthesizer startSpeakingString:string];
}
@end
