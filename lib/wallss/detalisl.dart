 
  // Future<void> setWallpaperFromFile() async {
  //   setState(() {
  //     _wallpaperFile = "Setting Wallpaper";
  //   });
  //   String result;
  //   var file = await DefaultCacheManager().getSingleFile(widget.imagePath);
  //   // Platform messages may fail, so we use a try/catch PlatformException.
  //   try {
  //     result = await WallpaperManager.setWallpaperFromFile(
  //         file.path, WallpaperManager.HOME_SCREEN);
  //   } on PlatformException {
  //     result = 'Failed to get wallpaper.';
  //   }
  //   // If the widget was removed from the tree while the asynchronous platform
  //   // message was in flight, we want to discard the reply rather than calling
  //   // setState to update our non-existent appearance.
  //   if (!mounted) return;
  //   setState(() {
  //     _wallpaperFile = result;
  //   });
  // }
 
