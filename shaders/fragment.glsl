precision mediump float;

uniform vec3 lowerBound, upperBound;
uniform float contourTint;
uniform vec4 contourColor;
uniform sampler2D colormap;
uniform vec3 clipBounds[2];

varying float value, kill;
varying vec3 worldCoordinate;

void main() {
  if(kill > 0.0 ||
    any(lessThan(worldCoordinate, clipBounds[0])) || any(greaterThan(worldCoordinate, clipBounds[1]))) {
    discard;
  }
  float interpValue = (value - lowerBound.z) / (upperBound.z - lowerBound.z);
  gl_FragColor = mix(texture2D(colormap, vec2(interpValue, interpValue)), contourColor, contourTint);
}