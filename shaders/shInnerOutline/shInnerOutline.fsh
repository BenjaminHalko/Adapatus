varying vec2 v_vTexcoord;
varying vec4 v_vColour;

uniform vec2 texelSize;
uniform vec4 uvs;

void main() {
    gl_FragColor = v_vColour * texture2D( gm_BaseTexture, v_vTexcoord );
	
	float alpha = 1.0;
	alpha *= texture2D( gm_BaseTexture, v_vTexcoord - vec2(0.0, texelSize.y) ).a;
	alpha *= texture2D( gm_BaseTexture, v_vTexcoord + vec2(0.0, texelSize.y) ).a;
	alpha *= texture2D( gm_BaseTexture, v_vTexcoord - vec2(texelSize.x, 0.0) ).a;
	alpha *= texture2D( gm_BaseTexture, v_vTexcoord + vec2(texelSize.x, 0.0) ).a;
	
	alpha *= float(v_vTexcoord.x >= uvs[0] + texelSize.x);
	alpha *= float(v_vTexcoord.y >= uvs[1] + texelSize.y);
	alpha *= float(v_vTexcoord.x <= uvs[2] - texelSize.x);
	alpha *= float(v_vTexcoord.y <= uvs[3] - texelSize.y);
	
	gl_FragColor.a *= 1.0 - alpha;
	gl_FragColor.rgb = vec3(1.0);
}
