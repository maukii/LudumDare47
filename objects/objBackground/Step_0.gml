timeMultiplier = lerp(timeMultiplier, 1, 0.1);

var size = array_length(white);
for (var i = 0; i < size; ++i) {
    white[i] = lerp(white[1], 0.1, 0.1);
}