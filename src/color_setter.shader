shader_type canvas_item;

uniform vec3 color = vec3(0.0,0.0,0.0);

float dist(vec2 pos)
{
	return sqrt(pow(pos.x, 2) + pow(pos.y, 2)); 
}

void fragment()
{
	COLOR = vec4(color, 0.6 * pow(1.0 - dist(vec2(UV.x - 0.5, UV.y - 0.5)), 6));
}