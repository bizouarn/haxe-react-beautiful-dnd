package react_beautiful_dnd;

typedef DraggingStyle = {
	var position : String;
	var top : Float;
	var left : Float;
	var boxSizing : String;
	var width : Float;
	var height : Float;
	var transition : String;
	/**
		This value will actually be `null` instead of `undefined`.
		
		The type is fudged because `null` is not compatible with the
		`React.CSSProperties` type.
		
		The `style` prop should interpret `null` and `undefined` the same way.
	**/
	var transform : Null<String>;
	var zIndex : Float;
	/**
		This value will actually be `null` instead of `undefined`.
		
		The type is fudged because `null` is not compatible with the
		`React.CSSProperties` type.
		
		The `style` prop should interpret `null` and `undefined` the same way.
	**/
	var opacity : Null<Float>;
	var pointerEvents : String;
};