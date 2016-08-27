hash = argument0;
nx = argument1;
ny = argument2;
nz = argument3;

h = hash & 15;
if (h < 8) {
    u = nx;
} else {
    u = ny;
}
if (h < 4) {
    v = ny;
} else {
    if (h == 12 || h == 14) {
        v = nx;
    } else {
        v = nz;
    }
}

ret = 0;
if (h & 1 == 0) {
    ret = u;
} else {
    ret = -u;
}

if (h&2 == 0) {
    ret += v;
} else {
    ret += -v;
}

return ret;
