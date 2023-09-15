package react_beautiful_dnd;

typedef FluidDragActions = {
	dynamic function move(clientSelection:Position):Void;
	dynamic function drop(?args:StopDragOptions):Void;
	dynamic function cancel(?args:StopDragOptions):Void;
	dynamic function isActive():Bool;
	dynamic function shouldRespectForcePress():Bool;
};