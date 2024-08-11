varying vec2 v_vTexcoord;
varying vec4 v_vColour;

uniform vec3 colors[4];

void main() {
    gl_FragColor = v_vColour * texture2D( gm_BaseTexture, v_vTexcoord );
	float index = gl_FragColor.r * 3.0;
	if (index >= 3.0)
		gl_FragColor.rgb = colors[3];
	else if (index >= 2.0)
		gl_FragColor.rgb = colors[2];
	else if (index >= 1.0)
		gl_FragColor.rgb = colors[1];
	else
		gl_FragColor.rgb = colors[0];
}
