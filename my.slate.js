// Configs
S.cfga({
  "defaultToCurrentScreen" : true,
  "secondsBetweenRepeat" : 0.1,
  "checkDefaultsOnLoad" : true,
  "focusCheckWidthMax" : 3000,
  "orderScreensLeftToRight" : true
});

// Monitors

// var lapMain    = 0; //
var monLeft    = 0;
var monRight   = 1; 

// Operations
var scnNext = S.op("throw", {
  "screen" : "next" 
});
var scnPrev = S.op("throw", {
  "screen" : "previous" 
});

var winFull  = S.op("move", {
  "x" : "screenOriginX",
  "y" : "screenOriginY",
  "width"  : "screenSizeX",
  "height" : "screenSizeY"
});

// 23 is magic offset as workaround of slate's bug
var winTopHalf = winFull.dup({ "height" : "screenSizeY/2" });
var winBotHalf = winTopHalf.dup({ "y" : "screenSizeY/2+23" });
var winTopTri  = winFull.dup({ "height" : "screenSizeY/3" });

var winBotTri  = winTopTri.dup({ "y" : "screenSizeY*2/3+23" });
var winBotLeftTri  = winBotTri.dup({ "width" : "screenSizeX/2" });
var winBotRightTri  = winBotLeftTri.dup({ "x" : "screenSizeX/2" });

var winMidTri  = winTopTri.dup({ "y" : "screenSizeY/3+23" });
var winLeftMidTri = winMidTri.dup({ "screen" : 0 });
var winRightMidTri = winMidTri.dup({ "screen" : 1 });

// common layout hashes
/*
var lapMainHash = {
  "operations" : [lapMain],
  "ignore-fail" : true,
  "repeat" : true
};
var lapFullHash = {
  "operations" : [lapFull],
  "ignore-fail" : true,
  "repeat" : true
};
var adiumHash = {
  "operations" : [lapChat, lapMain],
  "ignore-fail" : true,
  "title-order" : ["Contacts"],
  "repeat-last" : true
};
var tboltBigHash = {
  "operations" : [tboltBig],
  "sort-title" : true,
  "repeat" : true
};
var tboltFullHash = {
  "operations" : [tboltFull],
  "sort-title" : true,
  "repeat" : true
};
var genBrowserHash = function(regex) {
  return {
    "operations" : [function(windowObject) {
      var title = windowObject.title();
      if (title !== undefined && title.match(regex)) {
        windowObject.doOperation(tboltLeftBot);
      } else {
        windowObject.doOperation(lapFull);
      }
    }],
    "ignore-fail" : true,
    "repeat" : true
  };
}
// 2 monitor layout
var twoMonitorLayout = S.lay("twoMonitor", {
  "Adium" : {
    "operations" : [lapChat, lapMain],
    "ignore-fail" : true,
    "title-order" : ["Contacts"],
    "repeat-last" : true
  },
  "iTerm" : tboltFullHash,
  "Xcode" : tboltBigHash,
  "Google Chrome" : genBrowserHash(/^Developer\sTools\s-\s.+$/),
  "GitX" : {
    "operations" : [lapFull],
    "repeat" : true
  },
  "Firefox" : genBrowserHash(/^Firebug\s-\s.+$/),
  "Safari" : lapFullHash,
  "Spotify" : {
    "operations" : [lapFull],
    "repeat" : true
  },
  "TextEdit" : {
    "operations" : [lapFull],
    "repeat" : true
  }
});

// 1 monitor layout
var oneMonitorLayout = S.lay("oneMonitor", {
  "Adium" : adiumHash,
  "MacVim" : lapFullHash,
  "iTerm" : lapFullHash,
  "Google Chrome" : lapFullHash,
  "Xcode" : lapFullHash,
  "Flex Builder" : lapFullHash,
  "GitX" : lapFullHash,
  "Ooyala Player Debug Console" : lapFullHash,
  "Firefox" : lapFullHash,
  "Safari" : lapFullHash,
  "Eclipse" : lapFullHash,
  "Spotify" : lapFullHash
});

*/
// Defaults
// S.def(2, twoMonitorLayout);
// S.def(1, oneMonitorLayout);

