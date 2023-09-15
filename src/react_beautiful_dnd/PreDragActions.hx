package react_beautiful_dnd;

typedef PreDragActions = {
	dynamic function isActive():Bool;
	dynamic function shouldRespectForcePress():Bool;
	dynamic function fluidLift(clientSelection:Position):FluidDragActions;
	dynamic function snapLift():SnapDragActions;
	dynamic function abort():Void;
};