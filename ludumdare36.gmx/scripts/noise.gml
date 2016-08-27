nx = argument0;
ny = argument1;
nz = argument2;

X = floor(nx) & 255;                  // FIND UNIT CUBE THAT
Y = floor(ny) & 255;                  // CONTAINS POINT.
Z = floor(nz) & 255;
nx -= floor(nx);                                // FIND RELATIVE X,Y,Z
ny -= floor(ny);                                // OF POINT IN CUBE.
nz -= floor(nz);
u = fade(nx);
v = fade(ny);                                // FOR EACH OF X,Y,Z.
w = fade(nz);
A = global.permutation[X  ]+Y;
AA = global.permutation[A]+Z;
AB = global.permutation[A+1]+Z;      // HASH COORDINATES OF
B = global.permutation[X+1]+Y
BA = global.permutation[B]+Z
BB = global.permutation[B+1]+Z;      // THE 8 CUBE CORNERS,

return noiselerp(w, noiselerp(v, noiselerp(u, grad(global.permutation[AA  ], nx  , ny  , nz   ), grad(global.permutation[BA  ], nx-1, ny  , nz   )), noiselerp(u, grad(global.permutation[AB  ], nx  , ny-1, nz   ), grad(global.permutation[BB  ], nx-1, ny-1, nz   ))), noiselerp(v, noiselerp(u, grad(global.permutation[AA+1], nx  , ny  , nz-1 ), grad(global.permutation[BA+1], nx-1, ny  , nz-1 )), noiselerp(u, grad(global.permutation[AB+1], nx  , ny-1, nz-1 ), grad(global.permutation[BB+1], nx-1, ny-1, nz-1 ))));
