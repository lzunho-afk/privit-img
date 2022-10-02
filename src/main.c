#include <stdio.h>
#include <stdlib.h>

#include "cyaml/cyaml.h"

#include <argp.h>
#include <sqlite3.h>

#include "config.h"
#include "version.h"

#ifdef POSTGRESQL_SUPPORT
#include <libpq-fe.h>
#endif

int main(int argc, char** argv) {
    printf("Hello, CMake!\n");
    return 0;
}