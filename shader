shader_type canvas_item;

uniform vec2 first;
uniform vec2 second;
uniform sampler2D mask;

void fragment(){
	vec2 position = UV;

    // move to (0.5, 0.5)
	position -= vec2(0.5, 0.5);

    // apply rotation transformation
	mat2 rotation_matrix = mat2(first, second);
	position = position * rotation_matrix;

    // move back
	position += vec2(0.5, 0.5);
	
	float alpha = texture(TEXTURE, UV).a;
	float red = texture(mask, position).r ;
	float green =texture(mask, position).g ;
	float blue =  texture(mask, position).b;

	COLOR = vec4(red,green, blue, alpha);

	
}
