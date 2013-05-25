# Pawn

Super simple unit testing for iOS.  It just works.

*Version 0.1 Build 1*


## Installation

Pawn is (currently) a wrapper layer over Cedar and Expecta.  All three need to be added to your project:

    $ git submodule add git@github.com:doubledrooks/Pawn.git Externals/Pawn
    $ git submodule add git@github.com:pivotal/cedar.git Externals/Cedar
    $ git submodule add git@github.com:petejkim/expecta.git Externals/Expecta
    $ git submodule update --init --recursive
    $ (cd Externals/Cedar; rake install)
    $ (cd Externals/Pawn; rake install:xcode)
    <Restart Xcode>

Next, make each a subproject by dragging the .xcodeproj from the Finder in the Externals group in Xcode.

You've now got everything you need to use Pawn.  This is a good place for a commit.


## Creating a Spec Bundle

Create a new Target (e.g. File > New > Target).  Choose the Pawn iOS Unit Testing Bundle template under iOS > Pawn.
The new target needs a name.  If your app is named FantasticoApp, then FantasticoAppSpecs is a good choice. You also
need to specify the Test Target.  Keeping with our theme, that would be FantasticoApp.  Once created, there are a few
more steps to get it all running.

1. Move ExampleSpec.m into Specs  (Optional, but in good taste.)
1. Move target files into Target Support  (Optional, but in good taste.)
1. Edit your application's scheme, and add the test bundle to the Test scheme
1. Under Build Phases > Target Dependancies for the new target, add Pawn-iOS
1. Under Build Phases > Link Binary With Libraries, remove and re-add the SenTestingKit framework
1. Under Build Phases > Link Binary With Libraries, add libExpecta-iOS.a
1. Copy Cedar-iOS.framwork from Externals/Cedar/build/Release-iphoneuniversal into your target files folder.  It is best
to do this in the Finder.  Back in Xcode, right click on the target files folder, choose Add Files... and select the
Cedar-iOS.framework that you just copied.

That should be all you need.  Cmd-U will run the ExampleSpec included in the test bundle.  Commit.


## Creating a Spec File

To create a new Spec file, use the Pawn Spec template under iOS > Pawn.  Add your tests and run them.  It should just
work.


## Credits

Pawn is a mashup of Cedar and Expecta and good taste.


###### *My main purpose is to make myself commendable by a novelty of which no one was aware or perhaps was capable; this is to play the pawns well; they are the soul of chess: it is they which uniquely determine the attack and the defence, and on their good or bad arrangement depends entirely the winning or losing of the game. --François-André Philidor*
