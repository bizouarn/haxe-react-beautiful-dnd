package react_beautiful_dnd;

typedef CompletedDrag = {
	var critical : Critical;
	var result : DropResult;
	var impact : DragImpact;
	var afterCritical : LiftEffect;
};