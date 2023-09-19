package components;

import react.React;
import react.ReactComponent;
import react.ReactMacro.jsx;

import react_beautiful_dnd.Draggable;

private typedef DraggableProps = {
	var children:ReactComponent;
	var draggableId: String;
	var index: Int;
}

class CustomDraggable extends ReactComponentOf<DraggableProps, {}> {
	
	override function render() {
		var getItemStyle = (isDragging:Bool, draggableStyle:Dynamic) -> {
			var style	= {
				"userSelect": "none",
				"padding": "5px",
				"margin": '0 0 5px 0',
				// changer la couleur de fond en cas de glisser-déposer
				"background": (isDragging ? "lightgreen" : "grey")
			};
			var res = Reflect.copy(style);
			for(f in Reflect.fields(draggableStyle)) {
				Reflect.setField(res,f,Reflect.field(draggableStyle,f));
			}
			return res;
		};

		var renderItem = function (provided, snapshot) {
			return jsx(
				<div
					ref={provided.innerRef}
					{...provided.draggableProps}
					{...provided.dragHandleProps}
					style={getItemStyle(snapshot.isDragging, provided.draggableProps.style)}
				>
					{props.children}
				</div>
			);
		}

		return jsx(
			<Draggable key={props.draggableId} draggableId={props.draggableId} index={props.index}>
				{(provided, snapshot) -> renderItem(provided, snapshot)}
			</Draggable>
		);
	}
}