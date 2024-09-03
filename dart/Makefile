.PHONY:	ffigen	proto

ffigen:
	@echo "* ffi generation *"
	@dart run ffigen --config ffigen.yaml

proto:
	@echo "* protobuf generation *"
	@flutter pub global activate protoc_plugin
	@protoc  -I=./gen/proto --dart_out=./lib/src/gen/proto ./gen/proto/**.proto
	@chmod +x generate_proto_index.sh
	@./generate_proto_index.sh