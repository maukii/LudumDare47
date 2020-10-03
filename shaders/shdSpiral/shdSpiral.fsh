varying vec2 v_vTexcoord;
varying vec4 v_vColour;
varying vec4 v_vPosition;

uniform vec2 iResolution;
uniform float time;

// Speed multiplier of the rotation
uniform float rotationSpeed;

void main()
{    

    vec4 white = vec4(0.1, 0.1, 0.1, 1.);
    vec4 black = vec4(0., 0., 0., 1.);
    
    vec2 uv = v_vTexcoord.xy / .5 - 1.;
    uv.x *= iResolution.x / iResolution.y;
    
    // make a tube
    float f = 1. / length(uv);
    
    // add the angle
    f += atan(uv.x, uv.y) / acos(0.);
    
    // let's roll
    f += time / 1000.;
    
    // make it black and white
       f = floor(fract(f) * 2.);
        
    // add the darkness to the end of the tunnel
    f *= sin(length(uv) - .001);
        
    gl_FragColor = vec4(f, f, f, 1.0);
        
    float average = gl_FragColor.r + gl_FragColor.g + gl_FragColor.b / 3.;
    
    if (average <= 0.3)
    {
        gl_FragColor = black;        
    }
    else
        gl_FragColor = white;
    
}