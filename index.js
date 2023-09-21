(function ($global) { "use strict";
var $estr = function() { return js_Boot.__string_rec(this,''); },$hxEnums = $hxEnums || {},$_;
function $extend(from, fields) {
	var proto = Object.create(from);
	for (var name in fields) proto[name] = fields[name];
	if( fields.toString !== Object.prototype.toString ) proto.toString = fields.toString;
	return proto;
}
var EReg = function(r,opt) {
	this.r = new RegExp(r,opt.split("u").join(""));
};
EReg.__name__ = true;
EReg.prototype = {
	match: function(s) {
		if(this.r.global) {
			this.r.lastIndex = 0;
		}
		this.r.m = this.r.exec(s);
		this.r.s = s;
		return this.r.m != null;
	}
	,matched: function(n) {
		if(this.r.m != null && n >= 0 && n < this.r.m.length) {
			return this.r.m[n];
		} else {
			throw haxe_Exception.thrown("EReg::matched");
		}
	}
	,matchedPos: function() {
		if(this.r.m == null) {
			throw haxe_Exception.thrown("No string matched");
		}
		return { pos : this.r.m.index, len : this.r.m[0].length};
	}
	,matchSub: function(s,pos,len) {
		if(len == null) {
			len = -1;
		}
		if(this.r.global) {
			this.r.lastIndex = pos;
			this.r.m = this.r.exec(len < 0 ? s : HxOverrides.substr(s,0,pos + len));
			var b = this.r.m != null;
			if(b) {
				this.r.s = s;
			}
			return b;
		} else {
			var b = this.match(len < 0 ? HxOverrides.substr(s,pos,null) : HxOverrides.substr(s,pos,len));
			if(b) {
				this.r.s = s;
				this.r.m.index += pos;
			}
			return b;
		}
	}
	,map: function(s,f) {
		var offset = 0;
		var buf_b = "";
		while(true) {
			if(offset >= s.length) {
				break;
			} else if(!this.matchSub(s,offset)) {
				buf_b += Std.string(HxOverrides.substr(s,offset,null));
				break;
			}
			var p = this.matchedPos();
			buf_b += Std.string(HxOverrides.substr(s,offset,p.pos - offset));
			buf_b += Std.string(f(this));
			if(p.len == 0) {
				buf_b += Std.string(HxOverrides.substr(s,p.pos,1));
				offset = p.pos + 1;
			} else {
				offset = p.pos + p.len;
			}
			if(!this.r.global) {
				break;
			}
		}
		if(!this.r.global && offset > 0 && offset < s.length) {
			buf_b += Std.string(HxOverrides.substr(s,offset,null));
		}
		return buf_b;
	}
};
var HxOverrides = function() { };
HxOverrides.__name__ = true;
HxOverrides.substr = function(s,pos,len) {
	if(len == null) {
		len = s.length;
	} else if(len < 0) {
		if(pos == 0) {
			len = s.length + len;
		} else {
			return "";
		}
	}
	return s.substr(pos,len);
};
HxOverrides.remove = function(a,obj) {
	var i = a.indexOf(obj);
	if(i == -1) {
		return false;
	}
	a.splice(i,1);
	return true;
};
HxOverrides.now = function() {
	return Date.now();
};
var Main = function() { };
Main.__name__ = true;
Main.main = function() {
	ReactDOM.render(React.createElement(components_App,{ id : "droppable"}),window.document.getElementById("root"));
};
Math.__name__ = true;
var Reflect = function() { };
Reflect.__name__ = true;
Reflect.field = function(o,field) {
	try {
		return o[field];
	} catch( _g ) {
		return null;
	}
};
Reflect.fields = function(o) {
	var a = [];
	if(o != null) {
		var hasOwnProperty = Object.prototype.hasOwnProperty;
		for( var f in o ) {
		if(f != "__id__" && f != "hx__closures__" && hasOwnProperty.call(o,f)) {
			a.push(f);
		}
		}
	}
	return a;
};
Reflect.copy = function(o) {
	if(o == null) {
		return null;
	}
	var o2 = { };
	var _g = 0;
	var _g1 = Reflect.fields(o);
	while(_g < _g1.length) {
		var f = _g1[_g];
		++_g;
		o2[f] = Reflect.field(o,f);
	}
	return o2;
};
var Std = function() { };
Std.__name__ = true;
Std.string = function(s) {
	return js_Boot.__string_rec(s,"");
};
var StringTools = function() { };
StringTools.__name__ = true;
StringTools.startsWith = function(s,start) {
	if(s.length >= start.length) {
		return s.lastIndexOf(start,0) == 0;
	} else {
		return false;
	}
};
var React_Component = require("react").Component;
var components_App = function(props) {
	React_Component.call(this,props);
	var source = ["TEST 1","TEST 2","TEST 3","TEST 4","TEST 5","TEST 6"];
	this.state = { source : source};
};
components_App.__name__ = true;
components_App.__super__ = React_Component;
components_App.prototype = $extend(React_Component.prototype,{
	render: function() {
		var _gthis = this;
		var onDragEnd = function(result) {
			if(result.destination == null) {
				return;
			}
			var indexSource = result.source.index | 0;
			var indexDestination = result.destination.index | 0;
			var elem = _gthis.state.source[indexSource];
			HxOverrides.remove(_gthis.state.source,elem);
			_gthis.state.source.splice(indexDestination,0,elem);
			_gthis.setState({ source : _gthis.state.source});
		};
		var renderItem = function(item,source) {
			var index = source.indexOf(item);
			var renderItem = React.createElement("p",{ },item);
			return React.createElement(components_CustomDraggable,{ index : index, draggableId : item},renderItem);
		};
		var tmp = { droppableId : this.props.id};
		var _this = this.state.source;
		var result = new Array(_this.length);
		var _g = 0;
		var _g1 = _this.length;
		while(_g < _g1) {
			var i = _g++;
			result[i] = renderItem(_this[i],_gthis.state.source);
		}
		var tmp1 = React.createElement(components_CustomDroppable,tmp,result);
		return React.createElement(react_$beautiful_$dnd_DragDropContext,{ onDragEnd : onDragEnd},tmp1);
	}
});
var components_CustomDraggable = function(props,context) {
	React_Component.call(this,props,context);
};
components_CustomDraggable.__name__ = true;
components_CustomDraggable.__super__ = React_Component;
components_CustomDraggable.prototype = $extend(React_Component.prototype,{
	render: function() {
		var _gthis = this;
		var getItemStyle = function(isDragging,draggableStyle) {
			var style = { "userSelect" : "none", "padding" : "5px", "margin" : "0 0 5px 0", "background" : isDragging ? "lightgreen" : "grey"};
			var res = Reflect.copy(style);
			var _g = 0;
			var _g1 = Reflect.fields(draggableStyle);
			while(_g < _g1.length) {
				var f = _g1[_g];
				++_g;
				res[f] = Reflect.field(draggableStyle,f);
			}
			return res;
		};
		var renderItem = function(provided,snapshot) {
			var provided1 = provided.dragHandleProps;
			var provided2 = provided.draggableProps;
			var provided3 = provided.innerRef;
			var renderItem = getItemStyle(snapshot.isDragging,provided.draggableProps.style);
			return React.createElement("div",Object.assign({ },provided1,provided2,{ ref : provided3, style : renderItem}),_gthis.props.children);
		};
		return React.createElement(react_$beautiful_$dnd_Draggable,{ key : this.props.draggableId, index : this.props.index, draggableId : this.props.draggableId},function(provided,snapshot) {
			return renderItem(provided,snapshot);
		});
	}
});
var components_CustomDroppable = function(props,context) {
	React_Component.call(this,props,context);
};
components_CustomDroppable.__name__ = true;
components_CustomDroppable.__super__ = React_Component;
components_CustomDroppable.prototype = $extend(React_Component.prototype,{
	render: function() {
		var _gthis = this;
		var getListStyle = function(isDraggingOver) {
			return { background : isDraggingOver ? "lightblue" : "lightgrey", padding : "5px", width : 250};
		};
		var renderItem = function(provided,snapshot) {
			var provided1 = provided.droppableProps;
			var provided2 = provided.innerRef;
			var renderItem = getListStyle(snapshot.isDraggingOver);
			return React.createElement("div",Object.assign({ },provided1,{ ref : provided2, style : renderItem}),_gthis.props.children,provided.placeholder);
		};
		return React.createElement(react_$beautiful_$dnd_Droppable,{ key : this.props.droppableId, droppableId : this.props.droppableId},function(provided,snapshot) {
			return renderItem(provided,snapshot);
		});
	}
});
var css_FlexFlow = {};
css_FlexFlow.fromMulti = function(arr) {
	return arr.join(" ");
};
var css_GlobalValue = {};
css_GlobalValue.Var = function(v) {
	while(!StringTools.startsWith(v,"--")) v = "-" + v;
	return "var(" + v + ")";
};
var css_OverflowCompo = {};
css_OverflowCompo.fromArray = function(arr) {
	return arr.join(" ");
};
var css_CSSLengthOrArray = {};
css_CSSLengthOrArray.fromArr = function(arr) {
	var result = new Array(arr.length);
	var _g = 0;
	var _g1 = arr.length;
	while(_g < _g1) {
		var i = _g++;
		result[i] = arr[i];
	}
	return result.join(" ");
};
css_CSSLengthOrArray.fromNumber = function(nb) {
	return nb + "px";
};
var css_CSSNumberOrArray = {};
css_CSSNumberOrArray.fromArr = function(arr) {
	var result = new Array(arr.length);
	var _g = 0;
	var _g1 = arr.length;
	while(_g < _g1) {
		var i = _g++;
		result[i] = arr[i];
	}
	return result.join(" ");
};
css_CSSNumberOrArray.fromNumber = function(nb) {
	if(nb == null) {
		return "null";
	} else {
		return "" + nb;
	}
};
var css_CSSLength = {};
css_CSSLength.fromNumber = function(nb) {
	return nb + "px";
};
var css_CSSNumber = {};
css_CSSNumber.fromNumber = function(nb) {
	if(nb == null) {
		return "null";
	} else {
		return "" + nb;
	}
};
var css_PropertiesHelper = function() { };
css_PropertiesHelper.__name__ = true;
css_PropertiesHelper.toCSS = function(properties,indent) {
	if(indent == null) {
		indent = "";
	}
	var ret_b = "";
	var _g = 0;
	var _g1 = Reflect.fields(properties);
	while(_g < _g1.length) {
		var k = _g1[_g];
		++_g;
		var key = css_PropertiesHelper.hyphenize(k);
		ret_b += Std.string(indent + key + ": " + Std.string(Reflect.field(properties,k)) + ";\n");
	}
	return ret_b;
};
css_PropertiesHelper.hyphenize = function(key) {
	if(StringTools.startsWith(key,"--")) {
		return key;
	}
	return new EReg("([A-Z])","g").map(key,function(reg) {
		return "-" + reg.matched(1).toLowerCase();
	});
};
var css_TextOverflow = {};
css_TextOverflow.fromArray = function(arr) {
	return arr.join(" ");
};
var css_VerticalAlign = {};
css_VerticalAlign.fromFloat = function(f) {
	return "" + f + "px";
};
var haxe_Exception = function(message,previous,native) {
	Error.call(this,message);
	this.message = message;
	this.__previousException = previous;
	this.__nativeException = native != null ? native : this;
};
haxe_Exception.__name__ = true;
haxe_Exception.thrown = function(value) {
	if(((value) instanceof haxe_Exception)) {
		return value.get_native();
	} else if(((value) instanceof Error)) {
		return value;
	} else {
		var e = new haxe_ValueException(value);
		return e;
	}
};
haxe_Exception.__super__ = Error;
haxe_Exception.prototype = $extend(Error.prototype,{
	get_native: function() {
		return this.__nativeException;
	}
});
var haxe_ValueException = function(value,previous,native) {
	haxe_Exception.call(this,String(value),previous,native);
	this.value = value;
};
haxe_ValueException.__name__ = true;
haxe_ValueException.__super__ = haxe_Exception;
haxe_ValueException.prototype = $extend(haxe_Exception.prototype,{
});
var haxe_iterators_ArrayIterator = function(array) {
	this.current = 0;
	this.array = array;
};
haxe_iterators_ArrayIterator.__name__ = true;
haxe_iterators_ArrayIterator.prototype = {
	hasNext: function() {
		return this.current < this.array.length;
	}
	,next: function() {
		return this.array[this.current++];
	}
};
var js_Boot = function() { };
js_Boot.__name__ = true;
js_Boot.__string_rec = function(o,s) {
	if(o == null) {
		return "null";
	}
	if(s.length >= 5) {
		return "<...>";
	}
	var t = typeof(o);
	if(t == "function" && (o.__name__ || o.__ename__)) {
		t = "object";
	}
	switch(t) {
	case "function":
		return "<function>";
	case "object":
		if(o.__enum__) {
			var e = $hxEnums[o.__enum__];
			var con = e.__constructs__[o._hx_index];
			var n = con._hx_name;
			if(con.__params__) {
				s = s + "\t";
				return n + "(" + ((function($this) {
					var $r;
					var _g = [];
					{
						var _g1 = 0;
						var _g2 = con.__params__;
						while(true) {
							if(!(_g1 < _g2.length)) {
								break;
							}
							var p = _g2[_g1];
							_g1 = _g1 + 1;
							_g.push(js_Boot.__string_rec(o[p],s));
						}
					}
					$r = _g;
					return $r;
				}(this))).join(",") + ")";
			} else {
				return n;
			}
		}
		if(((o) instanceof Array)) {
			var str = "[";
			s += "\t";
			var _g = 0;
			var _g1 = o.length;
			while(_g < _g1) {
				var i = _g++;
				str += (i > 0 ? "," : "") + js_Boot.__string_rec(o[i],s);
			}
			str += "]";
			return str;
		}
		var tostr;
		try {
			tostr = o.toString;
		} catch( _g ) {
			return "???";
		}
		if(tostr != null && tostr != Object.toString && typeof(tostr) == "function") {
			var s2 = o.toString();
			if(s2 != "[object Object]") {
				return s2;
			}
		}
		var str = "{\n";
		s += "\t";
		var hasp = o.hasOwnProperty != null;
		var k = null;
		for( k in o ) {
		if(hasp && !o.hasOwnProperty(k)) {
			continue;
		}
		if(k == "prototype" || k == "__class__" || k == "__super__" || k == "__interfaces__" || k == "__properties__") {
			continue;
		}
		if(str.length != 2) {
			str += ", \n";
		}
		str += s + k + " : " + js_Boot.__string_rec(o[k],s);
		}
		s = s.substring(1);
		str += "\n" + s + "}";
		return str;
	case "string":
		return o;
	default:
		return String(o);
	}
};
var react_Partial = function() { };
react_Partial.__name__ = true;
var react_PartialMacro = function() { };
react_PartialMacro.__name__ = true;
var React = require("react");
var ReactDOM = require("react-dom");
var react_ReactMacro = function() { };
react_ReactMacro.__name__ = true;
var react_types_ForcedOverride = function() { };
react_types_ForcedOverride.__name__ = true;
var react_types_Noise = $hxEnums["react.types.Noise"] = { __ename__:true,__constructs__:null
};
react_types_Noise.__constructs__ = [];
var react_types_Record = function() { };
react_types_Record.__name__ = true;
var react_$beautiful_$dnd_DragDropContext = require("react-beautiful-dnd").DragDropContext;
var react_$beautiful_$dnd_Draggable = require("react-beautiful-dnd").Draggable;
var react_$beautiful_$dnd_Droppable = require("react-beautiful-dnd").Droppable;
if(typeof(performance) != "undefined" ? typeof(performance.now) == "function" : false) {
	HxOverrides.now = performance.now.bind(performance);
}
String.__name__ = true;
Array.__name__ = true;
js_Boot.__toStr = ({ }).toString;
components_App.displayName = "App";
components_App.__fileName__ = "src/components/App.hx";
components_CustomDraggable.displayName = "CustomDraggable";
components_CustomDraggable.__fileName__ = "src/components/CustomDraggable.hx";
components_CustomDroppable.displayName = "CustomDroppable";
components_CustomDroppable.__fileName__ = "src/components/CustomDroppable.hx";
css_FlexFlow.Row = "row";
css_FlexFlow.RowReverse = "row-reverse";
css_FlexFlow.Column = "column";
css_FlexFlow.ColumnReverse = "column-reverse";
css_FlexFlow.NoWrap = "nowrap";
css_FlexFlow.Wrap = "wrap";
css_FlexFlow.WrapReverse = "wrap-reverse";
css_GlobalValue.Inherit = "inherit";
css_GlobalValue.Initial = "initial";
css_GlobalValue.Unset = "unset";
css_OverflowCompo.Visible = "visible";
css_OverflowCompo.Hidden = "hidden";
css_OverflowCompo.Scroll = "scroll";
css_OverflowCompo.Auto = "auto";
css_TextOverflow.Clip = "clip";
css_TextOverflow.Ellipsis = "ellipsis";
css_VerticalAlign.Baseline = "baseline";
css_VerticalAlign.Sub = "sub";
css_VerticalAlign.Super = "super";
css_VerticalAlign.TextTop = "text-top";
css_VerticalAlign.TextBottom = "text-bottom";
css_VerticalAlign.Middle = "middle";
css_VerticalAlign.Top = "top";
css_VerticalAlign.Bottom = "bottom";
Main.main();
})({});

//# sourceMappingURL=index.js.map