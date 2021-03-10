#! /bin/sh

# AppboyKitLibrary
find "$INSTALL_DIR/$EXECUTABLE_FOLDER_PATH" -name libAppboyKitLibrary.a -follow -exec rm {} \;

# AppboyPushStory
find "$INSTALL_DIR/$EXECUTABLE_FOLDER_PATH" -name "AppboyPushStory.framework" -follow -exec rm -r {} \;

