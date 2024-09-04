.PHONY:	ffigen	proto

ffigen:
	@echo "* ffi generation *"
	@dart run ffigen --config ffigen.yaml

proto:
	@echo "* protobuf generation *"
	@flutter pub global activate protoc_plugin
	@protoc  -I=./include/proto --dart_out=./lib/protobuf ./include/proto/**.proto
	# @chmod +x generate_proto_index.sh
	# @./generate_proto_index.sh