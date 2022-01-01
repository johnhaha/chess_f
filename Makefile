clean:
	@flutter clean
	@flutter pub get
grpc:
	@protoc --dart_out=grpc:/Users/junwu/develop/proj/chess_f/lib/grap/generated -I=/Users/junwu/develop/proj/chess/grap /Users/junwu/develop/proj/chess/grap/grap.proto
grpc-r:
	@protoc -I=/usr/local/Cellar/protobuf/3.17.3/include --dart_out=/Users/junwu/develop/proj/chess_f/lib/generated /usr/local/Cellar/protobuf/3.17.3/include/google/protobuf/empty.proto