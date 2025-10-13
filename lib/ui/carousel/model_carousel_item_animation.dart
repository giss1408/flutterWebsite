class SlideItemAnimationModel {
  final String id;
  final int entryDuration;
  final int exitDuration;
  final int entry;
  final int exit;
  bool visible;
  
  // Cache duration objects to avoid repeated object creation
  Duration? _entryDurationCache;
  Duration? _exitDurationCache;

  SlideItemAnimationModel(
      {required this.id,
      required this.entryDuration,
      required this.exitDuration,
      required this.entry,
      required this.exit,
      this.visible = false});

  // Optimized duration getters with caching
  Duration get entryDurationObj => _entryDurationCache ??= Duration(milliseconds: entryDuration);
  Duration get exitDurationObj => _exitDurationCache ??= Duration(milliseconds: exitDuration);

  @override
  bool operator ==(other) {
    if (identical(this, other)) return true;
    return other is SlideItemAnimationModel && id == other.id;
  }

  @override
  int get hashCode => id.hashCode;
}

// Cache for slide items to avoid repeated lookups
final Map<String, SlideItemAnimationModel> _slideItemCache = {};

Duration getSlideItemAnimationDuration(
    String id, List<SlideItemAnimationModel> items) {
  // Use cached item lookup for better performance
  final item = _slideItemCache[id] ?? items.firstWhere((element) => element.id == id);
  if (_slideItemCache[id] == null) {
    _slideItemCache[id] = item;
  }
  
  return item.visible ? item.entryDurationObj : item.exitDurationObj;
}

bool getSlideItemAnimationVisibility(
    String id, List<SlideItemAnimationModel> items) {
  final item = _slideItemCache[id] ?? items.firstWhere((element) => element.id == id);
  if (_slideItemCache[id] == null) {
    _slideItemCache[id] = item;
  }
  
  return item.visible;
}

List<SlideItemAnimationModel> getSlideItemAnimationUpdate(
    double animationValue, List<SlideItemAnimationModel> items) {
  bool hasChanges = false;
  
  // Process items in place to avoid creating new lists
  for (int i = 0; i < items.length; i++) {
    final item = items[i];
    final shouldBeVisible = animationValue >= item.entry && animationValue < item.exit;
    
    if (item.visible != shouldBeVisible) {
      item.visible = shouldBeVisible;
      hasChanges = true;
    }
  }
  
  // Clear cache if there are changes to ensure consistency
  if (hasChanges) {
    _slideItemCache.clear();
  }
  
  return items;
}
