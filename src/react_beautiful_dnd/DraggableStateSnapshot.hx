package react_beautiful_dnd;

typedef DraggableStateSnapshot = {
	var isDragging : Bool;
	var isDropAnimating : Bool;
	var isClone : Bool;
	var dropAnimation : Null<DropAnimation>;
	var draggingOver : Null<String>;
	var combineWith : Null<String>;
	var combineTargetFor : Null<String>;
	var mode : Null<MovementMode>;
};