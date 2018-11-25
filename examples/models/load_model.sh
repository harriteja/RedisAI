REDIS_CLI=../../deps/redis/src/redis-cli

echo "SET GRAPH"
$REDIS_CLI -x DL.GSET foo < graph.pb

echo "SET TENSORS"
$REDIS_CLI DL.TSET a FLOAT 1 2 VALUES 2 3
$REDIS_CLI DL.TSET b FLOAT 1 2 VALUES 2 3

echo "GET TENSORS"
$REDIS_CLI DL.TGET a VALUES
$REDIS_CLI DL.TGET b VALUES

echo "RUN GRAPH"
$REDIS_CLI DL.GRUN foo 2 a a b b c mul

echo "GET TENSOR VALUES"
$REDIS_CLI DL.TGET c VALUES

echo "GET TENSOR BLOB"
$REDIS_CLI --raw DL.TGET c BLOB

echo "TENSOR DIM" `$REDIS_CLI DL.TDIM c`

echo "TENSOR SHAPE" `$REDIS_CLI DL.TSHAPE c`

echo "TENSOR DATATYPE" `$REDIS_CLI DL.TDATATYPE c`

echo "TENSOR BYTESIZE" `$REDIS_CLI DL.TBYTESIZE c`
