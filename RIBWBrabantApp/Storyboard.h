//
//  Storyboard.h
//
//  Created by Marten Tamerius on 11-06-14.
//  Copyright (c) 2015 Cerium. All rights reserved.
//

#ifndef Storyboard_h
#define Storyboard_h


#pragma mark - Storyboard Segues

// Route List View
#define kSegueRouteListToRouteDetail                    @"RouteListToRouteDetailSegue"

// Route Detail View
#define kSegueRouteDetailToStartRouteAtFirstWaypoint    @"RouteDetailToStartRouteAtFirstWaypointSegue"
#define kSegueRouteDetailToFindNearestWaypoint          @"RouteDetailToFindNearestWaypointSegue"
#define kSegueRouteDetailSpecificWaypointTapped         @"RouteDetailSpecificWaypointTappedSegue"
#define kSegueRouteDetailToMapView                      @"RouteDetailToMapViewSegue"

// Waypoint View
#define kSegueSpecificWaypointMapButtonTapped           @"SpecificWaypointMapButtonTappedSegue"

// Route Map View
#define kSegueRouteMapToStartRouteAtFirstWaypoint       @"RouteMapToStartRouteAtFirstWaypointSegue"
#define kSegueRouteMapToFindNearestWaypoint             @"RouteMapToFindNearestWaypointSegue"
#define kSegueRouteMapSpecificWaypointTapped            @"RouteMapSpecificWaypointTappedSegue"

// Waypoint Map View
#define kSegueSpecificWaypointTappedOnWaypointMap       @"SpecificWaypointTappedOnWaypointMapSegue"

// News TableView
#define kSegueNewsItemListToShowDetail                  @"NewsItemListToShowDetailSegue"
#define kSegueNewsItemListPushNotAnimated               @"NewsItemListPushNotAnimatedSegue"



#pragma mark - TableView Cell Identifiers

// Route List TableView
#define kCellRouteDescription           @"CellRouteDescription"

// News TableView
#define kCellNewsItem                   @"CellNewsItem"


#endif
