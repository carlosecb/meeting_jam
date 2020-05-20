shader_type canvas_item;

float radium(float freq)
{
	float noise = sin(5.0*freq)*cos(3.0*freq);
	return 5.125 + 0.125*noise;
}

float center_dist(vec2 coord)
{
	return sqrt(coord.x*coord.x + coord.y*coord.y);
}

void fragment()
{
	COLOR = vec4(0.0, 0.0, 0.0, radium(0.5*TIME) * center_dist(vec2(UV.x-0.5, UV.y-0.5)));
}