package components;

import react.React;
import react.ReactComponent;
import react.ReactMacro.jsx;

import react_beautiful_dnd.Droppable;

private typedef DroppableProps = {
	var children:ReactComponent;
	var droppableId: String;
}

class CustomDroppable extends ReactComponentOf<DroppableProps, {}> {
	
	override function render() {
		var getListStyle = (isDraggingOver:Bool) -> ({
			background: isDraggingOver ? "lightblue" : "lightgrey",
			padding: "5px",
			paddingBottom: isDraggingOver ? "70px" : "5px",
			width: 250
		});

		var renderItem = function (provided, snapshot) {
			return jsx(
				<div
					ref={provided.innerRef}
					{...provided.draggableProps}
					{...provided.dragHandleProps}
					style={getListStyle(snapshot.isDraggingOver)}
				>
					{props.children}
				</div>
			);
		}

		return jsx(
			<Droppable key={props.droppableId} droppableId={props.droppableId}>
				{(provided, snapshot) -> renderItem(provided, snapshot)}
			</Droppable>
		);
	}
}