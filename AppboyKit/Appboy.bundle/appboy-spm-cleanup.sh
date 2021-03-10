#! /bin/sh

# AppboyKitLibrary
find "$BUILT_PRODUCTS_DIR/$FULL_PRODUCT_NAME" -name libAppboyKitLibrary.a -follow -exec rm {} \;

# AppboyPushStory
find "$BUILT_PRODUCTS_DIR/$FULL_PRODUCT_NAME" -name "AppboyPushStory.framework" -follow -exec rm -r {} \;

