#include <lua.h>
#include <lualib.h>
#include <lauxlib.h>
#include <stdio.h>
#include <string.h>

int main(int argc, char **argv) {
    lua_State *L;

    if (argc <= 1) {
        fprintf(stderr, "Usage: %s <bytecode_file> [args...]\n", argv[0]);
        return 1;
    }

    L = luaL_newstate();
    if (L == NULL) {
        fprintf(stderr, "Failed to create Lua state.\n");
        return 1;
    }

    luaL_openlibs(L);

    printf("Loading file: %s\n", argv[1]);

    if (luaL_loadfile(L, argv[1]) != 0) {
        fprintf(stderr, "Error loading file: %s\n", lua_tostring(L, -1));
        lua_close(L);
        return 1;
    }

    // Push additional arguments onto the Lua stack
    for (int i = 2; i < argc; i++) {
        lua_pushstring(L, argv[i]);
    }

    // Example of handling specific flags or initializations
    if (strcmp(argv[1], "efspotato.byte") == 0) {
        // Specific initializations or argument modifications
    }

    printf("Running file: %s with %d arguments\n", argv[1], argc - 2);

    if (lua_pcall(L, argc - 2, 0, 0) != 0) {
        fprintf(stderr, "Error running file: %s\n", lua_tostring(L, -1));
        lua_close(L);
        return 1;
    }

    printf("File executed successfully.\n");

    lua_close(L);
    return 0;
}
