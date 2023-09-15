package react_beautiful_dnd;

typedef NotDraggingStyle = {
	/**
		This value will actually be `null` instead of `undefined`.
		
		The type is fudged because `null` is not compatible with the
		`React.CSSProperties` type.
		
		The `style` prop should interpret `null` and `undefined` the same way.
	**/
	var transform : Null<String>;
	/**
		This value will actually be `null` instead of `undefined`.
		
		The type is fudged because `null` is not compatible with the
		`React.CSSProperties` type.
		
		The `style` prop should interpret `null` and `undefined` the same way.
	**/
	var transition : Null<String>;
};