// Layout Operations
/*
var twoMonitor = S.op("layout", { "name" : twoMonitorLayout });
var oneMonitor = S.op("layout", { "name" : oneMonitorLayout });
var universalLayout = function() {
  // Should probably make sure the resolutions match but w/e
  S.log("SCREEN COUNT: "+S.screenCount());
  if (S.screenCount() === 2) {
    twoMonitor.run();
  } else if (S.screenCount() === 1) {
    oneMonitor.run();
  }
};
*/
//
// Batch bind everything. Less typing.
S.bnda({
  // Layout Bindings
  // "padEnter:ctrl" : universalLayout,

  // Basic Location Bindings
  "up:ctrl;alt;cmd"   : winTopTri,
  "down:ctrl;alt;cmd" : winBotTri,

  "left:ctrl;alt;cmd" : winLeftMidTri,
  "right:ctrl;alt;cmd" : winRightMidTri,

  "up:shift;ctrl;cmd"   : winTopHalf,
  "down:shift;ctrl;cmd" : winBotHalf,

  "left:alt;cmd"      : scnPrev,
  "right:alt;cmd"     : scnNext,

  // Resize Bindings
  // NOTE: some of these may *not* work if you have not removed the expose/spaces/mission control bindings

  // Push Bindings
  // NOTE: some of these may *not* work if you have not removed the expose/spaces/mission control bindings
  // "right:ctrl;shift" : S.op("push", { "direction" : "right", "style" : "bar-resize:screenSizeX/2" }),
  // "left:ctrl;shift" : S.op("push", { "direction" : "left", "style" : "bar-resize:screenSizeX/2" }),
  // "up:ctrl;shift" : S.op("push", { "direction" : "up", "style" : "bar-resize:screenSizeY/2" }),
  // "down:ctrl;shift" : S.op("push", { "direction" : "down", "style" : "bar-resize:screenSizeY/2" }),

  // Nudge Bindings
  // NOTE: some of these may *not* work if you have not removed the expose/spaces/mission control bindings
  // "right:ctrl;alt" : S.op("nudge", { "x" : "+10%", "y" : "+0" }),
  // "left:ctrl;alt" : S.op("nudge", { "x" : "-10%", "y" : "+0" }),
  // "up:ctrl;alt" : S.op("nudge", { "x" : "+0", "y" : "-10%" }),
  // "down:ctrl;alt" : S.op("nudge", { "x" : "+0", "y" : "+10%" }),

  // Throw Bindings
  // NOTE: some of these may *not* work if you have not removed the expose/spaces/mission control bindings
  // "pad1:ctrl;alt" : S.op("throw", { "screen" : "2", "width" : "screenSizeX", "height" : "screenSizeY" }),
  // "pad2:ctrl;alt" : S.op("throw", { "screen" : "1", "width" : "screenSizeX", "height" : "screenSizeY" }),
  // "pad3:ctrl;alt" : S.op("throw", { "screen" : "0", "width" : "screenSizeX", "height" : "screenSizeY" }),
  // "right:ctrl;alt;cmd" : S.op("throw", { "screen" : "right", "width" : "screenSizeX", "height" : "screenSizeY", "screen" : 1 }),
  // "left:ctrl;alt;cmd" : S.op("throw", { "screen" : "left", "width" : "screenSizeX", "height" : "screenSizeY", "screen" : 0 }),
  // "up:ctrl;alt;cmd" : S.op("throw", { "screen" : "up", "width" : "screenSizeX", "height" : "screenSizeY" }),
  // "down:ctrl;alt;cmd" : S.op("throw", { "screen" : "down", "width" : "screenSizeX", "height" : "screenSizeY" }),

  // Focus Bindings
  // NOTE: some of these may *not* work if you have not removed the expose/spaces/mission control bindings
  // "l:cmd" : S.op("focus", { "direction" : "right" }),
  // "h:cmd" : S.op("focus", { "direction" : "left" }),
  // "k:cmd" : S.op("focus", { "direction" : "up" }),
  // "j:cmd" : S.op("focus", { "direction" : "down" }),
  // "k:cmd;alt" : S.op("focus", { "direction" : "behind" }),
  // "j:cmd;alt" : S.op("focus", { "direction" : "behind" }),
  // "right:alt" : S.op("focus", { "direction" : "right" }),
  // "left:alt" : S.op("focus", { "direction" : "left" }),
  // "up:alt" : S.op("focus", { "direction" : "up" }),
  // "down:alt" : S.op("focus", { "direction" : "down" }),
  // "up:alt;cmd" : S.op("focus", { "direction" : "behind" }),
  // "down:alt;cmd" : S.op("focus", { "direction" : "behind" }),

  // Window Hints
  //"tab:cmd" : S.op("hint"),

  // Switch currently doesn't work well so I'm commenting it out until I fix it.
  // "tab:cmd" : S.op("switch"),

  // Grid
  // "esc:ctrl" : S.op("grid")
});

// Test Cases
//S.src(".slate.test", true);
//S.src(".slate.test.js", true);
