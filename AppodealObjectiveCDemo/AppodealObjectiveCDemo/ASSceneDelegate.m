//
//  ASSceneDelegate.m
//  AppodealObjectiveCDemo
//
//  SceneDelegate for supporting scene-based lifecycle
//

#import "ASSceneDelegate.h"

@interface ASSceneDelegate ()

@end

@implementation ASSceneDelegate

- (void)scene:(UIScene *)scene willConnectToSession:(UISceneSession *)session options:(UISceneConnectionOptions *)connectionOptions {
    if (![scene isKindOfClass:[UIWindowScene class]]) {
        return;
    }
    
    UIWindowScene *windowScene = (UIWindowScene *)scene;
    
    self.window = [[UIWindow alloc] initWithWindowScene:windowScene];
    
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"ObjC" bundle:nil];
    UIViewController *rootViewController = [storyboard instantiateInitialViewController];
    
    self.window.rootViewController = rootViewController;
    [self.window makeKeyAndVisible];
}

- (void)sceneDidDisconnect:(UIScene *)scene {
}

- (void)sceneDidBecomeActive:(UIScene *)scene {
}

- (void)sceneWillResignActive:(UIScene *)scene {
}

- (void)sceneWillEnterForeground:(UIScene *)scene {
}

- (void)sceneDidEnterBackground:(UIScene *)scene {
}

@end