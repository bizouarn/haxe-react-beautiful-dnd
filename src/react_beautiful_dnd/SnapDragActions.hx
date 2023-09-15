package react_beautiful_dnd;

typedef SnapDragActions = {
	dynamic function moveUp():Void;
	dynamic function moveDown():Void;
	dynamic function moveRight():Void;
	dynamic function moveLeft():Void;
	dynamic function drop(?args:StopDragOptions):Void;
	dynamic function cancel(?args:StopDragOptions):Void;
	dynamic function isActive():Bool;
	dynamic function shouldRespectForcePress():Bool;
};