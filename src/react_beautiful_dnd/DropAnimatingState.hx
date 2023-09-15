package react_beautiful_dnd;

typedef DropAnimatingState = {
	var phase : String;
	var completed : CompletedDrag;
	var newHomeClientOffset : Position;
	var dropDuration : Float;
	var dimensions : DimensionMap;
};