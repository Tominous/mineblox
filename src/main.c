//----------------------------------------------------------------------------------------------------------------------
// Mineblox
// Copyright (C)2017, Matt Davies, all rights reserved.
//----------------------------------------------------------------------------------------------------------------------

#define K_IMPLEMENTATION
#include <kore/kore.h>
#include <kore/kgl.h>
#include <kore/kui.h>

int kmain(int argc, char** argv)
{
    Pool(i64) p = 0;

    i64 i0 = poolAcquire(p);
    i64 i1 = poolAcquire(p);
    i64 i2 = poolAcquire(p);

    poolRecycle(p, i1);
    i64 i3 = poolAcquire(p);

    return 0;
}

