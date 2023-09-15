package react_beautiful_dnd;

/**
	Draggable
**/
typedef DropAnimation = {
	var duration : Float;
	var curve : String;
	var moveTo : Position;
	/**
		This value will actually be `null` instead of `undefined`.
		
		The type is fudged because `null` is not compatible with the
		`React.CSSProperties` type.
		
		The `style` prop should interpret `null` and `undefined` the same way.
	**/
	var opacity : Null<Float>;
	/**
		This value will actually be `null` instead of `undefined`.
		
		The type is fudged because `null` is not compatible with the
		`React.CSSProperties` type.
		
		The `style` prop should interpret `null` and `undefined` the same way.
	**/
	var scale : Null<Float>;
};