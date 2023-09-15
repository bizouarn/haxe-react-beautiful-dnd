package react_beautiful_dnd;

typedef CollectingState = {
	var phase : String;
	var isDragging : Bool;
	var critical : Critical;
	var movementMode : MovementMode;
	var dimensions : DimensionMap;
	var initial : DragPositions;
	var current : DragPositions;
	var impact : DragImpact;
	var viewport : Viewport;
	var afterCritical : LiftEffect;
	var onLiftImpact : DragImpact;
	var isWindowScrollAllowed : Bool;
	var scrollJumpRequest : Null<Position>;
	var forceShouldAnimate : Null<Bool>;
};