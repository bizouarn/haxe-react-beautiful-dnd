package react_beautiful_dnd;

typedef DragStart = {
	var mode : MovementMode;
	var draggableId : String;
	var type : String;
	var source : DraggableLocation;
};