shader_type canvas_item;

uniform vec3 color = vec3(0.0,0.0,0.0);

void fragment()
{
	COLOR = vec4(color, 1.0);
}