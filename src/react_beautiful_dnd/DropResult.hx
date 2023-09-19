package react_beautiful_dnd;

typedef DropResult = {
	var reason : DropReason;
	var destination :Null<DraggableLocation>;
	var combine : Null<Combine>;
	var mode : MovementMode;
	var draggableId : String;
	var type : String;
	var source : DraggableLocation;
};