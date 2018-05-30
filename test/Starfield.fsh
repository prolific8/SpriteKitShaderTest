//#define M_PI 3.1415926535897932384626433832795

float rand(vec2 co);

float rand(vec2 co)
{
    return fract(sin(dot(co.xy ,vec2(12.9898,78.233))) * 43758.5453);
}

void main()
{
    float size = 50.0; //Item 1:
    float prob = 0.95; //Item 2:
    
    vec2 pos = floor(1.0 / size * gl_FragCoord.xy);
    
    float color = 0.0;
    float starValue = rand(pos);
    
    if (starValue > prob)
    {
        vec2 center = size * pos + vec2(size, size) * 0.5;
        
        float t = 0.9 + 0.2 * sin(u_time + (starValue - prob) / (1.0 - prob) * 45.0); //Item 3:
        
        color = 1.0 - distance(gl_FragCoord.xy, center) / (0.9 * size);
        color = color * t / (abs(gl_FragCoord.y - center.y)) * t / (abs(gl_FragCoord.x - center.x));
    }
    else if (rand(v_tex_coord) > 0.996)
    {
        float r = rand(gl_FragCoord.xy);
        color = r * (0.25 * sin(u_time * (r * 5.0) + 720.0 * r) + 0.75);
    }
    
    gl_FragColor = vec4(vec3(color), 1.0);
}
