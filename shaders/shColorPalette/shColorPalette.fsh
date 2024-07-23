varying vec2 v_vTexcoord;
varying vec4 v_vColour;

uniform vec3 colors[4];
uniform float invert;

void main() {
    gl_FragColor = v_vColour * texture2D( gm_BaseTexture, v_vTexcoord );
	vec3 col, colInvert;
	float index = gl_FragColor.r * 3.0;
	if (index >= 3.0) {
		col = colors[3];
		colInvert = colors[0];
	} else if (index >= 2.0) {
		col = colors[2];
		colInvert = colors[1];
	} else if (index >= 1.0) {
		col = colors[1];
		colInvert = colors[2];
	} else {
		col = colors[0];
		colInvert = colors[3];
	}
	gl_FragColor.rgb = mix(col, colInvert, invert);
}
