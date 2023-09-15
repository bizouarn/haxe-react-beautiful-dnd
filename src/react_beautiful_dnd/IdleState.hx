package react_beautiful_dnd;

typedef IdleState = {
	var phase : String;
	var completed : Null<CompletedDrag>;
	var shouldFlush : Bool;
};