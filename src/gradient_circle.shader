shader_type canvas_item;

float center_dist(vec2 coord)
{
	return sqrt(coord.x*coord.x + coord.y*coord.y);
}

void fragment()
{
	COLOR = vec4(0.0, 0.0, 0.0, 2.0 * center_dist(vec2(UV.x-0.5, UV.y-0.5)));
}