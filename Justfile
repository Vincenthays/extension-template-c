debug:
    GEN=ninja make debug

test: debug
    duckdb -init /dev/null -unsigned -c "\
    INSTALL 'build/debug/capi_quack.duckdb_extension'; \
    LOAD capi_quack; \
    SELECT multiply_numbers_together(5,10); \
    "
