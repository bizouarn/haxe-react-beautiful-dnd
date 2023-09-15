package react_beautiful_dnd;

typedef DroppableDimension = {
	var descriptor : DroppableDescriptor;
	var axis : Axis;
	var isEnabled : Bool;
	var isCombineEnabled : Bool;
	var client : BoxModel;
	var isFixedOnPage : Bool;
	var page : BoxModel;
	var frame : Null<Scrollable>;
	var subject : DroppableSubject;
};