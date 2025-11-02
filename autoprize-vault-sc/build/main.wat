(module
 (type $0 (func (param i32) (result i32)))
 (type $1 (func (result i32)))
 (type $2 (func (param i32 i32) (result i32)))
 (type $3 (func (param i32 i32)))
 (type $4 (func (param i32)))
 (type $5 (func))
 (type $6 (func (param i32 i32 i32) (result i32)))
 (type $7 (func (param i32 i32 i32)))
 (type $8 (func (param i32 i64)))
 (type $9 (func (param i32 i32 i32 i32)))
 (type $10 (func (param i32 i32 i32 i32) (result i32)))
 (type $11 (func (result i64)))
 (type $12 (func (param i32 i32 i64)))
 (type $13 (func (param i32 i32 i64 i32 i64 i32 i64) (result i32)))
 (type $14 (func (param i64 i32) (result i32)))
 (type $15 (func (param i64)))
 (type $16 (func (param i32) (result f64)))
 (type $17 (func (param i32) (result i64)))
 (type $18 (func (param i32 i64) (result i32)))
 (type $19 (func (param i64) (result i32)))
 (import "env" "abort" (func $~lib/builtins/abort (param i32 i32 i32 i32)))
 (import "massa" "assembly_script_caller_has_write_access" (func $~lib/@massalabs/massa-as-sdk/assembly/env/env/env.callerHasWriteAccess (result i32)))
 (import "massa" "assembly_script_get_call_stack" (func $~lib/@massalabs/massa-as-sdk/assembly/env/env/env.callStack (result i32)))
 (import "massa" "assembly_script_set_data" (func $~lib/@massalabs/massa-as-sdk/assembly/env/env/env.set (param i32 i32)))
 (import "massa" "assembly_script_get_current_period" (func $~lib/@massalabs/massa-as-sdk/assembly/env/env/env.currentPeriod (result i64)))
 (import "massa" "assembly_script_get_current_thread" (func $~lib/@massalabs/massa-as-sdk/assembly/env/env/env.currentThread (result i32)))
 (import "massa" "assembly_script_deferred_call_register" (func $~lib/@massalabs/massa-as-sdk/assembly/env/env/env.deferredCallRegister (param i32 i32 i64 i32 i64 i32 i64) (result i32)))
 (import "massa" "assembly_script_generate_event" (func $~lib/@massalabs/massa-as-sdk/assembly/env/env/env.generateEvent (param i32)))
 (import "massa" "assembly_script_get_call_coins" (func $~lib/@massalabs/massa-as-sdk/assembly/env/env/env.callCoins (result i64)))
 (import "massa" "assembly_script_has_data" (func $~lib/@massalabs/massa-as-sdk/assembly/env/env/env.has (param i32) (result i32)))
 (import "massa" "assembly_script_get_data" (func $~lib/@massalabs/massa-as-sdk/assembly/env/env/env.get (param i32) (result i32)))
 (import "massa" "assembly_script_transfer_coins" (func $~lib/@massalabs/massa-as-sdk/assembly/env/env/env.transferCoins (param i32 i64)))
 (global $~lib/rt/itcms/white (mut i32) (i32.const 0))
 (global $~lib/rt/itcms/iter (mut i32) (i32.const 0))
 (global $~lib/rt/itcms/toSpace (mut i32) (i32.const 0))
 (global $~lib/rt/itcms/state (mut i32) (i32.const 0))
 (global $~lib/rt/itcms/total (mut i32) (i32.const 0))
 (global $~lib/rt/itcms/threshold (mut i32) (i32.const 0))
 (global $~lib/rt/itcms/visitCount (mut i32) (i32.const 0))
 (global $~lib/rt/itcms/pinSpace (mut i32) (i32.const 0))
 (global $~lib/rt/itcms/fromSpace (mut i32) (i32.const 0))
 (global $~lib/rt/tlsf/ROOT (mut i32) (i32.const 0))
 (global $~argumentsLength (mut i32) (i32.const 0))
 (global $~lib/@massalabs/as-types/assembly/argument/NoArg (mut i32) (i32.const 0))
 (global $~lib/rt/__rtti_base i32 (i32.const 9552))
 (global $~lib/memory/__stack_pointer (mut i32) (i32.const 42404))
 (memory $0 1)
 (data $0 (i32.const 1036) "<")
 (data $0.1 (i32.const 1048) "\02\00\00\00 \00\00\00~\00l\00i\00b\00/\00r\00t\00/\00i\00t\00c\00m\00s\00.\00t\00s")
 (data $2 (i32.const 1132) "<")
 (data $2.1 (i32.const 1144) "\02\00\00\00$\00\00\00I\00n\00d\00e\00x\00 \00o\00u\00t\00 \00o\00f\00 \00r\00a\00n\00g\00e")
 (data $3 (i32.const 1196) ",")
 (data $3.1 (i32.const 1208) "\02\00\00\00\14\00\00\00~\00l\00i\00b\00/\00r\00t\00.\00t\00s")
 (data $4 (i32.const 1244) "<")
 (data $4.1 (i32.const 1256) "\02\00\00\00(\00\00\00A\00l\00l\00o\00c\00a\00t\00i\00o\00n\00 \00t\00o\00o\00 \00l\00a\00r\00g\00e")
 (data $7 (i32.const 1372) "<")
 (data $7.1 (i32.const 1384) "\02\00\00\00\1e\00\00\00~\00l\00i\00b\00/\00r\00t\00/\00t\00l\00s\00f\00.\00t\00s")
 (data $8 (i32.const 1436) ",")
 (data $8.1 (i32.const 1448) "\02\00\00\00\1c\00\00\00I\00n\00v\00a\00l\00i\00d\00 \00l\00e\00n\00g\00t\00h")
 (data $9 (i32.const 1484) "<")
 (data $9.1 (i32.const 1496) "\02\00\00\00&\00\00\00~\00l\00i\00b\00/\00s\00t\00a\00t\00i\00c\00a\00r\00r\00a\00y\00.\00t\00s")
 (data $10 (i32.const 1548) "\1c")
 (data $10.1 (i32.const 1560) "\05")
 (data $11 (i32.const 1580) "l")
 (data $11.1 (i32.const 1592) "\02\00\00\00R\00\00\00A\00U\001\001\001\001\001\001\001\001\001\001\001\001\001\001\001\001\001\001\001\001\001\001\001\001\001\001\001\001\001\001\001\001\001\002\00m\001\00s\009\00K")
 (data $12 (i32.const 1692) "\1c")
 (data $12.1 (i32.const 1704) "\02\00\00\00\04\00\00\00:\00:")
 (data $13 (i32.const 1724) ",")
 (data $13.1 (i32.const 1736) "\02\00\00\00\14\00\00\00p\00r\00i\00z\00e\00_\00p\00o\00o\00l")
 (data $14 (i32.const 1772) "<")
 (data $14.1 (i32.const 1784) "\02\00\00\00 \00\00\00n\00e\00x\00t\00_\00d\00r\00a\00w\00_\00p\00e\00r\00i\00o\00d")
 (data $15 (i32.const 1836) ",")
 (data $15.1 (i32.const 1848) "\02\00\00\00\18\00\00\00d\00r\00a\00w\00_\00p\00e\00r\00i\00o\00d\00s")
 (data $16 (i32.const 1884) ",")
 (data $16.1 (i32.const 1896) "\02\00\00\00\18\00\00\00t\00i\00c\00k\00_\00p\00e\00r\00i\00o\00d\00s")
 (data $17 (i32.const 1932) "<")
 (data $17.1 (i32.const 1944) "\02\00\00\00\"\00\00\00p\00a\00r\00t\00i\00c\00i\00p\00a\00n\00t\00_\00c\00o\00u\00n\00t")
 (data $18 (i32.const 1996) ",")
 (data $18.1 (i32.const 2008) "\02\00\00\00\1c\00\00\00s\00c\00h\00e\00d\00u\00l\00e\00r\00_\00s\00e\00e\00d")
 (data $19 (i32.const 2044) "<")
 (data $19.1 (i32.const 2056) "\02\00\00\00&\00\00\00m\00i\00n\00_\00p\00r\00i\00z\00e\00_\00t\00h\00r\00e\00s\00h\00o\00l\00d")
 (data $20 (i32.const 2108) ",")
 (data $20.1 (i32.const 2120) "\02\00\00\00\18\00\00\00w\00i\00n\00n\00e\00r\00_\00c\00o\00u\00n\00t")
 (data $21 (i32.const 2156) "<")
 (data $21.1 (i32.const 2168) "\02\00\00\00 \00\00\00l\00a\00s\00t\00_\00d\00r\00a\00w\00_\00p\00e\00r\00i\00o\00d")
 (data $22 (i32.const 2220) "<")
 (data $22.1 (i32.const 2232) "\02\00\00\00 \00\00\00c\00o\00n\00s\00e\00r\00v\00a\00t\00i\00v\00e\00_\00t\00v\00l")
 (data $23 (i32.const 2284) ",")
 (data $23.1 (i32.const 2296) "\02\00\00\00\18\00\00\00m\00o\00d\00e\00r\00a\00t\00e\00_\00t\00v\00l")
 (data $24 (i32.const 2332) ",")
 (data $24.1 (i32.const 2344) "\02\00\00\00\1c\00\00\00a\00g\00g\00r\00e\00s\00s\00i\00v\00e\00_\00t\00v\00l")
 (data $25 (i32.const 2380) "<")
 (data $25.1 (i32.const 2392) "\02\00\00\00(\00\00\00c\00o\00n\00s\00e\00r\00v\00a\00t\00i\00v\00e\00_\00t\00i\00c\00k\00e\00t\00s")
 (data $26 (i32.const 2444) "<")
 (data $26.1 (i32.const 2456) "\02\00\00\00 \00\00\00m\00o\00d\00e\00r\00a\00t\00e\00_\00t\00i\00c\00k\00e\00t\00s")
 (data $27 (i32.const 2508) "<")
 (data $27.1 (i32.const 2520) "\02\00\00\00$\00\00\00a\00g\00g\00r\00e\00s\00s\00i\00v\00e\00_\00t\00i\00c\00k\00e\00t\00s")
 (data $28 (i32.const 2572) "\1c")
 (data $28.1 (i32.const 2584) "\02")
 (data $29 (i32.const 2604) "\1c")
 (data $29.1 (i32.const 2616) "\02\00\00\00\02\00\00\00,")
 (data $30 (i32.const 2636) ",")
 (data $30.1 (i32.const 2648) "\02\00\00\00\1a\00\00\00~\00l\00i\00b\00/\00a\00r\00r\00a\00y\00.\00t\00s")
 (data $31 (i32.const 2684) "\1c")
 (data $31.1 (i32.const 2696) "\0c\00\00\00\08\00\00\00\01")
 (data $32 (i32.const 2716) "|")
 (data $32.1 (i32.const 2728) "\02\00\00\00^\00\00\00E\00l\00e\00m\00e\00n\00t\00 \00t\00y\00p\00e\00 \00m\00u\00s\00t\00 \00b\00e\00 \00n\00u\00l\00l\00a\00b\00l\00e\00 \00i\00f\00 \00a\00r\00r\00a\00y\00 \00i\00s\00 \00h\00o\00l\00e\00y")
 (data $33 (i32.const 2844) "L")
 (data $33.1 (i32.const 2856) "\02\00\00\004\00\00\00a\00s\00s\00e\00m\00b\00l\00y\00/\00c\00o\00n\00t\00r\00a\00c\00t\00s\00/\00m\00a\00i\00n\00.\00t\00s")
 (data $34 (i32.const 2924) "\8c")
 (data $34.1 (i32.const 2936) "\02\00\00\00n\00\00\00c\00a\00n\00\'\00t\00 \00d\00e\00s\00e\00r\00i\00a\00l\00i\00z\00e\00 \00u\006\004\00 \00f\00r\00o\00m\00 \00g\00i\00v\00e\00n\00 \00a\00r\00g\00u\00m\00e\00n\00t\00:\00 \00o\00u\00t\00 \00o\00f\00 \00r\00a\00n\00g\00e")
 (data $35 (i32.const 3068) "\1c")
 (data $35.1 (i32.const 3080) "\02\00\00\00\04\00\00\00:\00 ")
 (data $36 (i32.const 3100) "\1c\00\00\00\03\00\00\00\00\00\00\00\0f\00\00\00\0c\00\00\00\00\00\00\00\10\0c")
 (data $37 (i32.const 3132) "|")
 (data $37.1 (i32.const 3144) "\02\00\00\00^\00\00\00U\00n\00e\00x\00p\00e\00c\00t\00e\00d\00 \00\'\00n\00u\00l\00l\00\'\00 \00(\00n\00o\00t\00 \00a\00s\00s\00i\00g\00n\00e\00d\00 \00o\00r\00 \00f\00a\00i\00l\00e\00d\00 \00c\00a\00s\00t\00)")
 (data $38 (i32.const 3260) "l")
 (data $38.1 (i32.const 3272) "\02\00\00\00V\00\00\00~\00l\00i\00b\00/\00@\00m\00a\00s\00s\00a\00l\00a\00b\00s\00/\00a\00s\00-\00t\00y\00p\00e\00s\00/\00a\00s\00s\00e\00m\00b\00l\00y\00/\00r\00e\00s\00u\00l\00t\00.\00t\00s")
 (data $39 (i32.const 3372) "\1c\00\00\00\03\00\00\00\00\00\00\00\0f\00\00\00\0c\00\00\00\00\00\00\00\10\0c")
 (data $40 (i32.const 3404) "|")
 (data $40.1 (i32.const 3416) "\02\00\00\00d\00\00\00t\00o\00S\00t\00r\00i\00n\00g\00(\00)\00 \00r\00a\00d\00i\00x\00 \00a\00r\00g\00u\00m\00e\00n\00t\00 \00m\00u\00s\00t\00 \00b\00e\00 \00b\00e\00t\00w\00e\00e\00n\00 \002\00 \00a\00n\00d\00 \003\006")
 (data $41 (i32.const 3532) "<")
 (data $41.1 (i32.const 3544) "\02\00\00\00&\00\00\00~\00l\00i\00b\00/\00u\00t\00i\00l\00/\00n\00u\00m\00b\00e\00r\00.\00t\00s")
 (data $42 (i32.const 3596) "\1c")
 (data $42.1 (i32.const 3608) "\02\00\00\00\02\00\00\000")
 (data $43 (i32.const 3628) "\\")
 (data $43.1 (i32.const 3640) "\02\00\00\00H\00\00\000\001\002\003\004\005\006\007\008\009\00a\00b\00c\00d\00e\00f\00g\00h\00i\00j\00k\00l\00m\00n\00o\00p\00q\00r\00s\00t\00u\00v\00w\00x\00y\00z")
 (data $44 (i32.const 3724) "\1c")
 (data $44.1 (i32.const 3736) "\05")
 (data $45 (i32.const 3756) "<")
 (data $45.1 (i32.const 3768) "\02\00\00\00$\00\00\00U\00n\00p\00a\00i\00r\00e\00d\00 \00s\00u\00r\00r\00o\00g\00a\00t\00e")
 (data $46 (i32.const 3820) ",")
 (data $46.1 (i32.const 3832) "\02\00\00\00\1c\00\00\00~\00l\00i\00b\00/\00s\00t\00r\00i\00n\00g\00.\00t\00s")
 (data $47 (i32.const 3868) "\1c")
 (data $47.1 (i32.const 3880) "\02\00\00\00\08\00\00\00t\00i\00c\00k")
 (data $48 (i32.const 3900) "\1c")
 (data $48.1 (i32.const 3912) "\05")
 (data $49 (i32.const 3932) "<")
 (data $49.1 (i32.const 3944) "\02\00\00\00\1e\00\00\00t\00i\00c\00k\00_\00s\00c\00h\00e\00d\00u\00l\00e\00d\00:")
 (data $50 (i32.const 3996) "\1c")
 (data $50.1 (i32.const 4008) "\02\00\00\00\02\00\00\00:")
 (data $51 (i32.const 4028) ",\00\00\00\03\00\00\00\00\00\00\00\0f\00\00\00\10\00\00\00p\0f\00\00\00\00\00\00\b0\0f")
 (data $52 (i32.const 4076) "<")
 (data $52.1 (i32.const 4088) "\02\00\00\00$\00\00\00i\00n\00i\00t\00:\00 \00d\00r\00a\00w\00P\00e\00r\00i\00o\00d\00s\00=")
 (data $53 (i32.const 4140) ",")
 (data $53.1 (i32.const 4152) "\02\00\00\00\1a\00\00\00 \00t\00i\00c\00k\00P\00e\00r\00i\00o\00d\00s\00=")
 (data $54 (i32.const 4188) ",\00\00\00\03\00\00\00\00\00\00\00\0f\00\00\00\10\00\00\00\00\10\00\00\00\00\00\00@\10")
 (data $55 (i32.const 4236) "\1c")
 (data $55.1 (i32.const 4248) "\02\00\00\00\08\00\00\00z\00e\00r\00o")
 (data $56 (i32.const 4268) ",")
 (data $56.1 (i32.const 4280) "\02\00\00\00\1c\00\00\00s\00e\00e\00d\00S\00c\00h\00e\00d\00u\00l\00e\00r\00:")
 (data $57 (i32.const 4316) ",")
 (data $57.1 (i32.const 4328) "\02\00\00\00\14\00\00\00z\00e\00r\00o\00 \00c\00o\00i\00n\00s")
 (data $58 (i32.const 4364) "<")
 (data $58.1 (i32.const 4376) "\02\00\00\00 \00\00\00p\00r\00i\00z\00e\00P\00o\00o\00l\00F\00u\00n\00d\00e\00d\00:")
 (data $59 (i32.const 4428) "<")
 (data $59.1 (i32.const 4440) "\02\00\00\00\1e\00\00\00d\00e\00p\00o\00s\00i\00t\00_\00d\00r\00y\00_\00r\00u\00n")
 (data $60 (i32.const 4492) "L")
 (data $60.1 (i32.const 4504) "\02\00\00\008\00\00\00u\00s\00e\00r\00_\00p\00r\00i\00n\00c\00i\00p\00a\00l\00_\00c\00o\00n\00s\00e\00r\00v\00a\00t\00i\00v\00e\00:")
 (data $61 (i32.const 4572) "\1c")
 (data $61.1 (i32.const 4584) "\02\00\00\00\n\00\00\00a\00d\00d\00r\00_")
 (data $62 (i32.const 4604) "L")
 (data $62.1 (i32.const 4616) "\02\00\00\004\00\00\00u\00s\00e\00r\00_\00t\00i\00c\00k\00e\00t\00s\00_\00c\00o\00n\00s\00e\00r\00v\00a\00t\00i\00v\00e\00:")
 (data $63 (i32.const 4684) ",")
 (data $63.1 (i32.const 4696) "\02\00\00\00\14\00\00\00u\00s\00e\00r\00_\00t\00i\00e\00r\00:")
 (data $64 (i32.const 4732) ",")
 (data $64.1 (i32.const 4744) "\02\00\00\00\18\00\00\00c\00o\00n\00s\00e\00r\00v\00a\00t\00i\00v\00e")
 (data $65 (i32.const 4780) "<")
 (data $65.1 (i32.const 4792) "\02\00\00\00(\00\00\00d\00e\00p\00o\00s\00i\00t\00C\00o\00n\00s\00e\00r\00v\00a\00t\00i\00v\00e\00:")
 (data $66 (i32.const 4844) ",\00\00\00\03\00\00\00\00\00\00\00\0f\00\00\00\18\00\00\00\c0\12\00\00\00\00\00\00\b0\0f\00\00\00\00\00\00\b0\0f")
 (data $67 (i32.const 4892) "L")
 (data $67.1 (i32.const 4904) "\02\00\00\000\00\00\00u\00s\00e\00r\00_\00p\00r\00i\00n\00c\00i\00p\00a\00l\00_\00m\00o\00d\00e\00r\00a\00t\00e\00:")
 (data $68 (i32.const 4972) "<")
 (data $68.1 (i32.const 4984) "\02\00\00\00,\00\00\00u\00s\00e\00r\00_\00t\00i\00c\00k\00e\00t\00s\00_\00m\00o\00d\00e\00r\00a\00t\00e\00:")
 (data $69 (i32.const 5036) ",")
 (data $69.1 (i32.const 5048) "\02\00\00\00\10\00\00\00m\00o\00d\00e\00r\00a\00t\00e")
 (data $70 (i32.const 5084) "<")
 (data $70.1 (i32.const 5096) "\02\00\00\00 \00\00\00d\00e\00p\00o\00s\00i\00t\00M\00o\00d\00e\00r\00a\00t\00e\00:")
 (data $71 (i32.const 5148) ",\00\00\00\03\00\00\00\00\00\00\00\0f\00\00\00\18\00\00\00\f0\13\00\00\00\00\00\00\b0\0f\00\00\00\00\00\00\b0\0f")
 (data $72 (i32.const 5196) "L")
 (data $72.1 (i32.const 5208) "\02\00\00\004\00\00\00u\00s\00e\00r\00_\00p\00r\00i\00n\00c\00i\00p\00a\00l\00_\00a\00g\00g\00r\00e\00s\00s\00i\00v\00e\00:")
 (data $73 (i32.const 5276) "L")
 (data $73.1 (i32.const 5288) "\02\00\00\000\00\00\00u\00s\00e\00r\00_\00t\00i\00c\00k\00e\00t\00s\00_\00a\00g\00g\00r\00e\00s\00s\00i\00v\00e\00:")
 (data $74 (i32.const 5356) ",")
 (data $74.1 (i32.const 5368) "\02\00\00\00\14\00\00\00a\00g\00g\00r\00e\00s\00s\00i\00v\00e")
 (data $75 (i32.const 5404) "<")
 (data $75.1 (i32.const 5416) "\02\00\00\00$\00\00\00d\00e\00p\00o\00s\00i\00t\00A\00g\00g\00r\00e\00s\00s\00i\00v\00e\00:")
 (data $76 (i32.const 5468) ",\00\00\00\03\00\00\00\00\00\00\00\0f\00\00\00\18\00\00\000\15\00\00\00\00\00\00\b0\0f\00\00\00\00\00\00\b0\0f")
 (data $77 (i32.const 5516) "\1c")
 (data $77.1 (i32.const 5528) "\02\00\00\00\0c\00\00\00a\00m\00o\00u\00n\00t")
 (data $78 (i32.const 5548) "\1c\00\00\00\03\00\00\00\00\00\00\00\0f\00\00\00\0c\00\00\00\00\00\00\00\10\0c")
 (data $79 (i32.const 5580) ",")
 (data $79.1 (i32.const 5592) "\02\00\00\00\16\00\00\00z\00e\00r\00o\00_\00a\00m\00o\00u\00n\00t")
 (data $80 (i32.const 5628) "<")
 (data $80.1 (i32.const 5640) "\02\00\00\00,\00\00\00i\00n\00s\00u\00f\00f\00i\00c\00i\00e\00n\00t\00_\00p\00r\00i\00n\00c\00i\00p\00a\00l")
 (data $81 (i32.const 5692) "<")
 (data $81.1 (i32.const 5704) "\02\00\00\00(\00\00\00i\00n\00s\00u\00f\00f\00i\00c\00i\00e\00n\00t\00_\00t\00i\00c\00k\00e\00t\00s")
 (data $82 (i32.const 5756) ",")
 (data $82.1 (i32.const 5768) "\02\00\00\00\12\00\00\00w\00i\00t\00h\00d\00r\00a\00w\00:")
 (data $83 (i32.const 5804) ",\00\00\00\03\00\00\00\00\00\00\00\0f\00\00\00\18\00\00\00\90\16\00\00\00\00\00\00\b0\0f\00\00\00\00\00\00\b0\0f")
 (data $84 (i32.const 5852) "\\")
 (data $84.1 (i32.const 5864) "\02\00\00\00@\00\00\00d\00r\00a\00w\00_\00s\00k\00i\00p\00p\00e\00d\00:\00i\00n\00s\00u\00f\00f\00i\00c\00i\00e\00n\00t\00_\00p\00r\00i\00z\00e\00:")
 (data $85 (i32.const 5948) "L")
 (data $85.1 (i32.const 5960) "\02\00\00\008\00\00\00d\00r\00a\00w\00_\00s\00k\00i\00p\00p\00e\00d\00:\00n\00o\00_\00p\00a\00r\00t\00i\00c\00i\00p\00a\00n\00t\00s")
 (data $86 (i32.const 6028) ",")
 (data $86.1 (i32.const 6040) "\02\00\00\00\1a\00\00\00d\00r\00a\00w\00_\00e\00n\00t\00r\00o\00p\00y\00:")
 (data $87 (i32.const 6076) ",")
 (data $87.1 (i32.const 6088) "\02\00\00\00\10\00\00\00:\00t\00a\00r\00g\00e\00t\00=")
 (data $88 (i32.const 6124) ",")
 (data $88.1 (i32.const 6136) "\02\00\00\00\0e\00\00\00:\00t\00o\00t\00a\00l\00=")
 (data $89 (i32.const 6172) ",\00\00\00\03\00\00\00\00\00\00\00\0f\00\00\00\18\00\00\00\a0\17\00\00\00\00\00\00\d0\17\00\00\00\00\00\00\00\18")
 (data $90 (i32.const 6220) "L")
 (data $90.1 (i32.const 6232) "\02\00\00\00<\00\00\00d\00r\00a\00w\00_\00f\00a\00i\00l\00e\00d\00:\00n\00o\00_\00w\00i\00n\00n\00e\00r\00_\00s\00e\00l\00e\00c\00t\00e\00d")
 (data $91 (i32.const 6300) ",\00\00\00\03\00\00\00\00\00\00\00\0f\00\00\00\1c\00\00\00\00\00\00\00\b0\0f\00\00\00\00\00\00\b0\0f\00\00\00\00\00\00\b0\0f")
 (data $92 (i32.const 6348) ",")
 (data $92.1 (i32.const 6360) "\02\00\00\00\0e\00\00\00w\00i\00n\00n\00e\00r\00_")
 (data $93 (i32.const 6396) "\1c")
 (data $93.1 (i32.const 6408) "\02\00\00\00\n\00\00\00d\00r\00a\00w\00:")
 (data $94 (i32.const 6428) "<\00\00\00\03\00\00\00\00\00\00\00\0f\00\00\00 \00\00\00\10\19\00\00\00\00\00\00\b0\0f\00\00\00\00\00\00\b0\0f\00\00\00\00\00\00\b0\0f")
 (data $95 (i32.const 6492) "\1c")
 (data $95.1 (i32.const 6504) "\02\00\00\00\n\00\00\00t\00i\00c\00k\00:")
 (data $96 (i32.const 6524) "\8c")
 (data $96.1 (i32.const 6536) "\02\00\00\00n\00\00\00c\00a\00n\00\'\00t\00 \00d\00e\00s\00e\00r\00i\00a\00l\00i\00z\00e\00 \00u\003\002\00 \00f\00r\00o\00m\00 \00g\00i\00v\00e\00n\00 \00a\00r\00g\00u\00m\00e\00n\00t\00:\00 \00o\00u\00t\00 \00o\00f\00 \00r\00a\00n\00g\00e")
 (data $97 (i32.const 6668) "\8c")
 (data $97.1 (i32.const 6680) "\02\00\00\00t\00\00\00c\00a\00n\00\'\00t\00 \00d\00e\00s\00e\00r\00i\00a\00l\00i\00z\00e\00 \00s\00t\00r\00i\00n\00g\00 \00f\00r\00o\00m\00 \00g\00i\00v\00e\00n\00 \00a\00r\00g\00u\00m\00e\00n\00t\00:\00 \00o\00u\00t\00 \00o\00f\00 \00r\00a\00n\00g\00e")
 (data $98 (i32.const 6812) ",")
 (data $98.1 (i32.const 6824) "\02\00\00\00\0e\00\00\00a\00d\00d\00r\00e\00s\00s")
 (data $99 (i32.const 6860) "\1c\00\00\00\03\00\00\00\00\00\00\00\0f\00\00\00\0c\00\00\00\00\00\00\00\10\0c")
 (data $100 (i32.const 6892) "\1c\00\00\00\03\00\00\00\00\00\00\00\0f\00\00\00\0c\00\00\00\00\00\00\00\10\0c")
 (data $101 (i32.const 6924) "\1c\00\00\00\03\00\00\00\00\00\00\00\0f\00\00\00\0c\00\00\00\00\00\00\00\10\0c")
 (data $102 (i32.const 6956) "\1c")
 (data $102.1 (i32.const 6968) "\02\00\00\00\08\00\00\00n\00o\00n\00e")
 (data $103 (i32.const 6988) "\1c")
 (data $103.1 (i32.const 7000) "\02\00\00\00\n\00\00\00i\00n\00d\00e\00x")
 (data $104 (i32.const 7020) "\1c\00\00\00\03\00\00\00\00\00\00\00\0f\00\00\00\0c\00\00\00\00\00\00\00\10\0c")
 (data $105 (i32.const 7052) ",")
 (data $105.1 (i32.const 7064) "\02\00\00\00\1a\00\00\00{\00\r\00\n\00 \00 \00 \00 \00\"\00t\00v\00l\00\"\00:")
 (data $106 (i32.const 7100) "<")
 (data $106.1 (i32.const 7112) "\02\00\00\00*\00\00\00,\00\r\00\n\00 \00 \00 \00 \00\"\00t\00o\00t\00a\00l\00S\00h\00a\00r\00e\00s\00\"\00:")
 (data $107 (i32.const 7164) "<")
 (data $107.1 (i32.const 7176) "\02\00\00\00&\00\00\00,\00\r\00\n\00 \00 \00 \00 \00\"\00p\00r\00i\00z\00e\00P\00o\00o\00l\00\"\00:")
 (data $108 (i32.const 7228) "<")
 (data $108.1 (i32.const 7240) "\02\00\00\00,\00\00\00,\00\r\00\n\00 \00 \00 \00 \00\"\00p\00a\00r\00t\00i\00c\00i\00p\00a\00n\00t\00s\00\"\00:")
 (data $109 (i32.const 7292) "L")
 (data $109.1 (i32.const 7304) "\02\00\00\000\00\00\00,\00\r\00\n\00 \00 \00 \00 \00\"\00n\00e\00x\00t\00D\00r\00a\00w\00P\00e\00r\00i\00o\00d\00\"\00:")
 (data $110 (i32.const 7372) "L")
 (data $110.1 (i32.const 7384) "\02\00\00\000\00\00\00,\00\r\00\n\00 \00 \00 \00 \00\"\00l\00a\00s\00t\00D\00r\00a\00w\00P\00e\00r\00i\00o\00d\00\"\00:")
 (data $111 (i32.const 7452) "<")
 (data $111.1 (i32.const 7464) "\02\00\00\00*\00\00\00,\00\r\00\n\00 \00 \00 \00 \00\"\00w\00i\00n\00n\00e\00r\00C\00o\00u\00n\00t\00\"\00:")
 (data $112 (i32.const 7516) "|\01")
 (data $112.1 (i32.const 7528) "\02\00\00\00d\01\00\00,\00\r\00\n\00 \00 \00 \00 \00\"\00d\00r\00a\00w\00P\00e\00r\00i\00o\00d\00s\00\"\00:\00\"\005\004\000\000\00\"\00,\00\r\00\n\00 \00 \00 \00 \00\"\00t\00i\00c\00k\00P\00e\00r\00i\00o\00d\00s\00\"\00:\00\"\002\002\005\00\"\00,\00\r\00\n\00 \00 \00 \00 \00\"\00m\00i\00n\00P\00r\00i\00z\00e\00T\00h\00r\00e\00s\00h\00o\00l\00d\00\"\00:\00\"\001\000\000\000\000\000\000\000\000\00\"\00,\00\r\00\n\00 \00 \00 \00 \00\"\00c\00o\00n\00t\00r\00a\00c\00t\00V\00e\00r\00s\00i\00o\00n\00\"\00:\00\"\002\00.\000\00-\00t\00i\00e\00r\00s\00\"\00,\00\r\00\n\00 \00 \00 \00 \00\"\00p\00r\00o\00p\00o\00s\00a\00l\00C\00o\00u\00n\00t\00\"\00:\00\"\000\00\"\00,\00\r\00\n\00 \00 \00 \00 \00\"\00c\00o\00n\00s\00e\00r\00v\00a\00t\00i\00v\00e\00T\00V\00L\00\"\00:")
 (data $113 (i32.const 7900) "<")
 (data $113.1 (i32.const 7912) "\02\00\00\00*\00\00\00,\00\r\00\n\00 \00 \00 \00 \00\"\00m\00o\00d\00e\00r\00a\00t\00e\00T\00V\00L\00\"\00:")
 (data $114 (i32.const 7964) "L")
 (data $114.1 (i32.const 7976) "\02\00\00\00.\00\00\00,\00\r\00\n\00 \00 \00 \00 \00\"\00a\00g\00g\00r\00e\00s\00s\00i\00v\00e\00T\00V\00L\00\"\00:")
 (data $115 (i32.const 8044) "L")
 (data $115.1 (i32.const 8056) "\02\00\00\00:\00\00\00,\00\r\00\n\00 \00 \00 \00 \00\"\00c\00o\00n\00s\00e\00r\00v\00a\00t\00i\00v\00e\00T\00i\00c\00k\00e\00t\00s\00\"\00:")
 (data $116 (i32.const 8124) "L")
 (data $116.1 (i32.const 8136) "\02\00\00\002\00\00\00,\00\r\00\n\00 \00 \00 \00 \00\"\00m\00o\00d\00e\00r\00a\00t\00e\00T\00i\00c\00k\00e\00t\00s\00\"\00:")
 (data $117 (i32.const 8204) "L")
 (data $117.1 (i32.const 8216) "\02\00\00\006\00\00\00,\00\r\00\n\00 \00 \00 \00 \00\"\00a\00g\00g\00r\00e\00s\00s\00i\00v\00e\00T\00i\00c\00k\00e\00t\00s\00\"\00:")
 (data $118 (i32.const 8284) "\1c")
 (data $118.1 (i32.const 8296) "\02\00\00\00\n\00\00\00\r\00\n\00 \00 \00}")
 (data $119 (i32.const 8316) "|\00\00\00\03\00\00\00\00\00\00\00\0f\00\00\00l\00\00\00\a0\1b\00\00\00\00\00\00\d0\1b\00\00\00\00\00\00\10\1c\00\00\00\00\00\00P\1c\00\00\00\00\00\00\90\1c\00\00\00\00\00\00\e0\1c\00\00\00\00\00\000\1d\00\00\00\00\00\00p\1d\00\00\00\00\00\00\f0\1e\00\00\00\00\00\000\1f\00\00\00\00\00\00\80\1f\00\00\00\00\00\00\d0\1f\00\00\00\00\00\00  \00\00\00\00\00\00p ")
 (data $120 (i32.const 8444) "<")
 (data $120.1 (i32.const 8456) "\02\00\00\00 \00\00\00{\00\r\00\n\00 \00 \00 \00 \00\"\00s\00h\00a\00r\00e\00s\00\"\00:")
 (data $121 (i32.const 8508) "<")
 (data $121.1 (i32.const 8520) "\02\00\00\00&\00\00\00,\00\r\00\n\00 \00 \00 \00 \00\"\00p\00r\00i\00n\00c\00i\00p\00a\00l\00\"\00:")
 (data $122 (i32.const 8572) "<")
 (data $122.1 (i32.const 8584) "\02\00\00\00\1e\00\00\00,\00\r\00\n\00 \00 \00 \00 \00\"\00t\00i\00e\00r\00\"\00:\00\"")
 (data $123 (i32.const 8636) "<")
 (data $123.1 (i32.const 8648) "\02\00\00\00*\00\00\00\"\00,\00\r\00\n\00 \00 \00 \00 \00\"\00h\00a\00s\00D\00e\00p\00o\00s\00i\00t\00\"\00:")
 (data $124 (i32.const 8700) "<\00\00\00\03\00\00\00\00\00\00\00\0f\00\00\00$\00\00\00\10!\00\00\00\00\00\00P!\00\00\00\00\00\00\90!\00\00\00\00\00\00\d0!\00\00\00\00\00\00p ")
 (data $125 (i32.const 8764) "\1c")
 (data $125.1 (i32.const 8776) "\02\00\00\00\08\00\00\00t\00r\00u\00e")
 (data $126 (i32.const 8796) "\1c")
 (data $126.1 (i32.const 8808) "\02\00\00\00\n\00\00\00f\00a\00l\00s\00e")
 (data $127 (i32.const 8828) "\1c")
 (data $127.1 (i32.const 8840) "\01")
 (data $128 (i32.const 8860) "L")
 (data $128.1 (i32.const 8872) "\02\00\00\00.\00\00\00{\00\r\00\n\00 \00 \00 \00 \00 \00 \00 \00 \00 \00 \00\"\00p\00e\00r\00i\00o\00d\00\"\00:\00\"")
 (data $129 (i32.const 8940) "L")
 (data $129.1 (i32.const 8952) "\02\00\00\002\00\00\00\"\00,\00\r\00\n\00 \00 \00 \00 \00 \00 \00 \00 \00 \00 \00\"\00a\00d\00d\00r\00e\00s\00s\00\"\00:\00\"")
 (data $130 (i32.const 9020) "L")
 (data $130.1 (i32.const 9032) "\02\00\00\00.\00\00\00\"\00,\00\r\00\n\00 \00 \00 \00 \00 \00 \00 \00 \00 \00 \00\"\00p\00r\00i\00z\00e\00\"\00:\00\"")
 (data $131 (i32.const 9100) "<")
 (data $131.1 (i32.const 9112) "\02\00\00\00,\00\00\00\"\00,\00\r\00\n\00 \00 \00 \00 \00 \00 \00 \00 \00 \00 \00\"\00s\00e\00e\00d\00\"\00:\00\"")
 (data $132 (i32.const 9164) "L")
 (data $132.1 (i32.const 9176) "\02\00\00\004\00\00\00\"\00,\00\r\00\n\00 \00 \00 \00 \00 \00 \00 \00 \00 \00 \00\"\00t\00i\00m\00e\00s\00t\00a\00m\00p\00\"\00:")
 (data $133 (i32.const 9244) ",")
 (data $133.1 (i32.const 9256) "\02\00\00\00\16\00\00\00\r\00\n\00 \00 \00 \00 \00 \00 \00 \00 \00}")
 (data $134 (i32.const 9292) "<\00\00\00\03\00\00\00\00\00\00\00\0f\00\00\00,\00\00\00\b0\"\00\00\00\00\00\00\00#\00\00\00\00\00\00P#\00\00\00\00\00\00\a0#\00\00\00\00\00\00\e0#\00\00\00\00\00\000$")
 (data $135 (i32.const 9356) "\1c")
 (data $135.1 (i32.const 9368) "\02\00\00\00\02\00\00\00[")
 (data $136 (i32.const 9388) "\1c")
 (data $136.1 (i32.const 9400) "\02\00\00\00\02\00\00\00]")
 (data $137 (i32.const 9420) "<")
 (data $137.1 (i32.const 9432) "\02\00\00\00*\00\00\00O\00b\00j\00e\00c\00t\00 \00a\00l\00r\00e\00a\00d\00y\00 \00p\00i\00n\00n\00e\00d")
 (data $138 (i32.const 9484) "<")
 (data $138.1 (i32.const 9496) "\02\00\00\00(\00\00\00O\00b\00j\00e\00c\00t\00 \00i\00s\00 \00n\00o\00t\00 \00p\00i\00n\00n\00e\00d")
 (data $139 (i32.const 9552) "\14\00\00\00 \00\00\00 \00\00\00 ")
 (data $139.1 (i32.const 9576) "d\00\00\00\02\01\00\00\00\00\00\00 \00\00\00\02A\00\00\02A\00\00\02\t")
 (data $139.2 (i32.const 9612) "B\00\00\00\04A\00\00 \00\00\00A")
 (table $0 2 2 funcref)
 (elem $0 (i32.const 1) $~lib/@massalabs/massa-as-sdk/assembly/std/utils/address/json2Address~anonymous|0)
 (export "seedScheduler" (func $assembly/contracts/main/seedScheduler))
 (export "addToPrizePool" (func $assembly/contracts/main/addToPrizePool))
 (export "depositConservative" (func $assembly/contracts/main/depositConservative))
 (export "depositModerate" (func $assembly/contracts/main/depositModerate))
 (export "depositAggressive" (func $assembly/contracts/main/depositAggressive))
 (export "tick" (func $assembly/contracts/main/tick))
 (export "manualDraw" (func $assembly/contracts/main/manualDraw))
 (export "getTVL" (func $assembly/contracts/main/getTVL))
 (export "getConservativeTVL" (func $assembly/contracts/main/getConservativeTVL))
 (export "getModerateTVL" (func $assembly/contracts/main/getModerateTVL))
 (export "getAggressiveTVL" (func $assembly/contracts/main/getAggressiveTVL))
 (export "getTotalTickets" (func $assembly/contracts/main/getTotalTickets))
 (export "getConservativeTickets" (func $assembly/contracts/main/getConservativeTickets))
 (export "getModerateTickets" (func $assembly/contracts/main/getModerateTickets))
 (export "getAggressiveTickets" (func $assembly/contracts/main/getAggressiveTickets))
 (export "getPrizePool" (func $assembly/contracts/main/getPrizePool))
 (export "getParticipantCount" (func $assembly/contracts/main/getParticipantCount))
 (export "getNextDrawPeriod" (func $assembly/contracts/main/getNextDrawPeriod))
 (export "getWinnerCount" (func $assembly/contracts/main/getWinnerCount))
 (export "getVaultStats" (func $assembly/contracts/main/getVaultStats))
 (export "__new" (func $~lib/rt/itcms/__new))
 (export "__pin" (func $~lib/rt/itcms/__pin))
 (export "__unpin" (func $~lib/rt/itcms/__unpin))
 (export "__collect" (func $~lib/rt/itcms/__collect))
 (export "__rtti_base" (global $~lib/rt/__rtti_base))
 (export "memory" (memory $0))
 (export "constructor" (func $export:assembly/contracts/main/constructor))
 (export "withdraw" (func $export:assembly/contracts/main/withdraw))
 (export "getUserPrincipal" (func $export:assembly/contracts/main/getUserPrincipal))
 (export "getUserTickets" (func $export:assembly/contracts/main/getUserTickets))
 (export "getUserTier" (func $export:assembly/contracts/main/getUserTier))
 (export "getWinner" (func $export:assembly/contracts/main/getWinner))
 (export "getUserPosition" (func $export:assembly/contracts/main/getUserPosition))
 (export "getWinners" (func $export:assembly/contracts/main/getWinners))
 (start $~start)
 (func $~lib/rt/itcms/Object#get:color (param $0 i32) (result i32)
  local.get $0
  i32.load offset=4
  i32.const 3
  i32.and
 )
 (func $~lib/rt/itcms/Object#get:next (param $0 i32) (result i32)
  local.get $0
  i32.load offset=4
  i32.const -4
  i32.and
 )
 (func $~lib/rt/itcms/Object#set:prev (param $0 i32) (param $1 i32)
  local.get $0
  local.get $1
  i32.store offset=8
 )
 (func $~lib/rt/itcms/Object#set:nextWithColor (param $0 i32) (param $1 i32)
  local.get $0
  local.get $1
  i32.store offset=4
 )
 (func $~lib/rt/itcms/Object#set:next (param $0 i32) (param $1 i32)
  local.get $0
  local.get $1
  local.get $0
  i32.load offset=4
  i32.const 3
  i32.and
  i32.or
  call $~lib/rt/itcms/Object#set:nextWithColor
 )
 (func $~lib/rt/itcms/Object#unlink (param $0 i32)
  (local $1 i32)
  local.get $0
  call $~lib/rt/itcms/Object#get:next
  local.tee $1
  i32.eqz
  if
   local.get $0
   i32.load offset=8
   i32.eqz
   local.get $0
   i32.const 42404
   i32.lt_u
   i32.and
   i32.eqz
   if
    i32.const 0
    i32.const 1056
    i32.const 128
    i32.const 18
    call $~lib/builtins/abort
    unreachable
   end
   return
  end
  local.get $0
  i32.load offset=8
  local.tee $0
  i32.eqz
  if
   i32.const 0
   i32.const 1056
   i32.const 132
   i32.const 16
   call $~lib/builtins/abort
   unreachable
  end
  local.get $1
  local.get $0
  call $~lib/rt/itcms/Object#set:prev
  local.get $0
  local.get $1
  call $~lib/rt/itcms/Object#set:next
 )
 (func $~lib/rt/itcms/initLazy (param $0 i32) (result i32)
  local.get $0
  local.get $0
  call $~lib/rt/itcms/Object#set:nextWithColor
  local.get $0
  local.get $0
  call $~lib/rt/itcms/Object#set:prev
  local.get $0
 )
 (func $~lib/rt/itcms/Object#linkTo (param $0 i32) (param $1 i32) (param $2 i32)
  (local $3 i32)
  local.get $1
  i32.load offset=8
  local.set $3
  local.get $0
  local.get $1
  local.get $2
  i32.or
  call $~lib/rt/itcms/Object#set:nextWithColor
  local.get $0
  local.get $3
  call $~lib/rt/itcms/Object#set:prev
  local.get $3
  local.get $0
  call $~lib/rt/itcms/Object#set:next
  local.get $1
  local.get $0
  call $~lib/rt/itcms/Object#set:prev
 )
 (func $~lib/rt/itcms/Object#makeGray (param $0 i32)
  (local $1 i32)
  (local $2 i32)
  local.get $0
  global.get $~lib/rt/itcms/iter
  i32.eq
  if
   local.get $0
   i32.load offset=8
   local.tee $1
   i32.eqz
   if
    i32.const 0
    i32.const 1056
    i32.const 148
    i32.const 30
    call $~lib/builtins/abort
    unreachable
   end
   local.get $1
   global.set $~lib/rt/itcms/iter
  end
  local.get $0
  call $~lib/rt/itcms/Object#unlink
  global.get $~lib/rt/itcms/toSpace
  local.set $1
  local.get $0
  i32.load offset=12
  local.tee $2
  i32.const 2
  i32.le_u
  if (result i32)
   i32.const 1
  else
   local.get $2
   i32.const 9552
   i32.load
   i32.gt_u
   if
    i32.const 1152
    i32.const 1216
    i32.const 21
    i32.const 28
    call $~lib/builtins/abort
    unreachable
   end
   local.get $2
   i32.const 2
   i32.shl
   i32.const 9556
   i32.add
   i32.load
   i32.const 32
   i32.and
  end
  local.set $2
  local.get $0
  local.get $1
  global.get $~lib/rt/itcms/white
  i32.eqz
  i32.const 2
  local.get $2
  select
  call $~lib/rt/itcms/Object#linkTo
 )
 (func $~lib/rt/itcms/__link (param $0 i32) (param $1 i32) (param $2 i32)
  (local $3 i32)
  local.get $1
  i32.eqz
  if
   return
  end
  local.get $0
  i32.eqz
  if
   i32.const 0
   i32.const 1056
   i32.const 295
   i32.const 14
   call $~lib/builtins/abort
   unreachable
  end
  local.get $1
  i32.const 20
  i32.sub
  local.tee $1
  call $~lib/rt/itcms/Object#get:color
  global.get $~lib/rt/itcms/white
  i32.eq
  if
   local.get $0
   i32.const 20
   i32.sub
   local.tee $0
   call $~lib/rt/itcms/Object#get:color
   local.tee $3
   global.get $~lib/rt/itcms/white
   i32.eqz
   i32.eq
   if
    local.get $0
    local.get $1
    local.get $2
    select
    call $~lib/rt/itcms/Object#makeGray
   else
    global.get $~lib/rt/itcms/state
    i32.const 1
    i32.eq
    local.get $3
    i32.const 3
    i32.eq
    i32.and
    if
     local.get $1
     call $~lib/rt/itcms/Object#makeGray
    end
   end
  end
 )
 (func $~lib/@massalabs/as-types/assembly/argument/Args#set:serialized (param $0 i32) (param $1 i32)
  local.get $0
  local.get $1
  i32.store offset=4
  local.get $0
  local.get $1
  i32.const 0
  call $~lib/rt/itcms/__link
 )
 (func $~lib/@massalabs/as-types/assembly/argument/Args#set:_offset (param $0 i32) (param $1 i32)
  local.get $0
  local.get $1
  i32.store
 )
 (func $~lib/rt/itcms/visitRoots
  (local $0 i32)
  (local $1 i32)
  i32.const 1744
  call $~lib/rt/itcms/__visit
  i32.const 1792
  call $~lib/rt/itcms/__visit
  i32.const 1856
  call $~lib/rt/itcms/__visit
  i32.const 1904
  call $~lib/rt/itcms/__visit
  i32.const 1952
  call $~lib/rt/itcms/__visit
  i32.const 2016
  call $~lib/rt/itcms/__visit
  i32.const 2064
  call $~lib/rt/itcms/__visit
  i32.const 2128
  call $~lib/rt/itcms/__visit
  i32.const 2176
  call $~lib/rt/itcms/__visit
  i32.const 2240
  call $~lib/rt/itcms/__visit
  i32.const 2304
  call $~lib/rt/itcms/__visit
  i32.const 2352
  call $~lib/rt/itcms/__visit
  i32.const 2400
  call $~lib/rt/itcms/__visit
  i32.const 2464
  call $~lib/rt/itcms/__visit
  i32.const 2528
  call $~lib/rt/itcms/__visit
  i32.const 1152
  call $~lib/rt/itcms/__visit
  i32.const 1456
  call $~lib/rt/itcms/__visit
  i32.const 2736
  call $~lib/rt/itcms/__visit
  i32.const 1264
  call $~lib/rt/itcms/__visit
  i32.const 9440
  call $~lib/rt/itcms/__visit
  i32.const 9504
  call $~lib/rt/itcms/__visit
  i32.const 3776
  call $~lib/rt/itcms/__visit
  i32.const 3648
  call $~lib/rt/itcms/__visit
  global.get $~lib/@massalabs/as-types/assembly/argument/NoArg
  local.tee $0
  if
   local.get $0
   call $~lib/rt/itcms/__visit
  end
  i32.const 1712
  call $~lib/rt/itcms/__visit
  i32.const 1600
  call $~lib/rt/itcms/__visit
  global.get $~lib/rt/itcms/pinSpace
  local.tee $1
  call $~lib/rt/itcms/Object#get:next
  local.set $0
  loop $while-continue|0
   local.get $0
   local.get $1
   i32.ne
   if
    local.get $0
    call $~lib/rt/itcms/Object#get:color
    i32.const 3
    i32.ne
    if
     i32.const 0
     i32.const 1056
     i32.const 160
     i32.const 16
     call $~lib/builtins/abort
     unreachable
    end
    local.get $0
    i32.const 20
    i32.add
    call $~lib/rt/__visit_members
    local.get $0
    call $~lib/rt/itcms/Object#get:next
    local.set $0
    br $while-continue|0
   end
  end
 )
 (func $~lib/rt/itcms/Object#set:color (param $0 i32) (param $1 i32)
  local.get $0
  local.get $0
  i32.load offset=4
  i32.const -4
  i32.and
  local.get $1
  i32.or
  call $~lib/rt/itcms/Object#set:nextWithColor
 )
 (func $~lib/rt/itcms/__visit (param $0 i32)
  local.get $0
  i32.eqz
  if
   return
  end
  local.get $0
  i32.const 20
  i32.sub
  local.tee $0
  call $~lib/rt/itcms/Object#get:color
  global.get $~lib/rt/itcms/white
  i32.eq
  if
   local.get $0
   call $~lib/rt/itcms/Object#makeGray
   global.get $~lib/rt/itcms/visitCount
   i32.const 1
   i32.add
   global.set $~lib/rt/itcms/visitCount
  end
 )
 (func $~lib/rt/itcms/Object#get:size (param $0 i32) (result i32)
  local.get $0
  i32.load
  i32.const -4
  i32.and
  i32.const 4
  i32.add
 )
 (func $~lib/rt/tlsf/removeBlock (param $0 i32) (param $1 i32)
  (local $2 i32)
  (local $3 i32)
  (local $4 i32)
  (local $5 i32)
  local.get $1
  i32.load
  local.tee $3
  i32.const 1
  i32.and
  i32.eqz
  if
   i32.const 0
   i32.const 1392
   i32.const 268
   i32.const 14
   call $~lib/builtins/abort
   unreachable
  end
  local.get $3
  i32.const -4
  i32.and
  local.tee $3
  i32.const 12
  i32.lt_u
  if
   i32.const 0
   i32.const 1392
   i32.const 270
   i32.const 14
   call $~lib/builtins/abort
   unreachable
  end
  local.get $3
  i32.const 256
  i32.lt_u
  if (result i32)
   local.get $3
   i32.const 4
   i32.shr_u
  else
   i32.const 31
   i32.const 1073741820
   local.get $3
   local.get $3
   i32.const 1073741820
   i32.ge_u
   select
   local.tee $3
   i32.clz
   i32.sub
   local.tee $4
   i32.const 7
   i32.sub
   local.set $2
   local.get $3
   local.get $4
   i32.const 4
   i32.sub
   i32.shr_u
   i32.const 16
   i32.xor
  end
  local.tee $4
  i32.const 16
  i32.lt_u
  local.get $2
  i32.const 23
  i32.lt_u
  i32.and
  i32.eqz
  if
   i32.const 0
   i32.const 1392
   i32.const 284
   i32.const 14
   call $~lib/builtins/abort
   unreachable
  end
  local.get $1
  i32.load offset=8
  local.set $5
  local.get $1
  i32.load offset=4
  local.tee $3
  if
   local.get $3
   local.get $5
   call $~lib/rt/itcms/Object#set:prev
  end
  local.get $5
  if
   local.get $5
   local.get $3
   call $~lib/rt/itcms/Object#set:nextWithColor
  end
  local.get $1
  local.get $0
  local.get $2
  i32.const 4
  i32.shl
  local.get $4
  i32.add
  i32.const 2
  i32.shl
  i32.add
  local.tee $1
  i32.load offset=96
  i32.eq
  if
   local.get $1
   local.get $5
   i32.store offset=96
   local.get $5
   i32.eqz
   if
    local.get $0
    local.get $2
    i32.const 2
    i32.shl
    i32.add
    local.tee $1
    i32.load offset=4
    i32.const -2
    local.get $4
    i32.rotl
    i32.and
    local.set $3
    local.get $1
    local.get $3
    i32.store offset=4
    local.get $3
    i32.eqz
    if
     local.get $0
     local.get $0
     i32.load
     i32.const -2
     local.get $2
     i32.rotl
     i32.and
     call $~lib/@massalabs/as-types/assembly/argument/Args#set:_offset
    end
   end
  end
 )
 (func $~lib/rt/tlsf/insertBlock (param $0 i32) (param $1 i32)
  (local $2 i32)
  (local $3 i32)
  (local $4 i32)
  (local $5 i32)
  (local $6 i32)
  local.get $1
  i32.eqz
  if
   i32.const 0
   i32.const 1392
   i32.const 201
   i32.const 14
   call $~lib/builtins/abort
   unreachable
  end
  local.get $1
  i32.load
  local.tee $3
  i32.const 1
  i32.and
  i32.eqz
  if
   i32.const 0
   i32.const 1392
   i32.const 203
   i32.const 14
   call $~lib/builtins/abort
   unreachable
  end
  local.get $1
  i32.const 4
  i32.add
  local.get $1
  i32.load
  i32.const -4
  i32.and
  i32.add
  local.tee $4
  i32.load
  local.tee $2
  i32.const 1
  i32.and
  if
   local.get $0
   local.get $4
   call $~lib/rt/tlsf/removeBlock
   local.get $1
   local.get $3
   i32.const 4
   i32.add
   local.get $2
   i32.const -4
   i32.and
   i32.add
   local.tee $3
   call $~lib/@massalabs/as-types/assembly/argument/Args#set:_offset
   local.get $1
   i32.const 4
   i32.add
   local.get $1
   i32.load
   i32.const -4
   i32.and
   i32.add
   local.tee $4
   i32.load
   local.set $2
  end
  local.get $3
  i32.const 2
  i32.and
  if
   local.get $1
   i32.const 4
   i32.sub
   i32.load
   local.tee $1
   i32.load
   local.tee $6
   i32.const 1
   i32.and
   i32.eqz
   if
    i32.const 0
    i32.const 1392
    i32.const 221
    i32.const 16
    call $~lib/builtins/abort
    unreachable
   end
   local.get $0
   local.get $1
   call $~lib/rt/tlsf/removeBlock
   local.get $1
   local.get $6
   i32.const 4
   i32.add
   local.get $3
   i32.const -4
   i32.and
   i32.add
   local.tee $3
   call $~lib/@massalabs/as-types/assembly/argument/Args#set:_offset
  end
  local.get $4
  local.get $2
  i32.const 2
  i32.or
  call $~lib/@massalabs/as-types/assembly/argument/Args#set:_offset
  local.get $3
  i32.const -4
  i32.and
  local.tee $2
  i32.const 12
  i32.lt_u
  if
   i32.const 0
   i32.const 1392
   i32.const 233
   i32.const 14
   call $~lib/builtins/abort
   unreachable
  end
  local.get $4
  local.get $1
  i32.const 4
  i32.add
  local.get $2
  i32.add
  i32.ne
  if
   i32.const 0
   i32.const 1392
   i32.const 234
   i32.const 14
   call $~lib/builtins/abort
   unreachable
  end
  local.get $4
  i32.const 4
  i32.sub
  local.get $1
  i32.store
  local.get $2
  i32.const 256
  i32.lt_u
  if (result i32)
   local.get $2
   i32.const 4
   i32.shr_u
  else
   i32.const 31
   i32.const 1073741820
   local.get $2
   local.get $2
   i32.const 1073741820
   i32.ge_u
   select
   local.tee $2
   i32.clz
   i32.sub
   local.tee $3
   i32.const 7
   i32.sub
   local.set $5
   local.get $2
   local.get $3
   i32.const 4
   i32.sub
   i32.shr_u
   i32.const 16
   i32.xor
  end
  local.tee $2
  i32.const 16
  i32.lt_u
  local.get $5
  i32.const 23
  i32.lt_u
  i32.and
  i32.eqz
  if
   i32.const 0
   i32.const 1392
   i32.const 251
   i32.const 14
   call $~lib/builtins/abort
   unreachable
  end
  local.get $0
  local.get $5
  i32.const 4
  i32.shl
  local.get $2
  i32.add
  i32.const 2
  i32.shl
  i32.add
  i32.load offset=96
  local.set $3
  local.get $1
  i32.const 0
  call $~lib/rt/itcms/Object#set:nextWithColor
  local.get $1
  local.get $3
  call $~lib/rt/itcms/Object#set:prev
  local.get $3
  if
   local.get $3
   local.get $1
   call $~lib/rt/itcms/Object#set:nextWithColor
  end
  local.get $0
  local.get $5
  i32.const 4
  i32.shl
  local.get $2
  i32.add
  i32.const 2
  i32.shl
  i32.add
  local.get $1
  i32.store offset=96
  local.get $0
  local.get $0
  i32.load
  i32.const 1
  local.get $5
  i32.shl
  i32.or
  call $~lib/@massalabs/as-types/assembly/argument/Args#set:_offset
  local.get $0
  local.get $5
  i32.const 2
  i32.shl
  i32.add
  local.tee $0
  local.get $0
  i32.load offset=4
  i32.const 1
  local.get $2
  i32.shl
  i32.or
  i32.store offset=4
 )
 (func $~lib/rt/tlsf/addMemory (param $0 i32) (param $1 i32) (param $2 i64)
  (local $3 i32)
  (local $4 i32)
  (local $5 i32)
  local.get $2
  local.get $1
  i64.extend_i32_u
  i64.lt_u
  if
   i32.const 0
   i32.const 1392
   i32.const 382
   i32.const 14
   call $~lib/builtins/abort
   unreachable
  end
  local.get $1
  i32.const 19
  i32.add
  i32.const -16
  i32.and
  i32.const 4
  i32.sub
  local.set $1
  local.get $0
  i32.load offset=1568
  local.tee $3
  if
   local.get $3
   i32.const 4
   i32.add
   local.get $1
   i32.gt_u
   if
    i32.const 0
    i32.const 1392
    i32.const 389
    i32.const 16
    call $~lib/builtins/abort
    unreachable
   end
   local.get $1
   i32.const 16
   i32.sub
   local.tee $5
   local.get $3
   i32.eq
   if
    local.get $3
    i32.load
    local.set $4
    local.get $5
    local.set $1
   end
  else
   local.get $0
   i32.const 1572
   i32.add
   local.get $1
   i32.gt_u
   if
    i32.const 0
    i32.const 1392
    i32.const 402
    i32.const 5
    call $~lib/builtins/abort
    unreachable
   end
  end
  local.get $2
  i32.wrap_i64
  i32.const -16
  i32.and
  local.get $1
  i32.sub
  local.tee $3
  i32.const 20
  i32.lt_u
  if
   return
  end
  local.get $1
  local.get $4
  i32.const 2
  i32.and
  local.get $3
  i32.const 8
  i32.sub
  local.tee $3
  i32.const 1
  i32.or
  i32.or
  call $~lib/@massalabs/as-types/assembly/argument/Args#set:_offset
  local.get $1
  i32.const 0
  call $~lib/rt/itcms/Object#set:nextWithColor
  local.get $1
  i32.const 0
  call $~lib/rt/itcms/Object#set:prev
  local.get $1
  i32.const 4
  i32.add
  local.get $3
  i32.add
  local.tee $3
  i32.const 2
  call $~lib/@massalabs/as-types/assembly/argument/Args#set:_offset
  local.get $0
  local.get $3
  i32.store offset=1568
  local.get $0
  local.get $1
  call $~lib/rt/tlsf/insertBlock
 )
 (func $~lib/rt/tlsf/initialize
  (local $0 i32)
  (local $1 i32)
  memory.size
  local.tee $0
  i32.const 0
  i32.le_s
  if (result i32)
   i32.const 1
   local.get $0
   i32.sub
   memory.grow
   i32.const 0
   i32.lt_s
  else
   i32.const 0
  end
  if
   unreachable
  end
  i32.const 42416
  i32.const 0
  call $~lib/@massalabs/as-types/assembly/argument/Args#set:_offset
  i32.const 43984
  i32.const 0
  i32.store
  loop $for-loop|0
   local.get $1
   i32.const 23
   i32.lt_u
   if
    local.get $1
    i32.const 2
    i32.shl
    i32.const 42416
    i32.add
    i32.const 0
    i32.store offset=4
    i32.const 0
    local.set $0
    loop $for-loop|1
     local.get $0
     i32.const 16
     i32.lt_u
     if
      local.get $1
      i32.const 4
      i32.shl
      local.get $0
      i32.add
      i32.const 2
      i32.shl
      i32.const 42416
      i32.add
      i32.const 0
      i32.store offset=96
      local.get $0
      i32.const 1
      i32.add
      local.set $0
      br $for-loop|1
     end
    end
    local.get $1
    i32.const 1
    i32.add
    local.set $1
    br $for-loop|0
   end
  end
  i32.const 42416
  i32.const 43988
  memory.size
  i64.extend_i32_s
  i64.const 16
  i64.shl
  call $~lib/rt/tlsf/addMemory
  i32.const 42416
  global.set $~lib/rt/tlsf/ROOT
 )
 (func $~lib/rt/itcms/step (result i32)
  (local $0 i32)
  (local $1 i32)
  (local $2 i32)
  block $break|0
   block $case2|0
    block $case1|0
     block $case0|0
      global.get $~lib/rt/itcms/state
      br_table $case0|0 $case1|0 $case2|0 $break|0
     end
     i32.const 1
     global.set $~lib/rt/itcms/state
     i32.const 0
     global.set $~lib/rt/itcms/visitCount
     call $~lib/rt/itcms/visitRoots
     global.get $~lib/rt/itcms/toSpace
     global.set $~lib/rt/itcms/iter
     global.get $~lib/rt/itcms/visitCount
     return
    end
    global.get $~lib/rt/itcms/white
    i32.eqz
    local.set $1
    global.get $~lib/rt/itcms/iter
    call $~lib/rt/itcms/Object#get:next
    local.set $0
    loop $while-continue|1
     local.get $0
     global.get $~lib/rt/itcms/toSpace
     i32.ne
     if
      local.get $0
      global.set $~lib/rt/itcms/iter
      local.get $0
      call $~lib/rt/itcms/Object#get:color
      local.get $1
      i32.ne
      if
       local.get $0
       local.get $1
       call $~lib/rt/itcms/Object#set:color
       i32.const 0
       global.set $~lib/rt/itcms/visitCount
       local.get $0
       i32.const 20
       i32.add
       call $~lib/rt/__visit_members
       global.get $~lib/rt/itcms/visitCount
       return
      end
      local.get $0
      call $~lib/rt/itcms/Object#get:next
      local.set $0
      br $while-continue|1
     end
    end
    i32.const 0
    global.set $~lib/rt/itcms/visitCount
    call $~lib/rt/itcms/visitRoots
    global.get $~lib/rt/itcms/iter
    call $~lib/rt/itcms/Object#get:next
    global.get $~lib/rt/itcms/toSpace
    i32.eq
    if
     global.get $~lib/memory/__stack_pointer
     local.set $0
     loop $while-continue|0
      local.get $0
      i32.const 42404
      i32.lt_u
      if
       local.get $0
       i32.load
       call $~lib/rt/itcms/__visit
       local.get $0
       i32.const 4
       i32.add
       local.set $0
       br $while-continue|0
      end
     end
     global.get $~lib/rt/itcms/iter
     call $~lib/rt/itcms/Object#get:next
     local.set $0
     loop $while-continue|2
      local.get $0
      global.get $~lib/rt/itcms/toSpace
      i32.ne
      if
       local.get $0
       call $~lib/rt/itcms/Object#get:color
       local.get $1
       i32.ne
       if
        local.get $0
        local.get $1
        call $~lib/rt/itcms/Object#set:color
        local.get $0
        i32.const 20
        i32.add
        call $~lib/rt/__visit_members
       end
       local.get $0
       call $~lib/rt/itcms/Object#get:next
       local.set $0
       br $while-continue|2
      end
     end
     global.get $~lib/rt/itcms/fromSpace
     local.set $0
     global.get $~lib/rt/itcms/toSpace
     global.set $~lib/rt/itcms/fromSpace
     local.get $0
     global.set $~lib/rt/itcms/toSpace
     local.get $1
     global.set $~lib/rt/itcms/white
     local.get $0
     call $~lib/rt/itcms/Object#get:next
     global.set $~lib/rt/itcms/iter
     i32.const 2
     global.set $~lib/rt/itcms/state
    end
    global.get $~lib/rt/itcms/visitCount
    return
   end
   global.get $~lib/rt/itcms/iter
   local.tee $0
   global.get $~lib/rt/itcms/toSpace
   i32.ne
   if
    local.get $0
    call $~lib/rt/itcms/Object#get:next
    global.set $~lib/rt/itcms/iter
    local.get $0
    call $~lib/rt/itcms/Object#get:color
    global.get $~lib/rt/itcms/white
    i32.eqz
    i32.ne
    if
     i32.const 0
     i32.const 1056
     i32.const 229
     i32.const 20
     call $~lib/builtins/abort
     unreachable
    end
    local.get $0
    i32.const 42404
    i32.lt_u
    if
     local.get $0
     i32.const 0
     call $~lib/rt/itcms/Object#set:nextWithColor
     local.get $0
     i32.const 0
     call $~lib/rt/itcms/Object#set:prev
    else
     global.get $~lib/rt/itcms/total
     local.get $0
     call $~lib/rt/itcms/Object#get:size
     i32.sub
     global.set $~lib/rt/itcms/total
     local.get $0
     i32.const 4
     i32.add
     local.tee $1
     i32.const 42404
     i32.ge_u
     if
      global.get $~lib/rt/tlsf/ROOT
      i32.eqz
      if
       call $~lib/rt/tlsf/initialize
      end
      global.get $~lib/rt/tlsf/ROOT
      local.set $2
      local.get $1
      i32.const 4
      i32.sub
      local.set $0
      local.get $1
      i32.const 15
      i32.and
      i32.const 1
      local.get $1
      select
      if (result i32)
       i32.const 1
      else
       local.get $0
       i32.load
       i32.const 1
       i32.and
      end
      if
       i32.const 0
       i32.const 1392
       i32.const 562
       i32.const 3
       call $~lib/builtins/abort
       unreachable
      end
      local.get $0
      local.get $0
      i32.load
      i32.const 1
      i32.or
      call $~lib/@massalabs/as-types/assembly/argument/Args#set:_offset
      local.get $2
      local.get $0
      call $~lib/rt/tlsf/insertBlock
     end
    end
    i32.const 10
    return
   end
   global.get $~lib/rt/itcms/toSpace
   global.get $~lib/rt/itcms/toSpace
   call $~lib/rt/itcms/Object#set:nextWithColor
   global.get $~lib/rt/itcms/toSpace
   global.get $~lib/rt/itcms/toSpace
   call $~lib/rt/itcms/Object#set:prev
   i32.const 0
   global.set $~lib/rt/itcms/state
  end
  i32.const 0
 )
 (func $~lib/rt/tlsf/roundSize (param $0 i32) (result i32)
  local.get $0
  i32.const 1
  i32.const 27
  local.get $0
  i32.clz
  i32.sub
  i32.shl
  i32.add
  i32.const 1
  i32.sub
  local.get $0
  local.get $0
  i32.const 536870910
  i32.lt_u
  select
 )
 (func $~lib/rt/tlsf/searchBlock (param $0 i32) (param $1 i32) (result i32)
  (local $2 i32)
  (local $3 i32)
  local.get $1
  i32.const 256
  i32.lt_u
  if (result i32)
   local.get $1
   i32.const 4
   i32.shr_u
  else
   i32.const 31
   local.get $1
   call $~lib/rt/tlsf/roundSize
   local.tee $1
   i32.clz
   i32.sub
   local.tee $3
   i32.const 7
   i32.sub
   local.set $2
   local.get $1
   local.get $3
   i32.const 4
   i32.sub
   i32.shr_u
   i32.const 16
   i32.xor
  end
  local.tee $1
  i32.const 16
  i32.lt_u
  local.get $2
  i32.const 23
  i32.lt_u
  i32.and
  i32.eqz
  if
   i32.const 0
   i32.const 1392
   i32.const 334
   i32.const 14
   call $~lib/builtins/abort
   unreachable
  end
  local.get $0
  local.get $2
  i32.const 2
  i32.shl
  i32.add
  i32.load offset=4
  i32.const -1
  local.get $1
  i32.shl
  i32.and
  local.tee $1
  if (result i32)
   local.get $0
   local.get $1
   i32.ctz
   local.get $2
   i32.const 4
   i32.shl
   i32.add
   i32.const 2
   i32.shl
   i32.add
   i32.load offset=96
  else
   local.get $0
   i32.load
   i32.const -1
   local.get $2
   i32.const 1
   i32.add
   i32.shl
   i32.and
   local.tee $1
   if (result i32)
    local.get $0
    local.get $1
    i32.ctz
    local.tee $1
    i32.const 2
    i32.shl
    i32.add
    i32.load offset=4
    local.tee $2
    i32.eqz
    if
     i32.const 0
     i32.const 1392
     i32.const 347
     i32.const 18
     call $~lib/builtins/abort
     unreachable
    end
    local.get $0
    local.get $2
    i32.ctz
    local.get $1
    i32.const 4
    i32.shl
    i32.add
    i32.const 2
    i32.shl
    i32.add
    i32.load offset=96
   else
    i32.const 0
   end
  end
 )
 (func $~lib/rt/tlsf/allocateBlock (param $0 i32) (param $1 i32) (result i32)
  (local $2 i32)
  (local $3 i32)
  (local $4 i32)
  local.get $1
  i32.const 1073741820
  i32.gt_u
  if
   i32.const 1264
   i32.const 1392
   i32.const 461
   i32.const 29
   call $~lib/builtins/abort
   unreachable
  end
  local.get $0
  i32.const 12
  local.get $1
  i32.const 19
  i32.add
  i32.const -16
  i32.and
  i32.const 4
  i32.sub
  local.get $1
  i32.const 12
  i32.le_u
  select
  local.tee $1
  call $~lib/rt/tlsf/searchBlock
  local.tee $2
  i32.eqz
  if
   local.get $1
   i32.const 256
   i32.ge_u
   if (result i32)
    local.get $1
    call $~lib/rt/tlsf/roundSize
   else
    local.get $1
   end
   local.set $2
   memory.size
   local.tee $3
   local.get $2
   i32.const 4
   local.get $0
   i32.load offset=1568
   local.get $3
   i32.const 16
   i32.shl
   i32.const 4
   i32.sub
   i32.ne
   i32.shl
   i32.add
   i32.const 65535
   i32.add
   i32.const -65536
   i32.and
   i32.const 16
   i32.shr_u
   local.tee $2
   local.get $2
   local.get $3
   i32.lt_s
   select
   memory.grow
   i32.const 0
   i32.lt_s
   if
    local.get $2
    memory.grow
    i32.const 0
    i32.lt_s
    if
     unreachable
    end
   end
   local.get $0
   local.get $3
   i32.const 16
   i32.shl
   memory.size
   i64.extend_i32_s
   i64.const 16
   i64.shl
   call $~lib/rt/tlsf/addMemory
   local.get $0
   local.get $1
   call $~lib/rt/tlsf/searchBlock
   local.tee $2
   i32.eqz
   if
    i32.const 0
    i32.const 1392
    i32.const 499
    i32.const 16
    call $~lib/builtins/abort
    unreachable
   end
  end
  local.get $1
  local.get $2
  i32.load
  i32.const -4
  i32.and
  i32.gt_u
  if
   i32.const 0
   i32.const 1392
   i32.const 501
   i32.const 14
   call $~lib/builtins/abort
   unreachable
  end
  local.get $0
  local.get $2
  call $~lib/rt/tlsf/removeBlock
  local.get $2
  i32.load
  local.set $3
  local.get $1
  i32.const 4
  i32.add
  i32.const 15
  i32.and
  if
   i32.const 0
   i32.const 1392
   i32.const 361
   i32.const 14
   call $~lib/builtins/abort
   unreachable
  end
  local.get $3
  i32.const -4
  i32.and
  local.get $1
  i32.sub
  local.tee $4
  i32.const 16
  i32.ge_u
  if
   local.get $2
   local.get $1
   local.get $3
   i32.const 2
   i32.and
   i32.or
   call $~lib/@massalabs/as-types/assembly/argument/Args#set:_offset
   local.get $2
   i32.const 4
   i32.add
   local.get $1
   i32.add
   local.tee $1
   local.get $4
   i32.const 4
   i32.sub
   i32.const 1
   i32.or
   call $~lib/@massalabs/as-types/assembly/argument/Args#set:_offset
   local.get $0
   local.get $1
   call $~lib/rt/tlsf/insertBlock
  else
   local.get $2
   local.get $3
   i32.const -2
   i32.and
   call $~lib/@massalabs/as-types/assembly/argument/Args#set:_offset
   local.get $2
   i32.const 4
   i32.add
   local.get $2
   i32.load
   i32.const -4
   i32.and
   i32.add
   local.tee $0
   local.get $0
   i32.load
   i32.const -3
   i32.and
   call $~lib/@massalabs/as-types/assembly/argument/Args#set:_offset
  end
  local.get $2
 )
 (func $~lib/rt/itcms/Object#set:rtId (param $0 i32) (param $1 i32)
  local.get $0
  local.get $1
  i32.store offset=12
 )
 (func $~lib/rt/itcms/Object#set:rtSize (param $0 i32) (param $1 i32)
  local.get $0
  local.get $1
  i32.store offset=16
 )
 (func $~lib/rt/itcms/__new (param $0 i32) (param $1 i32) (result i32)
  (local $2 i32)
  local.get $0
  i32.const 1073741804
  i32.ge_u
  if
   i32.const 1264
   i32.const 1056
   i32.const 261
   i32.const 31
   call $~lib/builtins/abort
   unreachable
  end
  global.get $~lib/rt/itcms/total
  global.get $~lib/rt/itcms/threshold
  i32.ge_u
  if
   block $__inlined_func$~lib/rt/itcms/interrupt$35
    i32.const 2048
    local.set $2
    loop $do-loop|0
     local.get $2
     call $~lib/rt/itcms/step
     i32.sub
     local.set $2
     global.get $~lib/rt/itcms/state
     i32.eqz
     if
      global.get $~lib/rt/itcms/total
      i64.extend_i32_u
      i64.const 200
      i64.mul
      i64.const 100
      i64.div_u
      i32.wrap_i64
      i32.const 1024
      i32.add
      global.set $~lib/rt/itcms/threshold
      br $__inlined_func$~lib/rt/itcms/interrupt$35
     end
     local.get $2
     i32.const 0
     i32.gt_s
     br_if $do-loop|0
    end
    global.get $~lib/rt/itcms/total
    global.get $~lib/rt/itcms/total
    global.get $~lib/rt/itcms/threshold
    i32.sub
    i32.const 1024
    i32.lt_u
    i32.const 10
    i32.shl
    i32.add
    global.set $~lib/rt/itcms/threshold
   end
  end
  global.get $~lib/rt/tlsf/ROOT
  i32.eqz
  if
   call $~lib/rt/tlsf/initialize
  end
  global.get $~lib/rt/tlsf/ROOT
  local.get $0
  i32.const 16
  i32.add
  call $~lib/rt/tlsf/allocateBlock
  local.tee $2
  local.get $1
  call $~lib/rt/itcms/Object#set:rtId
  local.get $2
  local.get $0
  call $~lib/rt/itcms/Object#set:rtSize
  local.get $2
  global.get $~lib/rt/itcms/fromSpace
  global.get $~lib/rt/itcms/white
  call $~lib/rt/itcms/Object#linkTo
  global.get $~lib/rt/itcms/total
  local.get $2
  call $~lib/rt/itcms/Object#get:size
  i32.add
  global.set $~lib/rt/itcms/total
  local.get $2
  i32.const 20
  i32.add
  local.tee $1
  i32.const 0
  local.get $0
  memory.fill
  local.get $1
 )
 (func $~lib/rt/__newBuffer (param $0 i32) (param $1 i32) (param $2 i32) (result i32)
  local.get $0
  local.get $1
  call $~lib/rt/itcms/__new
  local.set $1
  local.get $2
  if
   local.get $1
   local.get $2
   local.get $0
   memory.copy
  end
  local.get $1
 )
 (func $~lib/string/String#get:length (param $0 i32) (result i32)
  local.get $0
  i32.const 20
  i32.sub
  i32.load offset=16
  i32.const 1
  i32.shr_u
 )
 (func $~lib/rt/itcms/__renew (param $0 i32) (param $1 i32) (result i32)
  (local $2 i32)
  (local $3 i32)
  local.get $1
  local.get $0
  i32.const 20
  i32.sub
  local.tee $3
  i32.load
  i32.const -4
  i32.and
  i32.const 16
  i32.sub
  i32.le_u
  if
   local.get $3
   local.get $1
   call $~lib/rt/itcms/Object#set:rtSize
   local.get $0
   return
  end
  local.get $1
  local.get $3
  i32.load offset=12
  call $~lib/rt/itcms/__new
  local.tee $2
  local.get $0
  local.get $1
  local.get $3
  i32.load offset=16
  local.tee $0
  local.get $0
  local.get $1
  i32.gt_u
  select
  memory.copy
  local.get $2
 )
 (func $~lib/util/string/compareImpl (param $0 i32) (param $1 i32) (param $2 i32) (param $3 i32) (result i32)
  (local $4 i32)
  local.get $0
  local.get $1
  i32.const 1
  i32.shl
  i32.add
  local.set $1
  loop $while-continue|0
   local.get $3
   local.tee $0
   i32.const 1
   i32.sub
   local.set $3
   local.get $0
   if
    local.get $1
    i32.load16_u
    local.tee $0
    local.get $2
    i32.load16_u
    local.tee $4
    i32.ne
    if
     local.get $0
     local.get $4
     i32.sub
     return
    end
    local.get $1
    i32.const 2
    i32.add
    local.set $1
    local.get $2
    i32.const 2
    i32.add
    local.set $2
    br $while-continue|0
   end
  end
  i32.const 0
 )
 (func $~lib/@massalabs/massa-as-sdk/assembly/std/address/Address#set:_value (param $0 i32) (param $1 i32)
  local.get $0
  local.get $1
  i32.store
  local.get $0
  local.get $1
  i32.const 0
  call $~lib/rt/itcms/__link
 )
 (func $~lib/staticarray/StaticArray<u8>#get:length (param $0 i32) (result i32)
  local.get $0
  i32.const 20
  i32.sub
  i32.load offset=16
 )
 (func $~lib/@massalabs/as-types/assembly/result/Result<u64>#set:value (param $0 i32) (param $1 i64)
  local.get $0
  local.get $1
  i64.store
 )
 (func $~lib/staticarray/StaticArray<~lib/string/String>#__uset (param $0 i32) (param $1 i32) (param $2 i32)
  local.get $0
  local.get $1
  i32.const 2
  i32.shl
  i32.add
  local.get $2
  i32.store
  local.get $0
  local.get $2
  i32.const 1
  call $~lib/rt/itcms/__link
 )
 (func $~lib/util/number/decimalCount32 (param $0 i32) (result i32)
  local.get $0
  i32.const 10
  i32.ge_u
  i32.const 1
  i32.add
  local.get $0
  i32.const 10000
  i32.ge_u
  i32.const 3
  i32.add
  local.get $0
  i32.const 1000
  i32.ge_u
  i32.add
  local.get $0
  i32.const 100
  i32.lt_u
  select
  local.get $0
  i32.const 1000000
  i32.ge_u
  i32.const 6
  i32.add
  local.get $0
  i32.const 1000000000
  i32.ge_u
  i32.const 8
  i32.add
  local.get $0
  i32.const 100000000
  i32.ge_u
  i32.add
  local.get $0
  i32.const 10000000
  i32.lt_u
  select
  local.get $0
  i32.const 100000
  i32.lt_u
  select
 )
 (func $~lib/util/number/utoa_dec_simple<u32> (param $0 i32) (param $1 i32) (param $2 i32)
  loop $do-loop|0
   local.get $0
   local.get $2
   i32.const 1
   i32.sub
   local.tee $2
   i32.const 1
   i32.shl
   i32.add
   local.get $1
   i32.const 10
   i32.rem_u
   i32.const 48
   i32.add
   i32.store16
   local.get $1
   i32.const 10
   i32.div_u
   local.tee $1
   br_if $do-loop|0
  end
 )
 (func $~lib/string/String.UTF8.encodeUnsafe (param $0 i32) (param $1 i32) (param $2 i32) (param $3 i32)
  (local $4 i32)
  (local $5 i32)
  local.get $0
  local.get $1
  i32.const 1
  i32.shl
  i32.add
  local.set $4
  local.get $2
  local.set $1
  loop $while-continue|0
   local.get $0
   local.get $4
   i32.lt_u
   if
    local.get $0
    i32.load16_u
    local.tee $2
    i32.const 128
    i32.lt_u
    if (result i32)
     local.get $1
     local.get $2
     i32.store8
     local.get $1
     i32.const 1
     i32.add
    else
     local.get $2
     i32.const 2048
     i32.lt_u
     if (result i32)
      local.get $1
      local.get $2
      i32.const 6
      i32.shr_u
      i32.const 192
      i32.or
      local.get $2
      i32.const 63
      i32.and
      i32.const 128
      i32.or
      i32.const 8
      i32.shl
      i32.or
      i32.store16
      local.get $1
      i32.const 2
      i32.add
     else
      local.get $2
      i32.const 63488
      i32.and
      i32.const 55296
      i32.eq
      if
       local.get $2
       i32.const 56320
       i32.lt_u
       local.get $0
       i32.const 2
       i32.add
       local.get $4
       i32.lt_u
       i32.and
       if
        local.get $0
        i32.load16_u offset=2
        local.tee $5
        i32.const 64512
        i32.and
        i32.const 56320
        i32.eq
        if
         local.get $1
         local.get $2
         i32.const 1023
         i32.and
         i32.const 10
         i32.shl
         i32.const 65536
         i32.add
         local.get $5
         i32.const 1023
         i32.and
         i32.or
         local.tee $2
         i32.const 63
         i32.and
         i32.const 128
         i32.or
         i32.const 24
         i32.shl
         local.get $2
         i32.const 6
         i32.shr_u
         i32.const 63
         i32.and
         i32.const 128
         i32.or
         i32.const 16
         i32.shl
         i32.or
         local.get $2
         i32.const 12
         i32.shr_u
         i32.const 63
         i32.and
         i32.const 128
         i32.or
         i32.const 8
         i32.shl
         i32.or
         local.get $2
         i32.const 18
         i32.shr_u
         i32.const 240
         i32.or
         i32.or
         i32.store
         local.get $1
         i32.const 4
         i32.add
         local.set $1
         local.get $0
         i32.const 4
         i32.add
         local.set $0
         br $while-continue|0
        end
       end
       local.get $3
       if
        local.get $3
        i32.const 2
        i32.eq
        if
         i32.const 3776
         i32.const 3840
         i32.const 742
         i32.const 49
         call $~lib/builtins/abort
         unreachable
        end
        i32.const 65533
        local.set $2
       end
      end
      local.get $1
      local.get $2
      i32.const 12
      i32.shr_u
      i32.const 224
      i32.or
      local.get $2
      i32.const 6
      i32.shr_u
      i32.const 63
      i32.and
      i32.const 128
      i32.or
      i32.const 8
      i32.shl
      i32.or
      i32.store16
      local.get $1
      local.get $2
      i32.const 63
      i32.and
      i32.const 128
      i32.or
      i32.store8 offset=2
      local.get $1
      i32.const 3
      i32.add
     end
    end
    local.set $1
    local.get $0
    i32.const 2
    i32.add
    local.set $0
    br $while-continue|0
   end
  end
 )
 (func $~lib/@massalabs/massa-as-sdk/assembly/std/context/Slot#set:thread (param $0 i32) (param $1 i32)
  local.get $0
  local.get $1
  i32.store8 offset=8
 )
 (func $~lib/rt/itcms/__pin (param $0 i32) (result i32)
  (local $1 i32)
  local.get $0
  if
   local.get $0
   i32.const 20
   i32.sub
   local.tee $1
   call $~lib/rt/itcms/Object#get:color
   i32.const 3
   i32.eq
   if
    i32.const 9440
    i32.const 1056
    i32.const 338
    i32.const 7
    call $~lib/builtins/abort
    unreachable
   end
   local.get $1
   call $~lib/rt/itcms/Object#unlink
   local.get $1
   global.get $~lib/rt/itcms/pinSpace
   i32.const 3
   call $~lib/rt/itcms/Object#linkTo
  end
  local.get $0
 )
 (func $~lib/rt/itcms/__unpin (param $0 i32)
  local.get $0
  i32.eqz
  if
   return
  end
  local.get $0
  i32.const 20
  i32.sub
  local.tee $0
  call $~lib/rt/itcms/Object#get:color
  i32.const 3
  i32.ne
  if
   i32.const 9504
   i32.const 1056
   i32.const 352
   i32.const 5
   call $~lib/builtins/abort
   unreachable
  end
  global.get $~lib/rt/itcms/state
  i32.const 1
  i32.eq
  if
   local.get $0
   call $~lib/rt/itcms/Object#makeGray
  else
   local.get $0
   call $~lib/rt/itcms/Object#unlink
   local.get $0
   global.get $~lib/rt/itcms/fromSpace
   global.get $~lib/rt/itcms/white
   call $~lib/rt/itcms/Object#linkTo
  end
 )
 (func $~lib/rt/itcms/__collect
  global.get $~lib/rt/itcms/state
  i32.const 0
  i32.gt_s
  if
   loop $while-continue|0
    global.get $~lib/rt/itcms/state
    if
     call $~lib/rt/itcms/step
     drop
     br $while-continue|0
    end
   end
  end
  call $~lib/rt/itcms/step
  drop
  loop $while-continue|1
   global.get $~lib/rt/itcms/state
   if
    call $~lib/rt/itcms/step
    drop
    br $while-continue|1
   end
  end
  global.get $~lib/rt/itcms/total
  i64.extend_i32_u
  i64.const 200
  i64.mul
  i64.const 100
  i64.div_u
  i32.wrap_i64
  i32.const 1024
  i32.add
  global.set $~lib/rt/itcms/threshold
 )
 (func $~lib/arraybuffer/ArrayBufferView~visit (param $0 i32)
  local.get $0
  i32.load
  local.tee $0
  if
   local.get $0
   call $~lib/rt/itcms/__visit
  end
 )
 (func $~lib/@massalabs/as-types/assembly/argument/Args~visit (param $0 i32)
  local.get $0
  i32.load offset=4
  local.tee $0
  if
   local.get $0
   call $~lib/rt/itcms/__visit
  end
 )
 (func $~lib/array/Array<~lib/@massalabs/massa-as-sdk/assembly/std/address/Address>~visit (param $0 i32)
  (local $1 i32)
  (local $2 i32)
  (local $3 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 4
  i32.sub
  global.set $~lib/memory/__stack_pointer
  call $~stack_check
  global.get $~lib/memory/__stack_pointer
  i32.const 0
  i32.store
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store
  local.get $0
  i32.load offset=4
  local.set $1
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store
  local.get $1
  local.get $0
  i32.load offset=12
  i32.const 2
  i32.shl
  i32.add
  local.set $2
  loop $while-continue|0
   local.get $1
   local.get $2
   i32.lt_u
   if
    local.get $1
    i32.load
    local.tee $3
    if
     local.get $3
     call $~lib/rt/itcms/__visit
    end
    local.get $1
    i32.const 4
    i32.add
    local.set $1
    br $while-continue|0
   end
  end
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store
  local.get $0
  i32.load
  call $~lib/rt/itcms/__visit
  global.get $~lib/memory/__stack_pointer
  i32.const 4
  i32.add
  global.set $~lib/memory/__stack_pointer
 )
 (func $~lib/rt/__visit_members (param $0 i32)
  (local $1 i32)
  (local $2 i32)
  block $folding-inner0
   block $invalid
    block $~lib/@massalabs/as-types/assembly/result/Result<u32>
     block $~lib/@massalabs/as-types/assembly/result/Result<~lib/string/String>
      block $~lib/typedarray/Uint8Array
       block $~lib/@massalabs/massa-as-sdk/assembly/std/context/Slot
        block $~lib/staticarray/StaticArray<~lib/string/String>
         block $~lib/@massalabs/as-types/assembly/result/Result<u64>
          block $~lib/function/Function<%28~lib/string/String%2Ci32%2C~lib/array/Array<~lib/string/String>%29=>~lib/@massalabs/massa-as-sdk/assembly/std/address/Address>
           block $~lib/array/Array<~lib/string/String>
            block $~lib/array/Array<~lib/@massalabs/massa-as-sdk/assembly/std/address/Address>
             block $~lib/@massalabs/as-types/assembly/serializable/Serializable
              block $~lib/@massalabs/massa-as-sdk/assembly/std/address/Address
               block $~lib/staticarray/StaticArray<u8>
                block $~lib/@massalabs/as-types/assembly/argument/Args
                 block $~lib/arraybuffer/ArrayBufferView
                  block $~lib/string/String
                   block $~lib/arraybuffer/ArrayBuffer
                    block $~lib/object/Object
                     local.get $0
                     i32.const 8
                     i32.sub
                     i32.load
                     br_table $~lib/object/Object $~lib/arraybuffer/ArrayBuffer $~lib/string/String $~lib/arraybuffer/ArrayBufferView $~lib/@massalabs/as-types/assembly/argument/Args $~lib/staticarray/StaticArray<u8> $folding-inner0 $~lib/@massalabs/massa-as-sdk/assembly/std/address/Address $~lib/@massalabs/as-types/assembly/serializable/Serializable $~lib/array/Array<~lib/@massalabs/massa-as-sdk/assembly/std/address/Address> $~lib/array/Array<~lib/string/String> $folding-inner0 $~lib/function/Function<%28~lib/string/String%2Ci32%2C~lib/array/Array<~lib/string/String>%29=>~lib/@massalabs/massa-as-sdk/assembly/std/address/Address> $~lib/@massalabs/as-types/assembly/result/Result<u64> $folding-inner0 $~lib/staticarray/StaticArray<~lib/string/String> $~lib/@massalabs/massa-as-sdk/assembly/std/context/Slot $~lib/typedarray/Uint8Array $~lib/@massalabs/as-types/assembly/result/Result<~lib/string/String> $~lib/@massalabs/as-types/assembly/result/Result<u32> $invalid
                    end
                    return
                   end
                   return
                  end
                  return
                 end
                 local.get $0
                 call $~lib/arraybuffer/ArrayBufferView~visit
                 return
                end
                local.get $0
                call $~lib/@massalabs/as-types/assembly/argument/Args~visit
                return
               end
               return
              end
              local.get $0
              call $~lib/arraybuffer/ArrayBufferView~visit
              return
             end
             return
            end
            local.get $0
            call $~lib/array/Array<~lib/@massalabs/massa-as-sdk/assembly/std/address/Address>~visit
            return
           end
           local.get $0
           call $~lib/array/Array<~lib/@massalabs/massa-as-sdk/assembly/std/address/Address>~visit
           return
          end
          global.get $~lib/memory/__stack_pointer
          i32.const 4
          i32.sub
          global.set $~lib/memory/__stack_pointer
          call $~stack_check
          global.get $~lib/memory/__stack_pointer
          i32.const 0
          i32.store
          global.get $~lib/memory/__stack_pointer
          local.get $0
          i32.store
          local.get $0
          i32.load offset=4
          call $~lib/rt/itcms/__visit
          global.get $~lib/memory/__stack_pointer
          i32.const 4
          i32.add
          global.set $~lib/memory/__stack_pointer
          return
         end
         local.get $0
         i32.load offset=8
         local.tee $0
         if
          local.get $0
          call $~lib/rt/itcms/__visit
         end
         return
        end
        local.get $0
        local.get $0
        i32.const 20
        i32.sub
        i32.load offset=16
        i32.add
        local.set $2
        loop $while-continue|0
         local.get $0
         local.get $2
         i32.lt_u
         if
          local.get $0
          i32.load
          local.tee $1
          if
           local.get $1
           call $~lib/rt/itcms/__visit
          end
          local.get $0
          i32.const 4
          i32.add
          local.set $0
          br $while-continue|0
         end
        end
        return
       end
       return
      end
      local.get $0
      call $~lib/arraybuffer/ArrayBufferView~visit
      return
     end
     local.get $0
     i32.load
     local.tee $1
     if
      local.get $1
      call $~lib/rt/itcms/__visit
     end
     local.get $0
     i32.load offset=4
     local.tee $0
     if
      local.get $0
      call $~lib/rt/itcms/__visit
     end
     return
    end
    local.get $0
    call $~lib/@massalabs/as-types/assembly/argument/Args~visit
    return
   end
   unreachable
  end
  global.get $~lib/memory/__stack_pointer
  i32.const 4
  i32.sub
  global.set $~lib/memory/__stack_pointer
  call $~stack_check
  global.get $~lib/memory/__stack_pointer
  i32.const 0
  i32.store
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store
  local.get $0
  i32.load
  call $~lib/rt/itcms/__visit
  global.get $~lib/memory/__stack_pointer
  i32.const 4
  i32.add
  global.set $~lib/memory/__stack_pointer
 )
 (func $~start
  i32.const 1104
  call $~lib/rt/itcms/initLazy
  global.set $~lib/rt/itcms/toSpace
  memory.size
  i32.const 16
  i32.shl
  i32.const 42404
  i32.sub
  i32.const 1
  i32.shr_u
  global.set $~lib/rt/itcms/threshold
  i32.const 1312
  call $~lib/rt/itcms/initLazy
  global.set $~lib/rt/itcms/pinSpace
  i32.const 1344
  call $~lib/rt/itcms/initLazy
  global.set $~lib/rt/itcms/fromSpace
  i32.const 0
  global.set $~argumentsLength
  call $~lib/@massalabs/as-types/assembly/argument/Args#constructor@varargs
  global.set $~lib/@massalabs/as-types/assembly/argument/NoArg
 )
 (func $~stack_check
  global.get $~lib/memory/__stack_pointer
  i32.const 9636
  i32.lt_s
  if
   i32.const 42432
   i32.const 42480
   i32.const 1
   i32.const 1
   call $~lib/builtins/abort
   unreachable
  end
 )
 (func $~lib/@massalabs/as-types/assembly/argument/Args#constructor (param $0 i32) (result i32)
  (local $1 i32)
  (local $2 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 12
  i32.sub
  global.set $~lib/memory/__stack_pointer
  call $~stack_check
  global.get $~lib/memory/__stack_pointer
  i64.const 0
  i64.store
  global.get $~lib/memory/__stack_pointer
  i32.const 0
  i32.store offset=8
  global.get $~lib/memory/__stack_pointer
  i32.const 8
  i32.const 4
  call $~lib/rt/itcms/__new
  local.tee $1
  i32.store
  global.get $~lib/memory/__stack_pointer
  local.get $1
  i32.store offset=4
  local.get $1
  i32.const 0
  call $~lib/@massalabs/as-types/assembly/argument/Args#set:_offset
  global.get $~lib/memory/__stack_pointer
  local.get $1
  i32.store offset=4
  i32.const 0
  call $~lib/staticarray/StaticArray<u8>#constructor
  local.set $2
  global.get $~lib/memory/__stack_pointer
  local.get $2
  i32.store offset=8
  local.get $1
  local.get $2
  call $~lib/@massalabs/as-types/assembly/argument/Args#set:serialized
  global.get $~lib/memory/__stack_pointer
  local.get $1
  i32.store offset=4
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store offset=8
  local.get $1
  local.get $0
  call $~lib/@massalabs/as-types/assembly/argument/Args#set:serialized
  global.get $~lib/memory/__stack_pointer
  local.get $1
  i32.store offset=4
  local.get $1
  i32.const 0
  call $~lib/@massalabs/as-types/assembly/argument/Args#set:_offset
  global.get $~lib/memory/__stack_pointer
  i32.const 12
  i32.add
  global.set $~lib/memory/__stack_pointer
  local.get $1
 )
 (func $~lib/@massalabs/as-types/assembly/argument/Args#constructor@varargs (result i32)
  (local $0 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 12
  i32.sub
  global.set $~lib/memory/__stack_pointer
  call $~stack_check
  global.get $~lib/memory/__stack_pointer
  i64.const 0
  i64.store
  global.get $~lib/memory/__stack_pointer
  i32.const 0
  i32.store offset=8
  block $2of2
   block $0of2
    block $outOfRange
     global.get $~argumentsLength
     br_table $0of2 $2of2 $2of2 $outOfRange
    end
    unreachable
   end
   global.get $~lib/memory/__stack_pointer
   i32.const 0
   i32.const 5
   i32.const 1568
   call $~lib/rt/__newBuffer
   local.tee $0
   i32.store
  end
  global.get $~lib/memory/__stack_pointer
  i32.const 0
  i32.store offset=4
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store offset=8
  local.get $0
  call $~lib/@massalabs/as-types/assembly/argument/Args#constructor
  local.set $0
  global.get $~lib/memory/__stack_pointer
  i32.const 12
  i32.add
  global.set $~lib/memory/__stack_pointer
  local.get $0
 )
 (func $~lib/string/String#substring (param $0 i32) (param $1 i32) (result i32)
  (local $2 i32)
  (local $3 i32)
  (local $4 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 8
  i32.sub
  global.set $~lib/memory/__stack_pointer
  call $~stack_check
  global.get $~lib/memory/__stack_pointer
  i64.const 0
  i64.store
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store
  i32.const 1
  local.get $0
  call $~lib/string/String#get:length
  local.tee $2
  local.get $2
  i32.const 1
  i32.gt_s
  select
  local.tee $4
  local.get $1
  i32.const 0
  local.get $1
  i32.const 0
  i32.gt_s
  select
  local.tee $1
  local.get $2
  local.get $1
  local.get $2
  i32.lt_s
  select
  local.tee $1
  local.get $1
  local.get $4
  i32.gt_s
  select
  i32.const 1
  i32.shl
  local.set $3
  block $folding-inner0
   local.get $4
   local.get $1
   local.get $1
   local.get $4
   i32.lt_s
   select
   i32.const 1
   i32.shl
   local.tee $1
   local.get $3
   i32.sub
   local.tee $4
   i32.eqz
   if
    i32.const 2592
    local.set $0
    br $folding-inner0
   end
   local.get $3
   i32.eqz
   local.get $1
   local.get $2
   i32.const 1
   i32.shl
   i32.eq
   i32.and
   br_if $folding-inner0
   global.get $~lib/memory/__stack_pointer
   local.get $4
   i32.const 2
   call $~lib/rt/itcms/__new
   local.tee $1
   i32.store offset=4
   local.get $1
   local.get $0
   local.get $3
   i32.add
   local.get $4
   memory.copy
   local.get $1
   local.set $0
  end
  global.get $~lib/memory/__stack_pointer
  i32.const 8
  i32.add
  global.set $~lib/memory/__stack_pointer
  local.get $0
 )
 (func $~lib/array/ensureCapacity (param $0 i32) (param $1 i32)
  (local $2 i32)
  (local $3 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 4
  i32.sub
  global.set $~lib/memory/__stack_pointer
  call $~stack_check
  global.get $~lib/memory/__stack_pointer
  i32.const 0
  i32.store
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store
  local.get $1
  local.get $0
  i32.load offset=8
  local.tee $3
  i32.const 2
  i32.shr_u
  i32.gt_u
  if
   local.get $1
   i32.const 268435455
   i32.gt_u
   if
    i32.const 1456
    i32.const 2656
    i32.const 19
    i32.const 48
    call $~lib/builtins/abort
    unreachable
   end
   global.get $~lib/memory/__stack_pointer
   local.get $0
   i32.store
   local.get $0
   i32.load
   local.tee $2
   i32.const 1073741820
   local.get $3
   i32.const 1
   i32.shl
   local.tee $3
   local.get $3
   i32.const 1073741820
   i32.ge_u
   select
   local.tee $3
   i32.const 8
   local.get $1
   local.get $1
   i32.const 8
   i32.le_u
   select
   i32.const 2
   i32.shl
   local.tee $1
   local.get $1
   local.get $3
   i32.lt_u
   select
   local.tee $1
   call $~lib/rt/itcms/__renew
   local.tee $3
   local.get $2
   i32.ne
   if
    local.get $0
    local.get $3
    i32.store
    local.get $0
    local.get $3
    i32.store offset=4
    local.get $0
    local.get $3
    i32.const 0
    call $~lib/rt/itcms/__link
   end
   local.get $0
   local.get $1
   i32.store offset=8
  end
  global.get $~lib/memory/__stack_pointer
  i32.const 4
  i32.add
  global.set $~lib/memory/__stack_pointer
 )
 (func $~lib/array/Array<~lib/string/String>#push (param $0 i32) (param $1 i32)
  (local $2 i32)
  (local $3 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 4
  i32.sub
  global.set $~lib/memory/__stack_pointer
  call $~stack_check
  global.get $~lib/memory/__stack_pointer
  i32.const 0
  i32.store
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store
  local.get $0
  local.get $0
  i32.load offset=12
  local.tee $2
  i32.const 1
  i32.add
  local.tee $3
  call $~lib/array/ensureCapacity
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store
  local.get $0
  i32.load offset=4
  local.get $2
  i32.const 2
  i32.shl
  i32.add
  local.get $1
  i32.store
  local.get $0
  local.get $1
  i32.const 1
  call $~lib/rt/itcms/__link
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store
  local.get $0
  local.get $3
  call $~lib/rt/itcms/Object#set:rtId
  global.get $~lib/memory/__stack_pointer
  i32.const 4
  i32.add
  global.set $~lib/memory/__stack_pointer
 )
 (func $~lib/string/String#split (param $0 i32) (param $1 i32) (param $2 i32) (result i32)
  (local $3 i32)
  (local $4 i32)
  (local $5 i32)
  (local $6 i32)
  (local $7 i32)
  (local $8 i32)
  (local $9 i32)
  (local $10 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 40
  i32.sub
  global.set $~lib/memory/__stack_pointer
  call $~stack_check
  global.get $~lib/memory/__stack_pointer
  i32.const 0
  i32.const 40
  memory.fill
  block $folding-inner2
   block $folding-inner1
    block $folding-inner0
     local.get $2
     i32.eqz
     br_if $folding-inner0
     local.get $1
     i32.eqz
     if
      global.get $~lib/memory/__stack_pointer
      i32.const 1
      i32.const 2
      i32.const 10
      i32.const 0
      call $~lib/rt/__newArray
      local.tee $1
      i32.store
      global.get $~lib/memory/__stack_pointer
      local.get $1
      i32.load offset=4
      i32.store offset=4
      global.get $~lib/memory/__stack_pointer
      i32.const 4
      i32.sub
      global.set $~lib/memory/__stack_pointer
      call $~stack_check
      global.get $~lib/memory/__stack_pointer
      i32.const 0
      i32.store
      global.get $~lib/memory/__stack_pointer
      local.get $1
      i32.store
      local.get $1
      i32.load offset=12
      i32.eqz
      if
       local.get $1
       i32.const 1
       call $~lib/array/ensureCapacity
       global.get $~lib/memory/__stack_pointer
       local.get $1
       i32.store
       local.get $1
       i32.const 1
       call $~lib/rt/itcms/Object#set:rtId
      end
      global.get $~lib/memory/__stack_pointer
      local.get $1
      i32.store
      local.get $1
      i32.load offset=4
      local.get $0
      i32.store
      local.get $1
      local.get $0
      i32.const 1
      call $~lib/rt/itcms/__link
      global.get $~lib/memory/__stack_pointer
      i32.const 4
      i32.add
      global.set $~lib/memory/__stack_pointer
      global.get $~lib/memory/__stack_pointer
      i32.const 40
      i32.add
      global.set $~lib/memory/__stack_pointer
      local.get $1
      return
     end
     global.get $~lib/memory/__stack_pointer
     local.get $0
     i32.store offset=8
     local.get $0
     call $~lib/string/String#get:length
     local.set $5
     global.get $~lib/memory/__stack_pointer
     local.get $1
     i32.store offset=8
     i32.const 2147483647
     local.get $2
     local.get $2
     i32.const 0
     i32.lt_s
     select
     local.set $7
     local.get $1
     call $~lib/string/String#get:length
     local.tee $8
     if
      local.get $5
      i32.eqz
      if
       global.get $~lib/memory/__stack_pointer
       i32.const 1
       i32.const 2
       i32.const 10
       i32.const 0
       call $~lib/rt/__newArray
       local.tee $0
       i32.store offset=20
       global.get $~lib/memory/__stack_pointer
       local.get $0
       i32.store offset=8
       local.get $0
       i32.load offset=4
       i32.const 2592
       i32.store
       br $folding-inner1
      end
     else
      local.get $5
      i32.eqz
      br_if $folding-inner0
      global.get $~lib/memory/__stack_pointer
      local.get $5
      local.get $7
      local.get $5
      local.get $7
      i32.lt_s
      select
      local.tee $2
      i32.const 2
      i32.const 10
      i32.const 0
      call $~lib/rt/__newArray
      local.tee $3
      i32.store offset=12
      global.get $~lib/memory/__stack_pointer
      local.get $3
      i32.store offset=8
      local.get $3
      i32.load offset=4
      local.set $4
      i32.const 0
      local.set $1
      loop $for-loop|0
       local.get $1
       local.get $2
       i32.lt_s
       if
        global.get $~lib/memory/__stack_pointer
        i32.const 2
        i32.const 2
        call $~lib/rt/itcms/__new
        local.tee $5
        i32.store offset=16
        local.get $5
        local.get $0
        local.get $1
        i32.const 1
        i32.shl
        i32.add
        i32.load16_u
        i32.store16
        local.get $4
        local.get $1
        i32.const 2
        i32.shl
        i32.add
        local.get $5
        i32.store
        local.get $3
        local.get $5
        i32.const 1
        call $~lib/rt/itcms/__link
        local.get $1
        i32.const 1
        i32.add
        local.set $1
        br $for-loop|0
       end
      end
      global.get $~lib/memory/__stack_pointer
      i32.const 40
      i32.add
      global.set $~lib/memory/__stack_pointer
      local.get $3
      return
     end
     global.get $~lib/memory/__stack_pointer
     i32.const 0
     i32.const 2
     i32.const 10
     i32.const 0
     call $~lib/rt/__newArray
     local.tee $6
     i32.store offset=24
     loop $while-continue|1
      global.get $~lib/memory/__stack_pointer
      local.get $0
      i32.store offset=8
      global.get $~lib/memory/__stack_pointer
      local.get $1
      i32.store offset=28
      global.get $~lib/memory/__stack_pointer
      i32.const 8
      i32.sub
      global.set $~lib/memory/__stack_pointer
      call $~stack_check
      global.get $~lib/memory/__stack_pointer
      i64.const 0
      i64.store
      global.get $~lib/memory/__stack_pointer
      local.get $1
      i32.store
      block $folding-inner10
       local.get $1
       call $~lib/string/String#get:length
       local.tee $9
       i32.eqz
       if
        i32.const 0
        local.set $2
        br $folding-inner10
       end
       global.get $~lib/memory/__stack_pointer
       local.get $0
       i32.store
       local.get $0
       call $~lib/string/String#get:length
       local.tee $10
       if
        local.get $3
        i32.const 0
        local.get $3
        i32.const 0
        i32.gt_s
        select
        local.tee $2
        local.get $10
        local.get $2
        local.get $10
        i32.lt_s
        select
        local.set $2
        local.get $10
        local.get $9
        i32.sub
        local.set $10
        loop $for-loop|01
         local.get $2
         local.get $10
         i32.le_s
         if
          global.get $~lib/memory/__stack_pointer
          local.get $0
          i32.store
          global.get $~lib/memory/__stack_pointer
          local.get $1
          i32.store offset=4
          local.get $0
          local.get $2
          local.get $1
          local.get $9
          call $~lib/util/string/compareImpl
          i32.eqz
          br_if $folding-inner10
          local.get $2
          i32.const 1
          i32.add
          local.set $2
          br $for-loop|01
         end
        end
       end
       i32.const -1
       local.set $2
      end
      global.get $~lib/memory/__stack_pointer
      i32.const 8
      i32.add
      global.set $~lib/memory/__stack_pointer
      local.get $2
      i32.const -1
      i32.xor
      if
       local.get $2
       local.get $3
       i32.sub
       local.tee $9
       i32.const 0
       i32.gt_s
       if
        global.get $~lib/memory/__stack_pointer
        local.get $9
        i32.const 1
        i32.shl
        local.tee $9
        i32.const 2
        call $~lib/rt/itcms/__new
        local.tee $10
        i32.store offset=32
        local.get $10
        local.get $0
        local.get $3
        i32.const 1
        i32.shl
        i32.add
        local.get $9
        memory.copy
        global.get $~lib/memory/__stack_pointer
        local.get $6
        i32.store offset=8
        global.get $~lib/memory/__stack_pointer
        local.get $10
        i32.store offset=28
        local.get $6
        local.get $10
        call $~lib/array/Array<~lib/string/String>#push
       else
        global.get $~lib/memory/__stack_pointer
        local.get $6
        i32.store offset=8
        global.get $~lib/memory/__stack_pointer
        i32.const 2592
        i32.store offset=28
        local.get $6
        i32.const 2592
        call $~lib/array/Array<~lib/string/String>#push
       end
       local.get $4
       i32.const 1
       i32.add
       local.tee $4
       local.get $7
       i32.eq
       br_if $folding-inner2
       local.get $2
       local.get $8
       i32.add
       local.set $3
       br $while-continue|1
      end
     end
     local.get $3
     i32.eqz
     if
      global.get $~lib/memory/__stack_pointer
      local.get $6
      i32.store offset=8
      global.get $~lib/memory/__stack_pointer
      local.get $0
      i32.store offset=28
      local.get $6
      local.get $0
      call $~lib/array/Array<~lib/string/String>#push
      br $folding-inner2
     end
     local.get $5
     local.get $3
     i32.sub
     local.tee $1
     i32.const 0
     i32.gt_s
     if
      global.get $~lib/memory/__stack_pointer
      local.get $1
      i32.const 1
      i32.shl
      local.tee $1
      i32.const 2
      call $~lib/rt/itcms/__new
      local.tee $2
      i32.store offset=36
      local.get $2
      local.get $0
      local.get $3
      i32.const 1
      i32.shl
      i32.add
      local.get $1
      memory.copy
      global.get $~lib/memory/__stack_pointer
      local.get $6
      i32.store offset=8
      global.get $~lib/memory/__stack_pointer
      local.get $2
      i32.store offset=28
      local.get $6
      local.get $2
      call $~lib/array/Array<~lib/string/String>#push
     else
      global.get $~lib/memory/__stack_pointer
      local.get $6
      i32.store offset=8
      global.get $~lib/memory/__stack_pointer
      i32.const 2592
      i32.store offset=28
      local.get $6
      i32.const 2592
      call $~lib/array/Array<~lib/string/String>#push
     end
     global.get $~lib/memory/__stack_pointer
     i32.const 40
     i32.add
     global.set $~lib/memory/__stack_pointer
     local.get $6
     return
    end
    i32.const 0
    i32.const 2
    i32.const 10
    i32.const 0
    call $~lib/rt/__newArray
    local.set $0
   end
   global.get $~lib/memory/__stack_pointer
   i32.const 40
   i32.add
   global.set $~lib/memory/__stack_pointer
   local.get $0
   return
  end
  global.get $~lib/memory/__stack_pointer
  i32.const 40
  i32.add
  global.set $~lib/memory/__stack_pointer
  local.get $6
 )
 (func $~lib/string/String#split@varargs (param $0 i32) (param $1 i32) (result i32)
  (local $2 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 8
  i32.sub
  global.set $~lib/memory/__stack_pointer
  call $~stack_check
  global.get $~lib/memory/__stack_pointer
  i64.const 0
  i64.store
  block $2of2
   block $1of2
    block $0of2
     block $outOfRange
      global.get $~argumentsLength
      br_table $0of2 $1of2 $2of2 $outOfRange
     end
     unreachable
    end
    i32.const 0
    local.set $1
   end
   i32.const 2147483647
   local.set $2
  end
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store
  global.get $~lib/memory/__stack_pointer
  local.get $1
  i32.store offset=4
  local.get $0
  local.get $1
  local.get $2
  call $~lib/string/String#split
  local.set $0
  global.get $~lib/memory/__stack_pointer
  i32.const 8
  i32.add
  global.set $~lib/memory/__stack_pointer
  local.get $0
 )
 (func $~lib/@massalabs/massa-as-sdk/assembly/std/address/Address#constructor (param $0 i32) (result i32)
  (local $1 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 12
  i32.sub
  global.set $~lib/memory/__stack_pointer
  call $~stack_check
  global.get $~lib/memory/__stack_pointer
  i64.const 0
  i64.store
  global.get $~lib/memory/__stack_pointer
  i32.const 0
  i32.store offset=8
  global.get $~lib/memory/__stack_pointer
  i32.const 4
  i32.const 7
  call $~lib/rt/itcms/__new
  local.tee $1
  i32.store
  global.get $~lib/memory/__stack_pointer
  local.get $1
  i32.store offset=4
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store offset=8
  local.get $1
  local.get $0
  call $~lib/@massalabs/massa-as-sdk/assembly/std/address/Address#set:_value
  global.get $~lib/memory/__stack_pointer
  i32.const 12
  i32.add
  global.set $~lib/memory/__stack_pointer
  local.get $1
 )
 (func $~lib/@massalabs/massa-as-sdk/assembly/std/utils/address/json2Address~anonymous|0 (param $0 i32) (param $1 i32) (param $2 i32) (result i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 12
  i32.sub
  global.set $~lib/memory/__stack_pointer
  call $~stack_check
  global.get $~lib/memory/__stack_pointer
  i64.const 0
  i64.store
  global.get $~lib/memory/__stack_pointer
  i32.const 0
  i32.store offset=8
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store offset=4
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store offset=8
  local.get $0
  local.get $0
  call $~lib/string/String#get:length
  i32.const 1
  i32.sub
  call $~lib/string/String#substring
  local.set $0
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store
  local.get $0
  call $~lib/@massalabs/massa-as-sdk/assembly/std/address/Address#constructor
  local.set $0
  global.get $~lib/memory/__stack_pointer
  i32.const 12
  i32.add
  global.set $~lib/memory/__stack_pointer
  local.get $0
 )
 (func $~lib/array/Array<~lib/string/String>#map<~lib/@massalabs/massa-as-sdk/assembly/std/address/Address> (param $0 i32) (result i32)
  (local $1 i32)
  (local $2 i32)
  (local $3 i32)
  (local $4 i32)
  (local $5 i32)
  (local $6 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 20
  i32.sub
  global.set $~lib/memory/__stack_pointer
  call $~stack_check
  global.get $~lib/memory/__stack_pointer
  i32.const 0
  i32.const 20
  memory.fill
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.load offset=12
  local.tee $3
  i32.const 2
  i32.const 9
  i32.const 0
  call $~lib/rt/__newArray
  local.tee $1
  i32.store offset=4
  global.get $~lib/memory/__stack_pointer
  local.get $1
  i32.store
  local.get $1
  i32.load offset=4
  local.set $4
  loop $for-loop|0
   global.get $~lib/memory/__stack_pointer
   local.get $0
   i32.store
   local.get $2
   local.get $3
   local.get $0
   i32.load offset=12
   local.tee $5
   local.get $3
   local.get $5
   i32.lt_s
   select
   i32.lt_s
   if
    global.get $~lib/memory/__stack_pointer
    local.get $0
    i32.store offset=12
    global.get $~lib/memory/__stack_pointer
    local.get $2
    i32.const 2
    i32.shl
    local.tee $5
    local.get $0
    i32.load offset=4
    i32.add
    i32.load
    local.tee $6
    i32.store
    global.get $~lib/memory/__stack_pointer
    local.get $0
    i32.store offset=8
    i32.const 3
    global.set $~argumentsLength
    global.get $~lib/memory/__stack_pointer
    local.get $6
    local.get $2
    local.get $0
    i32.const 2704
    i32.load
    call_indirect (type $6)
    local.tee $6
    i32.store offset=16
    local.get $4
    local.get $5
    i32.add
    local.get $6
    i32.store
    local.get $1
    local.get $6
    i32.const 1
    call $~lib/rt/itcms/__link
    local.get $2
    i32.const 1
    i32.add
    local.set $2
    br $for-loop|0
   end
  end
  global.get $~lib/memory/__stack_pointer
  i32.const 20
  i32.add
  global.set $~lib/memory/__stack_pointer
  local.get $1
 )
 (func $~lib/@massalabs/massa-as-sdk/assembly/std/context/addressStack (result i32)
  (local $0 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 4
  i32.sub
  global.set $~lib/memory/__stack_pointer
  call $~stack_check
  global.get $~lib/memory/__stack_pointer
  i32.const 0
  i32.store
  call $~lib/@massalabs/massa-as-sdk/assembly/env/env/env.callStack
  local.set $0
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store
  global.get $~lib/memory/__stack_pointer
  i32.const 16
  i32.sub
  global.set $~lib/memory/__stack_pointer
  call $~stack_check
  global.get $~lib/memory/__stack_pointer
  i64.const 0
  i64.store
  global.get $~lib/memory/__stack_pointer
  i64.const 0
  i64.store offset=8
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store offset=4
  global.get $~lib/memory/__stack_pointer
  local.get $0
  local.get $0
  call $~lib/string/String#get:length
  i32.const 1
  i32.sub
  call $~lib/string/String#substring
  local.tee $0
  i32.store offset=8
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store
  global.get $~lib/memory/__stack_pointer
  i32.const 2624
  i32.store offset=4
  i32.const 1
  global.set $~argumentsLength
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.const 2624
  call $~lib/string/String#split@varargs
  local.tee $0
  i32.store offset=12
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store
  global.get $~lib/memory/__stack_pointer
  i32.const 2704
  i32.store offset=4
  local.get $0
  call $~lib/array/Array<~lib/string/String>#map<~lib/@massalabs/massa-as-sdk/assembly/std/address/Address>
  local.set $0
  global.get $~lib/memory/__stack_pointer
  i32.const 16
  i32.add
  global.set $~lib/memory/__stack_pointer
  global.get $~lib/memory/__stack_pointer
  i32.const 4
  i32.add
  global.set $~lib/memory/__stack_pointer
  local.get $0
 )
 (func $~lib/array/Array<~lib/@massalabs/massa-as-sdk/assembly/std/address/Address>#get:length (param $0 i32) (result i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 4
  i32.sub
  global.set $~lib/memory/__stack_pointer
  call $~stack_check
  global.get $~lib/memory/__stack_pointer
  i32.const 0
  i32.store
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store
  local.get $0
  i32.load offset=12
  local.set $0
  global.get $~lib/memory/__stack_pointer
  i32.const 4
  i32.add
  global.set $~lib/memory/__stack_pointer
  local.get $0
 )
 (func $~lib/array/Array<~lib/@massalabs/massa-as-sdk/assembly/std/address/Address>#__get (param $0 i32) (param $1 i32) (result i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 8
  i32.sub
  global.set $~lib/memory/__stack_pointer
  call $~stack_check
  global.get $~lib/memory/__stack_pointer
  i64.const 0
  i64.store
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store
  local.get $1
  local.get $0
  i32.load offset=12
  i32.ge_u
  if
   i32.const 1152
   i32.const 2656
   i32.const 114
   i32.const 42
   call $~lib/builtins/abort
   unreachable
  end
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.load offset=4
  local.get $1
  i32.const 2
  i32.shl
  i32.add
  i32.load
  local.tee $0
  i32.store offset=4
  local.get $0
  i32.eqz
  if
   i32.const 2736
   i32.const 2656
   i32.const 118
   i32.const 40
   call $~lib/builtins/abort
   unreachable
  end
  global.get $~lib/memory/__stack_pointer
  i32.const 8
  i32.add
  global.set $~lib/memory/__stack_pointer
  local.get $0
 )
 (func $~lib/@massalabs/massa-as-sdk/assembly/std/context/callee (result i32)
  (local $0 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 12
  i32.sub
  global.set $~lib/memory/__stack_pointer
  call $~stack_check
  global.get $~lib/memory/__stack_pointer
  i64.const 0
  i64.store
  global.get $~lib/memory/__stack_pointer
  i32.const 0
  i32.store offset=8
  global.get $~lib/memory/__stack_pointer
  call $~lib/@massalabs/massa-as-sdk/assembly/std/context/addressStack
  local.tee $0
  i32.store
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store offset=4
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store offset=8
  local.get $0
  local.get $0
  call $~lib/array/Array<~lib/@massalabs/massa-as-sdk/assembly/std/address/Address>#get:length
  i32.const 1
  i32.sub
  call $~lib/array/Array<~lib/@massalabs/massa-as-sdk/assembly/std/address/Address>#__get
  local.set $0
  global.get $~lib/memory/__stack_pointer
  i32.const 12
  i32.add
  global.set $~lib/memory/__stack_pointer
  local.get $0
 )
 (func $~lib/@massalabs/massa-as-sdk/assembly/std/context/caller (result i32)
  (local $0 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 12
  i32.sub
  global.set $~lib/memory/__stack_pointer
  call $~stack_check
  global.get $~lib/memory/__stack_pointer
  i64.const 0
  i64.store
  global.get $~lib/memory/__stack_pointer
  i32.const 0
  i32.store offset=8
  global.get $~lib/memory/__stack_pointer
  call $~lib/@massalabs/massa-as-sdk/assembly/std/context/addressStack
  local.tee $0
  i32.store
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store offset=4
  local.get $0
  call $~lib/array/Array<~lib/@massalabs/massa-as-sdk/assembly/std/address/Address>#get:length
  i32.const 2
  i32.lt_s
  if (result i32)
   call $~lib/@massalabs/massa-as-sdk/assembly/std/context/callee
  else
   global.get $~lib/memory/__stack_pointer
   local.get $0
   i32.store offset=4
   global.get $~lib/memory/__stack_pointer
   local.get $0
   i32.store offset=8
   local.get $0
   local.get $0
   call $~lib/array/Array<~lib/@massalabs/massa-as-sdk/assembly/std/address/Address>#get:length
   i32.const 2
   i32.sub
   call $~lib/array/Array<~lib/@massalabs/massa-as-sdk/assembly/std/address/Address>#__get
  end
  local.set $0
  global.get $~lib/memory/__stack_pointer
  i32.const 12
  i32.add
  global.set $~lib/memory/__stack_pointer
  local.get $0
 )
 (func $~lib/@massalabs/massa-as-sdk/assembly/std/address/Address#toString (param $0 i32) (result i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 4
  i32.sub
  global.set $~lib/memory/__stack_pointer
  call $~stack_check
  global.get $~lib/memory/__stack_pointer
  i32.const 0
  i32.store
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store
  local.get $0
  i32.load
  local.set $0
  global.get $~lib/memory/__stack_pointer
  i32.const 4
  i32.add
  global.set $~lib/memory/__stack_pointer
  local.get $0
 )
 (func $~lib/string/String.__eq (param $0 i32) (param $1 i32) (result i32)
  (local $2 i32)
  (local $3 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 8
  i32.sub
  global.set $~lib/memory/__stack_pointer
  call $~stack_check
  global.get $~lib/memory/__stack_pointer
  i64.const 0
  i64.store
  block $folding-inner0
   local.get $0
   local.get $1
   i32.eq
   if
    i32.const 1
    local.set $2
    br $folding-inner0
   end
   local.get $1
   i32.eqz
   local.get $0
   i32.eqz
   i32.or
   br_if $folding-inner0
   global.get $~lib/memory/__stack_pointer
   local.get $0
   i32.store
   local.get $0
   call $~lib/string/String#get:length
   local.set $3
   global.get $~lib/memory/__stack_pointer
   local.get $1
   i32.store
   local.get $1
   call $~lib/string/String#get:length
   local.get $3
   i32.ne
   br_if $folding-inner0
   global.get $~lib/memory/__stack_pointer
   local.get $0
   i32.store
   global.get $~lib/memory/__stack_pointer
   local.get $1
   i32.store offset=4
   local.get $0
   i32.const 0
   local.get $1
   local.get $3
   call $~lib/util/string/compareImpl
   i32.eqz
   local.set $2
  end
  global.get $~lib/memory/__stack_pointer
  i32.const 8
  i32.add
  global.set $~lib/memory/__stack_pointer
  local.get $2
 )
 (func $~lib/@massalabs/as-types/assembly/result/Result<u64>#constructor (param $0 i64) (param $1 i32) (result i32)
  (local $2 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 12
  i32.sub
  global.set $~lib/memory/__stack_pointer
  call $~stack_check
  global.get $~lib/memory/__stack_pointer
  i64.const 0
  i64.store
  global.get $~lib/memory/__stack_pointer
  i32.const 0
  i32.store offset=8
  global.get $~lib/memory/__stack_pointer
  i32.const 12
  i32.const 13
  call $~lib/rt/itcms/__new
  local.tee $2
  i32.store
  global.get $~lib/memory/__stack_pointer
  local.get $2
  i32.store offset=4
  local.get $2
  local.get $0
  call $~lib/@massalabs/as-types/assembly/result/Result<u64>#set:value
  global.get $~lib/memory/__stack_pointer
  local.get $2
  i32.store offset=4
  global.get $~lib/memory/__stack_pointer
  local.get $1
  i32.store offset=8
  local.get $2
  local.get $1
  i32.store offset=8
  local.get $2
  local.get $1
  i32.const 0
  call $~lib/rt/itcms/__link
  global.get $~lib/memory/__stack_pointer
  i32.const 12
  i32.add
  global.set $~lib/memory/__stack_pointer
  local.get $2
 )
 (func $~lib/staticarray/StaticArray<u8>#slice<~lib/array/Array<u8>> (param $0 i32) (param $1 i32) (param $2 i32) (result i32)
  (local $3 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 8
  i32.sub
  global.set $~lib/memory/__stack_pointer
  call $~stack_check
  global.get $~lib/memory/__stack_pointer
  i64.const 0
  i64.store
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store
  local.get $0
  call $~lib/staticarray/StaticArray<u8>#get:length
  local.set $3
  local.get $1
  i32.const 0
  i32.lt_s
  if (result i32)
   local.get $1
   local.get $3
   i32.add
   local.tee $1
   i32.const 0
   local.get $1
   i32.const 0
   i32.gt_s
   select
  else
   local.get $1
   local.get $3
   local.get $1
   local.get $3
   i32.lt_s
   select
  end
  local.set $1
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store offset=4
  global.get $~lib/memory/__stack_pointer
  local.get $2
  i32.const 0
  i32.lt_s
  if (result i32)
   local.get $2
   local.get $3
   i32.add
   local.tee $2
   i32.const 0
   local.get $2
   i32.const 0
   i32.gt_s
   select
  else
   local.get $2
   local.get $3
   local.get $2
   local.get $3
   i32.lt_s
   select
  end
  local.get $1
  i32.sub
  local.tee $2
  i32.const 0
  local.get $2
  i32.const 0
  i32.gt_s
  select
  local.tee $2
  i32.const 0
  i32.const 14
  i32.const 0
  call $~lib/rt/__newArray
  local.tee $3
  i32.store offset=4
  global.get $~lib/memory/__stack_pointer
  local.get $3
  i32.store
  local.get $3
  i32.load offset=4
  local.get $0
  local.get $1
  i32.add
  local.get $2
  memory.copy
  global.get $~lib/memory/__stack_pointer
  i32.const 8
  i32.add
  global.set $~lib/memory/__stack_pointer
  local.get $3
 )
 (func $~lib/@massalabs/as-types/assembly/argument/Args#getNextData (param $0 i32) (param $1 i32) (result i32)
  (local $2 i32)
  (local $3 i32)
  (local $4 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 16
  i32.sub
  global.set $~lib/memory/__stack_pointer
  call $~stack_check
  global.get $~lib/memory/__stack_pointer
  i64.const 0
  i64.store
  global.get $~lib/memory/__stack_pointer
  i64.const 0
  i64.store offset=8
  global.get $~lib/memory/__stack_pointer
  local.set $3
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store offset=8
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.load offset=4
  local.tee $2
  i32.store offset=4
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store offset=8
  local.get $0
  i32.load
  local.set $4
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store offset=8
  local.get $2
  local.get $4
  local.get $0
  i32.load
  local.get $1
  i32.add
  call $~lib/staticarray/StaticArray<u8>#slice<~lib/array/Array<u8>>
  local.set $2
  global.get $~lib/memory/__stack_pointer
  local.get $2
  i32.store
  local.get $3
  local.get $2
  i32.load offset=4
  local.tee $2
  i32.store offset=12
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store offset=4
  local.get $0
  local.get $0
  i32.load
  local.get $1
  i32.add
  call $~lib/@massalabs/as-types/assembly/argument/Args#set:_offset
  global.get $~lib/memory/__stack_pointer
  i32.const 16
  i32.add
  global.set $~lib/memory/__stack_pointer
  local.get $2
 )
 (func $~lib/@massalabs/as-types/assembly/argument/Args#nextU64 (param $0 i32) (result i32)
  (local $1 i32)
  (local $2 i32)
  (local $3 i64)
  global.get $~lib/memory/__stack_pointer
  i32.const 8
  i32.sub
  global.set $~lib/memory/__stack_pointer
  call $~stack_check
  global.get $~lib/memory/__stack_pointer
  i64.const 0
  i64.store
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store
  block $folding-inner0 (result i32)
   local.get $0
   i32.load
   i32.const 8
   i32.add
   local.set $1
   global.get $~lib/memory/__stack_pointer
   local.get $0
   i32.store offset=4
   global.get $~lib/memory/__stack_pointer
   local.get $0
   i32.load offset=4
   local.tee $2
   i32.store
   local.get $2
   call $~lib/staticarray/StaticArray<u8>#get:length
   local.get $1
   i32.lt_s
   if
    global.get $~lib/memory/__stack_pointer
    i32.const 2944
    i32.store
    i64.const 0
    i32.const 2944
    call $~lib/@massalabs/as-types/assembly/result/Result<u64>#constructor
    br $folding-inner0
   end
   global.get $~lib/memory/__stack_pointer
   local.get $0
   i32.store offset=4
   local.get $0
   i32.const 8
   call $~lib/@massalabs/as-types/assembly/argument/Args#getNextData
   local.set $0
   global.get $~lib/memory/__stack_pointer
   local.get $0
   i32.store
   global.get $~lib/memory/__stack_pointer
   i32.const 4
   i32.sub
   global.set $~lib/memory/__stack_pointer
   call $~stack_check
   global.get $~lib/memory/__stack_pointer
   i32.const 0
   i32.store
   global.get $~lib/memory/__stack_pointer
   local.get $0
   i32.store
   local.get $0
   i64.load
   local.set $3
   global.get $~lib/memory/__stack_pointer
   i32.const 4
   i32.add
   global.set $~lib/memory/__stack_pointer
   local.get $3
   i32.const 0
   call $~lib/@massalabs/as-types/assembly/result/Result<u64>#constructor
  end
  local.set $0
  global.get $~lib/memory/__stack_pointer
  i32.const 8
  i32.add
  global.set $~lib/memory/__stack_pointer
  local.get $0
 )
 (func $~lib/string/String.__not (param $0 i32) (result i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 4
  i32.sub
  global.set $~lib/memory/__stack_pointer
  call $~stack_check
  global.get $~lib/memory/__stack_pointer
  i32.const 0
  i32.store
  local.get $0
  if (result i32)
   global.get $~lib/memory/__stack_pointer
   local.get $0
   i32.store
   local.get $0
   call $~lib/string/String#get:length
   i32.eqz
  else
   i32.const 1
  end
  local.set $0
  global.get $~lib/memory/__stack_pointer
  i32.const 4
  i32.add
  global.set $~lib/memory/__stack_pointer
  local.get $0
 )
 (func $~lib/string/String.__ne (param $0 i32) (result i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 8
  i32.sub
  global.set $~lib/memory/__stack_pointer
  call $~stack_check
  global.get $~lib/memory/__stack_pointer
  i64.const 0
  i64.store
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store
  global.get $~lib/memory/__stack_pointer
  i32.const 0
  i32.store offset=4
  local.get $0
  i32.const 0
  call $~lib/string/String.__eq
  i32.eqz
  local.set $0
  global.get $~lib/memory/__stack_pointer
  i32.const 8
  i32.add
  global.set $~lib/memory/__stack_pointer
  local.get $0
 )
 (func $~lib/string/String#concat (param $0 i32) (param $1 i32) (result i32)
  (local $2 i32)
  (local $3 i32)
  (local $4 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 8
  i32.sub
  global.set $~lib/memory/__stack_pointer
  call $~stack_check
  global.get $~lib/memory/__stack_pointer
  i64.const 0
  i64.store
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store
  local.get $0
  call $~lib/string/String#get:length
  i32.const 1
  i32.shl
  local.set $3
  global.get $~lib/memory/__stack_pointer
  local.get $1
  i32.store
  block $folding-inner0
   local.get $1
   call $~lib/string/String#get:length
   i32.const 1
   i32.shl
   local.tee $4
   local.get $3
   i32.add
   local.tee $2
   i32.eqz
   if
    i32.const 2592
    local.set $2
    br $folding-inner0
   end
   global.get $~lib/memory/__stack_pointer
   local.get $2
   i32.const 2
   call $~lib/rt/itcms/__new
   local.tee $2
   i32.store offset=4
   local.get $2
   local.get $0
   local.get $3
   memory.copy
   local.get $2
   local.get $3
   i32.add
   local.get $1
   local.get $4
   memory.copy
  end
  global.get $~lib/memory/__stack_pointer
  i32.const 8
  i32.add
  global.set $~lib/memory/__stack_pointer
  local.get $2
 )
 (func $~lib/string/String.__concat (param $0 i32) (param $1 i32) (result i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 8
  i32.sub
  global.set $~lib/memory/__stack_pointer
  call $~stack_check
  global.get $~lib/memory/__stack_pointer
  i64.const 0
  i64.store
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store
  global.get $~lib/memory/__stack_pointer
  local.get $1
  i32.store offset=4
  local.get $0
  local.get $1
  call $~lib/string/String#concat
  local.set $0
  global.get $~lib/memory/__stack_pointer
  i32.const 8
  i32.add
  global.set $~lib/memory/__stack_pointer
  local.get $0
 )
 (func $~lib/util/string/joinReferenceArray<~lib/string/String> (param $0 i32) (param $1 i32) (param $2 i32) (result i32)
  (local $3 i32)
  (local $4 i32)
  (local $5 i32)
  (local $6 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 20
  i32.sub
  global.set $~lib/memory/__stack_pointer
  call $~stack_check
  global.get $~lib/memory/__stack_pointer
  i32.const 0
  i32.const 20
  memory.fill
  block $folding-inner0
   local.get $1
   i32.const 1
   i32.sub
   local.tee $4
   i32.const 0
   i32.lt_s
   if
    i32.const 2592
    local.set $0
    br $folding-inner0
   end
   local.get $4
   i32.eqz
   if
    global.get $~lib/memory/__stack_pointer
    local.get $0
    i32.load
    local.tee $0
    i32.store
    global.get $~lib/memory/__stack_pointer
    local.get $0
    i32.store offset=4
    local.get $0
    call $~lib/string/String.__ne
    if
     global.get $~lib/memory/__stack_pointer
     local.get $0
     i32.store offset=4
    else
     i32.const 2592
     local.set $0
    end
    br $folding-inner0
   end
   i32.const 2592
   local.set $1
   global.get $~lib/memory/__stack_pointer
   i32.const 2592
   i32.store offset=8
   global.get $~lib/memory/__stack_pointer
   local.get $2
   i32.store offset=4
   local.get $2
   call $~lib/string/String#get:length
   local.set $6
   loop $for-loop|0
    local.get $4
    local.get $5
    i32.gt_s
    if
     global.get $~lib/memory/__stack_pointer
     local.get $0
     local.get $5
     i32.const 2
     i32.shl
     i32.add
     i32.load
     local.tee $3
     i32.store
     global.get $~lib/memory/__stack_pointer
     local.get $3
     i32.store offset=4
     local.get $3
     call $~lib/string/String.__ne
     if
      global.get $~lib/memory/__stack_pointer
      local.get $1
      i32.store offset=4
      global.get $~lib/memory/__stack_pointer
      local.get $3
      i32.store offset=16
      global.get $~lib/memory/__stack_pointer
      local.get $3
      i32.store offset=12
      global.get $~lib/memory/__stack_pointer
      local.get $1
      local.get $3
      call $~lib/string/String.__concat
      local.tee $1
      i32.store offset=8
     end
     local.get $6
     if
      global.get $~lib/memory/__stack_pointer
      local.get $1
      i32.store offset=4
      global.get $~lib/memory/__stack_pointer
      local.get $2
      i32.store offset=12
      global.get $~lib/memory/__stack_pointer
      local.get $1
      local.get $2
      call $~lib/string/String.__concat
      local.tee $1
      i32.store offset=8
     end
     local.get $5
     i32.const 1
     i32.add
     local.set $5
     br $for-loop|0
    end
   end
   global.get $~lib/memory/__stack_pointer
   local.get $0
   local.get $4
   i32.const 2
   i32.shl
   i32.add
   i32.load
   local.tee $0
   i32.store
   global.get $~lib/memory/__stack_pointer
   local.get $0
   i32.store offset=4
   local.get $0
   call $~lib/string/String.__ne
   if
    global.get $~lib/memory/__stack_pointer
    local.get $1
    i32.store offset=4
    global.get $~lib/memory/__stack_pointer
    local.get $0
    i32.store offset=16
    global.get $~lib/memory/__stack_pointer
    local.get $0
    i32.store offset=12
    global.get $~lib/memory/__stack_pointer
    local.get $1
    local.get $0
    call $~lib/string/String.__concat
    local.tee $1
    i32.store offset=8
   end
   local.get $1
   local.set $0
  end
  global.get $~lib/memory/__stack_pointer
  i32.const 20
  i32.add
  global.set $~lib/memory/__stack_pointer
  local.get $0
 )
 (func $~lib/staticarray/StaticArray<~lib/string/String>#join (param $0 i32) (result i32)
  (local $1 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 8
  i32.sub
  global.set $~lib/memory/__stack_pointer
  call $~stack_check
  global.get $~lib/memory/__stack_pointer
  i64.const 0
  i64.store
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store offset=4
  local.get $0
  i32.const 20
  i32.sub
  i32.load offset=16
  i32.const 2
  i32.shr_u
  local.set $1
  global.get $~lib/memory/__stack_pointer
  i32.const 2592
  i32.store
  local.get $0
  local.get $1
  i32.const 2592
  call $~lib/util/string/joinReferenceArray<~lib/string/String>
  local.set $0
  global.get $~lib/memory/__stack_pointer
  i32.const 8
  i32.add
  global.set $~lib/memory/__stack_pointer
  local.get $0
 )
 (func $~lib/string/String.UTF8.encode (param $0 i32) (param $1 i32) (result i32)
  (local $2 i32)
  (local $3 i32)
  (local $4 i32)
  (local $5 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 8
  i32.sub
  global.set $~lib/memory/__stack_pointer
  call $~stack_check
  global.get $~lib/memory/__stack_pointer
  i64.const 0
  i64.store
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store
  local.get $0
  local.tee $2
  i32.const 20
  i32.sub
  i32.load offset=16
  local.get $2
  i32.add
  local.set $4
  loop $while-continue|0
   local.get $2
   local.get $4
   i32.lt_u
   if
    local.get $2
    i32.load16_u
    local.tee $5
    i32.const 128
    i32.lt_u
    if (result i32)
     local.get $3
     i32.const 1
     i32.add
    else
     local.get $5
     i32.const 2048
     i32.lt_u
     if (result i32)
      local.get $3
      i32.const 2
      i32.add
     else
      local.get $5
      i32.const 64512
      i32.and
      i32.const 55296
      i32.eq
      local.get $2
      i32.const 2
      i32.add
      local.get $4
      i32.lt_u
      i32.and
      if
       local.get $2
       i32.load16_u offset=2
       i32.const 64512
       i32.and
       i32.const 56320
       i32.eq
       if
        local.get $3
        i32.const 4
        i32.add
        local.set $3
        local.get $2
        i32.const 4
        i32.add
        local.set $2
        br $while-continue|0
       end
      end
      local.get $3
      i32.const 3
      i32.add
     end
    end
    local.set $3
    local.get $2
    i32.const 2
    i32.add
    local.set $2
    br $while-continue|0
   end
  end
  global.get $~lib/memory/__stack_pointer
  local.get $3
  i32.const 1
  call $~lib/rt/itcms/__new
  local.tee $2
  i32.store offset=4
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store
  local.get $0
  local.get $0
  call $~lib/string/String#get:length
  local.get $2
  local.get $1
  call $~lib/string/String.UTF8.encodeUnsafe
  global.get $~lib/memory/__stack_pointer
  i32.const 8
  i32.add
  global.set $~lib/memory/__stack_pointer
  local.get $2
 )
 (func $~lib/@massalabs/as-types/assembly/serialization/strings/stringToBytes (param $0 i32) (result i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 4
  i32.sub
  global.set $~lib/memory/__stack_pointer
  call $~stack_check
  global.get $~lib/memory/__stack_pointer
  i32.const 0
  i32.store
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store
  block $folding-inner0 (result i32)
   local.get $0
   call $~lib/string/String#get:length
   i32.eqz
   if
    i32.const 0
    i32.const 5
    i32.const 3744
    call $~lib/rt/__newBuffer
    br $folding-inner0
   end
   global.get $~lib/memory/__stack_pointer
   local.get $0
   i32.store
   local.get $0
   i32.const 2
   call $~lib/string/String.UTF8.encode
  end
  local.set $0
  global.get $~lib/memory/__stack_pointer
  i32.const 4
  i32.add
  global.set $~lib/memory/__stack_pointer
  local.get $0
 )
 (func $~lib/@massalabs/massa-as-sdk/assembly/std/storage/toDatastoreFormat<~lib/string/String> (param $0 i32) (result i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 4
  i32.sub
  global.set $~lib/memory/__stack_pointer
  call $~stack_check
  global.get $~lib/memory/__stack_pointer
  i32.const 0
  i32.store
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store
  local.get $0
  call $~lib/@massalabs/as-types/assembly/serialization/strings/stringToBytes
  local.set $0
  global.get $~lib/memory/__stack_pointer
  i32.const 4
  i32.add
  global.set $~lib/memory/__stack_pointer
  local.get $0
 )
 (func $~lib/@massalabs/massa-as-sdk/assembly/std/storage/set<~lib/string/String> (param $0 i32) (param $1 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 12
  i32.sub
  global.set $~lib/memory/__stack_pointer
  call $~stack_check
  global.get $~lib/memory/__stack_pointer
  i64.const 0
  i64.store
  global.get $~lib/memory/__stack_pointer
  i32.const 0
  i32.store offset=8
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store offset=8
  local.get $0
  call $~lib/@massalabs/massa-as-sdk/assembly/std/storage/toDatastoreFormat<~lib/string/String>
  local.set $0
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store
  global.get $~lib/memory/__stack_pointer
  local.get $1
  i32.store offset=8
  local.get $1
  call $~lib/@massalabs/massa-as-sdk/assembly/std/storage/toDatastoreFormat<~lib/string/String>
  local.set $1
  global.get $~lib/memory/__stack_pointer
  local.get $1
  i32.store offset=4
  local.get $0
  local.get $1
  call $~lib/@massalabs/massa-as-sdk/assembly/env/env/env.set
  global.get $~lib/memory/__stack_pointer
  i32.const 12
  i32.add
  global.set $~lib/memory/__stack_pointer
 )
 (func $assembly/contracts/main/sSetU64 (param $0 i32) (param $1 i64)
  (local $2 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 8
  i32.sub
  global.set $~lib/memory/__stack_pointer
  call $~stack_check
  global.get $~lib/memory/__stack_pointer
  i64.const 0
  i64.store
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store
  local.get $1
  call $~lib/util/number/utoa64
  local.set $2
  global.get $~lib/memory/__stack_pointer
  local.get $2
  i32.store offset=4
  local.get $0
  local.get $2
  call $~lib/@massalabs/massa-as-sdk/assembly/std/storage/set<~lib/string/String>
  global.get $~lib/memory/__stack_pointer
  i32.const 8
  i32.add
  global.set $~lib/memory/__stack_pointer
 )
 (func $~lib/@massalabs/massa-as-sdk/assembly/std/utils/events/generateEvent (param $0 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 4
  i32.sub
  global.set $~lib/memory/__stack_pointer
  call $~stack_check
  global.get $~lib/memory/__stack_pointer
  i32.const 0
  i32.store
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store
  local.get $0
  call $~lib/@massalabs/massa-as-sdk/assembly/env/env/env.generateEvent
  global.get $~lib/memory/__stack_pointer
  i32.const 4
  i32.add
  global.set $~lib/memory/__stack_pointer
 )
 (func $assembly/contracts/main/scheduleTick (param $0 i64)
  (local $1 i32)
  (local $2 i64)
  (local $3 i32)
  (local $4 i32)
  (local $5 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 36
  i32.sub
  global.set $~lib/memory/__stack_pointer
  call $~stack_check
  global.get $~lib/memory/__stack_pointer
  i32.const 0
  i32.const 36
  memory.fill
  call $~lib/@massalabs/massa-as-sdk/assembly/env/env/env.currentThread
  local.set $1
  global.get $~lib/memory/__stack_pointer
  local.set $3
  global.get $~lib/memory/__stack_pointer
  i32.const 8
  i32.sub
  global.set $~lib/memory/__stack_pointer
  call $~stack_check
  global.get $~lib/memory/__stack_pointer
  i64.const 0
  i64.store
  global.get $~lib/memory/__stack_pointer
  i32.const 9
  i32.const 16
  call $~lib/rt/itcms/__new
  local.tee $4
  i32.store
  global.get $~lib/memory/__stack_pointer
  local.get $4
  i32.store offset=4
  local.get $4
  i64.const 0
  call $~lib/@massalabs/as-types/assembly/result/Result<u64>#set:value
  global.get $~lib/memory/__stack_pointer
  local.get $4
  i32.store offset=4
  local.get $4
  i32.const 0
  call $~lib/@massalabs/massa-as-sdk/assembly/std/context/Slot#set:thread
  global.get $~lib/memory/__stack_pointer
  local.get $4
  i32.store offset=4
  local.get $4
  local.get $0
  call $~lib/@massalabs/as-types/assembly/result/Result<u64>#set:value
  global.get $~lib/memory/__stack_pointer
  local.get $4
  i32.store offset=4
  local.get $4
  local.get $1
  call $~lib/@massalabs/massa-as-sdk/assembly/std/context/Slot#set:thread
  global.get $~lib/memory/__stack_pointer
  i32.const 8
  i32.add
  global.set $~lib/memory/__stack_pointer
  local.get $3
  local.get $4
  i32.store
  global.get $~lib/memory/__stack_pointer
  local.set $3
  call $~lib/@massalabs/massa-as-sdk/assembly/std/context/callee
  local.set $1
  global.get $~lib/memory/__stack_pointer
  local.get $1
  i32.store offset=20
  local.get $1
  call $~lib/@massalabs/massa-as-sdk/assembly/std/address/Address#toString
  local.set $5
  global.get $~lib/memory/__stack_pointer
  local.get $5
  i32.store offset=4
  global.get $~lib/memory/__stack_pointer
  i32.const 3888
  i32.store offset=8
  global.get $~lib/memory/__stack_pointer
  local.get $4
  i32.store offset=12
  i32.const 0
  i32.const 5
  i32.const 3920
  call $~lib/rt/__newBuffer
  local.set $1
  global.get $~lib/memory/__stack_pointer
  local.get $1
  i32.store offset=16
  global.get $~lib/memory/__stack_pointer
  i32.const 16
  i32.sub
  global.set $~lib/memory/__stack_pointer
  call $~stack_check
  global.get $~lib/memory/__stack_pointer
  i64.const 0
  i64.store
  global.get $~lib/memory/__stack_pointer
  i64.const 0
  i64.store offset=8
  global.get $~lib/memory/__stack_pointer
  local.get $5
  i32.store
  global.get $~lib/memory/__stack_pointer
  i32.const 3888
  i32.store offset=4
  global.get $~lib/memory/__stack_pointer
  local.get $4
  i32.store offset=12
  local.get $4
  i64.load
  local.set $2
  global.get $~lib/memory/__stack_pointer
  local.get $4
  i32.store offset=12
  local.get $4
  i32.load8_u offset=8
  local.set $4
  global.get $~lib/memory/__stack_pointer
  local.get $1
  i32.store offset=8
  local.get $5
  i32.const 3888
  local.get $2
  local.get $4
  i64.const 2000000
  local.get $1
  i64.const 0
  call $~lib/@massalabs/massa-as-sdk/assembly/env/env/env.deferredCallRegister
  local.set $1
  global.get $~lib/memory/__stack_pointer
  i32.const 16
  i32.add
  global.set $~lib/memory/__stack_pointer
  local.get $3
  local.get $1
  i32.store offset=24
  global.get $~lib/memory/__stack_pointer
  local.get $0
  call $~lib/util/number/utoa64
  local.tee $3
  i32.store offset=28
  global.get $~lib/memory/__stack_pointer
  local.get $1
  i32.store offset=32
  global.get $~lib/memory/__stack_pointer
  i32.const 4048
  i32.store offset=8
  global.get $~lib/memory/__stack_pointer
  local.get $3
  i32.store offset=12
  i32.const 4048
  i32.const 1
  local.get $3
  call $~lib/staticarray/StaticArray<~lib/string/String>#__uset
  global.get $~lib/memory/__stack_pointer
  i32.const 4048
  i32.store offset=8
  global.get $~lib/memory/__stack_pointer
  local.get $1
  i32.store offset=12
  i32.const 4048
  i32.const 3
  local.get $1
  call $~lib/staticarray/StaticArray<~lib/string/String>#__uset
  global.get $~lib/memory/__stack_pointer
  i32.const 4048
  i32.store offset=8
  global.get $~lib/memory/__stack_pointer
  i32.const 2592
  i32.store offset=12
  i32.const 4048
  call $~lib/staticarray/StaticArray<~lib/string/String>#join
  local.set $1
  global.get $~lib/memory/__stack_pointer
  local.get $1
  i32.store offset=4
  local.get $1
  call $~lib/@massalabs/massa-as-sdk/assembly/std/utils/events/generateEvent
  global.get $~lib/memory/__stack_pointer
  i32.const 36
  i32.add
  global.set $~lib/memory/__stack_pointer
 )
 (func $assembly/contracts/main/constructor (param $0 i32)
  (local $1 i64)
  (local $2 i64)
  (local $3 i64)
  (local $4 i32)
  (local $5 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 88
  i32.sub
  global.set $~lib/memory/__stack_pointer
  call $~stack_check
  global.get $~lib/memory/__stack_pointer
  i32.const 0
  i32.const 88
  memory.fill
  call $~lib/@massalabs/massa-as-sdk/assembly/env/env/env.callerHasWriteAccess
  if (result i32)
   call $~lib/@massalabs/massa-as-sdk/assembly/std/context/callee
   local.set $4
   global.get $~lib/memory/__stack_pointer
   local.get $4
   i32.store
   call $~lib/@massalabs/massa-as-sdk/assembly/std/context/caller
   local.set $5
   global.get $~lib/memory/__stack_pointer
   local.get $5
   i32.store offset=4
   global.get $~lib/memory/__stack_pointer
   i32.const 8
   i32.sub
   global.set $~lib/memory/__stack_pointer
   call $~stack_check
   global.get $~lib/memory/__stack_pointer
   i64.const 0
   i64.store
   global.get $~lib/memory/__stack_pointer
   local.get $4
   i32.store
   global.get $~lib/memory/__stack_pointer
   local.get $5
   i32.store offset=4
   global.get $~lib/memory/__stack_pointer
   i32.const 12
   i32.sub
   global.set $~lib/memory/__stack_pointer
   call $~stack_check
   global.get $~lib/memory/__stack_pointer
   i64.const 0
   i64.store
   global.get $~lib/memory/__stack_pointer
   i32.const 0
   i32.store offset=8
   global.get $~lib/memory/__stack_pointer
   local.get $4
   i32.store offset=8
   global.get $~lib/memory/__stack_pointer
   local.get $4
   i32.load
   local.tee $4
   i32.store
   global.get $~lib/memory/__stack_pointer
   local.get $5
   i32.store offset=8
   local.get $5
   call $~lib/@massalabs/massa-as-sdk/assembly/std/address/Address#toString
   local.set $5
   global.get $~lib/memory/__stack_pointer
   local.get $5
   i32.store offset=4
   local.get $4
   local.get $5
   call $~lib/string/String.__eq
   local.set $4
   global.get $~lib/memory/__stack_pointer
   i32.const 12
   i32.add
   global.set $~lib/memory/__stack_pointer
   global.get $~lib/memory/__stack_pointer
   i32.const 8
   i32.add
   global.set $~lib/memory/__stack_pointer
   local.get $4
   i32.eqz
  else
   i32.const 0
  end
  i32.eqz
  if
   i32.const 0
   i32.const 2864
   i32.const 106
   i32.const 3
   call $~lib/builtins/abort
   unreachable
  end
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store
  global.get $~lib/memory/__stack_pointer
  local.get $0
  call $~lib/@massalabs/as-types/assembly/argument/Args#constructor
  local.tee $0
  i32.store offset=8
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store
  global.get $~lib/memory/__stack_pointer
  local.get $0
  call $~lib/@massalabs/as-types/assembly/argument/Args#nextU64
  local.tee $4
  i32.store offset=12
  global.get $~lib/memory/__stack_pointer
  i32.const 1856
  i32.store offset=16
  global.get $~lib/memory/__stack_pointer
  local.get $4
  i32.store offset=20
  global.get $~lib/memory/__stack_pointer
  local.get $4
  i32.store offset=24
  global.get $~lib/memory/__stack_pointer
  local.get $4
  i32.store offset=4
  global.get $~lib/memory/__stack_pointer
  local.get $4
  i32.load offset=8
  local.tee $5
  i32.store
  block $folding-inner1
   block $folding-inner0
    local.get $5
    call $~lib/string/String.__not
    i32.eqz
    if
     global.get $~lib/memory/__stack_pointer
     i32.const 1856
     i32.store offset=28
     global.get $~lib/memory/__stack_pointer
     local.get $4
     i32.store
     global.get $~lib/memory/__stack_pointer
     local.get $4
     i32.load offset=8
     local.tee $4
     i32.store offset=32
     local.get $4
     i32.eqz
     br_if $folding-inner0
     global.get $~lib/memory/__stack_pointer
     local.get $4
     i32.store offset=36
     global.get $~lib/memory/__stack_pointer
     i32.const 3120
     i32.store
     global.get $~lib/memory/__stack_pointer
     i32.const 1856
     i32.store offset=4
     i32.const 3120
     i32.const 0
     i32.const 1856
     call $~lib/staticarray/StaticArray<~lib/string/String>#__uset
     i32.const 3120
     local.set $0
     global.get $~lib/memory/__stack_pointer
     i32.const 3120
     i32.store
     global.get $~lib/memory/__stack_pointer
     local.get $4
     i32.store offset=4
     i32.const 3120
     i32.const 2
     local.get $4
     call $~lib/staticarray/StaticArray<~lib/string/String>#__uset
     global.get $~lib/memory/__stack_pointer
     i32.const 3120
     i32.store
     br $folding-inner1
    end
    global.get $~lib/memory/__stack_pointer
    local.get $4
    i32.store offset=40
    global.get $~lib/memory/__stack_pointer
    local.get $4
    i32.store
    local.get $4
    i64.load
    local.set $1
    global.get $~lib/memory/__stack_pointer
    local.get $0
    i32.store
    global.get $~lib/memory/__stack_pointer
    local.get $0
    call $~lib/@massalabs/as-types/assembly/argument/Args#nextU64
    local.tee $0
    i32.store offset=44
    global.get $~lib/memory/__stack_pointer
    i32.const 1904
    i32.store offset=48
    global.get $~lib/memory/__stack_pointer
    local.get $0
    i32.store offset=52
    global.get $~lib/memory/__stack_pointer
    local.get $0
    i32.store offset=56
    global.get $~lib/memory/__stack_pointer
    local.get $0
    i32.store offset=4
    global.get $~lib/memory/__stack_pointer
    local.get $0
    i32.load offset=8
    local.tee $4
    i32.store
    local.get $4
    call $~lib/string/String.__not
    i32.eqz
    if
     global.get $~lib/memory/__stack_pointer
     i32.const 1904
     i32.store offset=60
     global.get $~lib/memory/__stack_pointer
     local.get $0
     i32.store
     global.get $~lib/memory/__stack_pointer
     local.get $0
     i32.load offset=8
     local.tee $4
     i32.store offset=64
     local.get $4
     i32.eqz
     br_if $folding-inner0
     global.get $~lib/memory/__stack_pointer
     local.get $4
     i32.store offset=68
     global.get $~lib/memory/__stack_pointer
     i32.const 3392
     i32.store
     global.get $~lib/memory/__stack_pointer
     i32.const 1904
     i32.store offset=4
     i32.const 3392
     i32.const 0
     i32.const 1904
     call $~lib/staticarray/StaticArray<~lib/string/String>#__uset
     i32.const 3392
     local.set $0
     global.get $~lib/memory/__stack_pointer
     i32.const 3392
     i32.store
     global.get $~lib/memory/__stack_pointer
     local.get $4
     i32.store offset=4
     i32.const 3392
     i32.const 2
     local.get $4
     call $~lib/staticarray/StaticArray<~lib/string/String>#__uset
     global.get $~lib/memory/__stack_pointer
     i32.const 3392
     i32.store
     br $folding-inner1
    end
    global.get $~lib/memory/__stack_pointer
    local.get $0
    i32.store offset=72
    global.get $~lib/memory/__stack_pointer
    local.get $0
    i32.store
    local.get $0
    i64.load
    local.set $2
    global.get $~lib/memory/__stack_pointer
    i32.const 1856
    i32.store
    i32.const 1856
    local.get $1
    call $assembly/contracts/main/sSetU64
    global.get $~lib/memory/__stack_pointer
    i32.const 1904
    i32.store
    i32.const 1904
    local.get $2
    call $assembly/contracts/main/sSetU64
    global.get $~lib/memory/__stack_pointer
    i32.const 1744
    i32.store
    i32.const 1744
    i64.const 0
    call $assembly/contracts/main/sSetU64
    global.get $~lib/memory/__stack_pointer
    i32.const 2064
    i32.store
    i32.const 2064
    i64.const 100000000
    call $assembly/contracts/main/sSetU64
    global.get $~lib/memory/__stack_pointer
    i32.const 2128
    i32.store
    i32.const 2128
    i64.const 0
    call $assembly/contracts/main/sSetU64
    global.get $~lib/memory/__stack_pointer
    i32.const 1952
    i32.store
    i32.const 1952
    i64.const 0
    call $assembly/contracts/main/sSetU64
    global.get $~lib/memory/__stack_pointer
    i32.const 2240
    i32.store
    i32.const 2240
    i64.const 0
    call $assembly/contracts/main/sSetU64
    global.get $~lib/memory/__stack_pointer
    i32.const 2304
    i32.store
    i32.const 2304
    i64.const 0
    call $assembly/contracts/main/sSetU64
    global.get $~lib/memory/__stack_pointer
    i32.const 2352
    i32.store
    i32.const 2352
    i64.const 0
    call $assembly/contracts/main/sSetU64
    global.get $~lib/memory/__stack_pointer
    i32.const 2400
    i32.store
    i32.const 2400
    i64.const 0
    call $assembly/contracts/main/sSetU64
    global.get $~lib/memory/__stack_pointer
    i32.const 2464
    i32.store
    i32.const 2464
    i64.const 0
    call $assembly/contracts/main/sSetU64
    global.get $~lib/memory/__stack_pointer
    i32.const 2528
    i32.store
    i32.const 2528
    i64.const 0
    call $assembly/contracts/main/sSetU64
    call $~lib/@massalabs/massa-as-sdk/assembly/env/env/env.currentPeriod
    local.set $3
    global.get $~lib/memory/__stack_pointer
    i32.const 1792
    i32.store
    i32.const 1792
    local.get $1
    local.get $3
    i64.add
    call $assembly/contracts/main/sSetU64
    local.get $2
    local.get $3
    i64.add
    call $assembly/contracts/main/scheduleTick
    global.get $~lib/memory/__stack_pointer
    local.get $1
    call $~lib/util/number/utoa64
    local.tee $0
    i32.store offset=76
    global.get $~lib/memory/__stack_pointer
    local.get $2
    call $~lib/util/number/utoa64
    local.tee $4
    i32.store offset=80
    global.get $~lib/memory/__stack_pointer
    i32.const 4208
    i32.store offset=4
    global.get $~lib/memory/__stack_pointer
    local.get $0
    i32.store offset=84
    i32.const 4208
    i32.const 1
    local.get $0
    call $~lib/staticarray/StaticArray<~lib/string/String>#__uset
    global.get $~lib/memory/__stack_pointer
    i32.const 4208
    i32.store offset=4
    global.get $~lib/memory/__stack_pointer
    local.get $4
    i32.store offset=84
    i32.const 4208
    i32.const 3
    local.get $4
    call $~lib/staticarray/StaticArray<~lib/string/String>#__uset
    global.get $~lib/memory/__stack_pointer
    i32.const 4208
    i32.store offset=4
    global.get $~lib/memory/__stack_pointer
    i32.const 2592
    i32.store offset=84
    i32.const 4208
    call $~lib/staticarray/StaticArray<~lib/string/String>#join
    local.set $0
    global.get $~lib/memory/__stack_pointer
    local.get $0
    i32.store
    local.get $0
    call $~lib/@massalabs/massa-as-sdk/assembly/std/utils/events/generateEvent
    global.get $~lib/memory/__stack_pointer
    i32.const 88
    i32.add
    global.set $~lib/memory/__stack_pointer
    return
   end
   i32.const 3152
   i32.const 3280
   i32.const 52
   i32.const 32
   call $~lib/builtins/abort
   unreachable
  end
  global.get $~lib/memory/__stack_pointer
  i32.const 2592
  i32.store offset=4
  local.get $0
  call $~lib/staticarray/StaticArray<~lib/string/String>#join
  i32.const 3280
  i32.const 52
  i32.const 7
  call $~lib/builtins/abort
  unreachable
 )
 (func $~lib/@massalabs/massa-as-sdk/assembly/std/storage/has<~lib/string/String> (param $0 i32) (result i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 8
  i32.sub
  global.set $~lib/memory/__stack_pointer
  call $~stack_check
  global.get $~lib/memory/__stack_pointer
  i64.const 0
  i64.store
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store offset=4
  local.get $0
  call $~lib/@massalabs/massa-as-sdk/assembly/std/storage/toDatastoreFormat<~lib/string/String>
  local.set $0
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store
  local.get $0
  call $~lib/@massalabs/massa-as-sdk/assembly/env/env/env.has
  local.set $0
  global.get $~lib/memory/__stack_pointer
  i32.const 8
  i32.add
  global.set $~lib/memory/__stack_pointer
  local.get $0
 )
 (func $~lib/@massalabs/as-types/assembly/serialization/strings/bytesToString (param $0 i32) (result i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 4
  i32.sub
  global.set $~lib/memory/__stack_pointer
  call $~stack_check
  global.get $~lib/memory/__stack_pointer
  i32.const 0
  i32.store
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store
  block $folding-inner0
   local.get $0
   call $~lib/staticarray/StaticArray<u8>#get:length
   i32.eqz
   if
    i32.const 2592
    local.set $0
    br $folding-inner0
   end
   global.get $~lib/memory/__stack_pointer
   local.get $0
   i32.store
   global.get $~lib/memory/__stack_pointer
   i32.const 4
   i32.sub
   global.set $~lib/memory/__stack_pointer
   call $~stack_check
   global.get $~lib/memory/__stack_pointer
   i32.const 0
   i32.store
   global.get $~lib/memory/__stack_pointer
   local.get $0
   i32.store
   local.get $0
   local.get $0
   call $~lib/staticarray/StaticArray<u8>#get:length
   call $~lib/string/String.UTF8.decodeUnsafe
   local.set $0
   global.get $~lib/memory/__stack_pointer
   i32.const 4
   i32.add
   global.set $~lib/memory/__stack_pointer
  end
  global.get $~lib/memory/__stack_pointer
  i32.const 4
  i32.add
  global.set $~lib/memory/__stack_pointer
  local.get $0
 )
 (func $~lib/@massalabs/massa-as-sdk/assembly/std/storage/get<~lib/string/String> (param $0 i32) (result i32)
  (local $1 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 12
  i32.sub
  global.set $~lib/memory/__stack_pointer
  call $~stack_check
  global.get $~lib/memory/__stack_pointer
  i64.const 0
  i64.store
  global.get $~lib/memory/__stack_pointer
  i32.const 0
  i32.store offset=8
  global.get $~lib/memory/__stack_pointer
  local.set $1
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store offset=4
  local.get $0
  call $~lib/@massalabs/massa-as-sdk/assembly/std/storage/toDatastoreFormat<~lib/string/String>
  local.set $0
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store
  local.get $1
  local.get $0
  call $~lib/@massalabs/massa-as-sdk/assembly/env/env/env.get
  local.tee $0
  i32.store offset=8
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store
  global.get $~lib/memory/__stack_pointer
  i32.const 4
  i32.sub
  global.set $~lib/memory/__stack_pointer
  call $~stack_check
  global.get $~lib/memory/__stack_pointer
  i32.const 0
  i32.store
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store
  local.get $0
  call $~lib/@massalabs/as-types/assembly/serialization/strings/bytesToString
  local.set $0
  global.get $~lib/memory/__stack_pointer
  i32.const 4
  i32.add
  global.set $~lib/memory/__stack_pointer
  global.get $~lib/memory/__stack_pointer
  i32.const 12
  i32.add
  global.set $~lib/memory/__stack_pointer
  local.get $0
 )
 (func $~lib/util/string/strtol<f64> (param $0 i32) (result f64)
  (local $1 i32)
  (local $2 i32)
  (local $3 i32)
  (local $4 f64)
  (local $5 f64)
  (local $6 i32)
  (local $7 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 4
  i32.sub
  global.set $~lib/memory/__stack_pointer
  call $~stack_check
  global.get $~lib/memory/__stack_pointer
  i32.const 0
  i32.store
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store
  block $folding-inner1 (result f64)
   block $folding-inner0
    local.get $0
    call $~lib/string/String#get:length
    local.tee $1
    i32.eqz
    br_if $folding-inner0
    local.get $0
    local.tee $2
    i32.load16_u
    local.set $0
    loop $while-continue|0
     block $__inlined_func$~lib/util/string/isSpace$108 (result i32)
      local.get $0
      i32.const 128
      i32.or
      i32.const 160
      i32.eq
      local.get $0
      i32.const 9
      i32.sub
      i32.const 4
      i32.le_u
      i32.or
      local.get $0
      i32.const 5760
      i32.lt_u
      br_if $__inlined_func$~lib/util/string/isSpace$108
      drop
      i32.const 1
      local.get $0
      i32.const -8192
      i32.add
      i32.const 10
      i32.le_u
      br_if $__inlined_func$~lib/util/string/isSpace$108
      drop
      i32.const 1
      local.get $0
      i32.const 5760
      i32.eq
      local.get $0
      i32.const 8232
      i32.eq
      i32.or
      local.get $0
      i32.const 8233
      i32.eq
      local.get $0
      i32.const 8239
      i32.eq
      i32.or
      i32.or
      local.get $0
      i32.const 8287
      i32.eq
      local.get $0
      i32.const 12288
      i32.eq
      i32.or
      local.get $0
      i32.const 65279
      i32.eq
      i32.or
      i32.or
      br_if $__inlined_func$~lib/util/string/isSpace$108
      drop
      i32.const 0
     end
     if
      local.get $2
      i32.const 2
      i32.add
      local.tee $2
      i32.load16_u
      local.set $0
      local.get $1
      i32.const 1
      i32.sub
      local.set $1
      br $while-continue|0
     end
    end
    f64.const 1
    local.set $4
    local.get $0
    i32.const 45
    i32.eq
    local.tee $6
    local.get $0
    i32.const 43
    i32.eq
    i32.or
    if (result i32)
     local.get $1
     i32.const 1
     i32.sub
     local.tee $1
     i32.eqz
     br_if $folding-inner0
     f64.const -1
     f64.const 1
     local.get $6
     select
     local.set $4
     local.get $2
     i32.const 2
     i32.add
     local.tee $2
     i32.load16_u
    else
     local.get $0
    end
    i32.const 48
    i32.eq
    local.get $1
    i32.const 2
    i32.gt_s
    i32.and
    if
     block $break|1
      block $case2|1
       block $case1|1
        local.get $2
        i32.load16_u offset=2
        i32.const 32
        i32.or
        local.tee $0
        i32.const 98
        i32.ne
        if
         local.get $0
         i32.const 111
         i32.eq
         br_if $case1|1
         local.get $0
         i32.const 120
         i32.eq
         br_if $case2|1
         br $break|1
        end
        local.get $2
        i32.const 4
        i32.add
        local.set $2
        local.get $1
        i32.const 2
        i32.sub
        local.set $1
        i32.const 2
        local.set $3
        br $break|1
       end
       local.get $2
       i32.const 4
       i32.add
       local.set $2
       local.get $1
       i32.const 2
       i32.sub
       local.set $1
       i32.const 8
       local.set $3
       br $break|1
      end
      local.get $2
      i32.const 4
      i32.add
      local.set $2
      local.get $1
      i32.const 2
      i32.sub
      local.set $1
      i32.const 16
      local.set $3
     end
    end
    local.get $3
    i32.const 10
    local.get $3
    select
    local.set $3
    local.get $1
    i32.const 1
    i32.sub
    local.set $6
    loop $while-continue|2
     local.get $1
     local.tee $0
     i32.const 1
     i32.sub
     local.set $1
     local.get $0
     if
      block $while-break|2
       local.get $2
       i32.load16_u
       local.tee $7
       i32.const 48
       i32.sub
       local.tee $0
       local.get $7
       i32.const 55
       i32.sub
       local.get $7
       i32.const 87
       i32.sub
       local.get $7
       local.get $7
       i32.const 97
       i32.sub
       i32.const 25
       i32.le_u
       select
       local.get $7
       i32.const 65
       i32.sub
       i32.const 25
       i32.le_u
       select
       local.get $0
       i32.const 10
       i32.lt_u
       select
       local.tee $0
       local.get $3
       i32.ge_u
       if
        local.get $1
        local.get $6
        i32.eq
        br_if $folding-inner0
        br $while-break|2
       end
       local.get $5
       local.get $3
       f64.convert_i32_s
       f64.mul
       local.get $0
       f64.convert_i32_u
       f64.add
       local.set $5
       local.get $2
       i32.const 2
       i32.add
       local.set $2
       br $while-continue|2
      end
     end
    end
    local.get $4
    local.get $5
    f64.mul
    br $folding-inner1
   end
   f64.const nan:0x8000000000000
  end
  local.set $4
  global.get $~lib/memory/__stack_pointer
  i32.const 4
  i32.add
  global.set $~lib/memory/__stack_pointer
  local.get $4
 )
 (func $assembly/contracts/main/sGetU64 (param $0 i32) (result i64)
  (local $1 i32)
  (local $2 f64)
  (local $3 i64)
  global.get $~lib/memory/__stack_pointer
  i32.const 8
  i32.sub
  global.set $~lib/memory/__stack_pointer
  call $~stack_check
  global.get $~lib/memory/__stack_pointer
  i64.const 0
  i64.store
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store
  global.get $~lib/memory/__stack_pointer
  i32.const 4
  i32.sub
  global.set $~lib/memory/__stack_pointer
  call $~stack_check
  global.get $~lib/memory/__stack_pointer
  i32.const 0
  i32.store
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store
  local.get $0
  call $~lib/@massalabs/massa-as-sdk/assembly/std/storage/has<~lib/string/String>
  local.set $1
  global.get $~lib/memory/__stack_pointer
  i32.const 4
  i32.add
  global.set $~lib/memory/__stack_pointer
  local.get $1
  if (result i64)
   global.get $~lib/memory/__stack_pointer
   local.get $0
   i32.store offset=4
   local.get $0
   call $~lib/@massalabs/massa-as-sdk/assembly/std/storage/get<~lib/string/String>
   local.set $0
   global.get $~lib/memory/__stack_pointer
   local.get $0
   i32.store
   global.get $~lib/memory/__stack_pointer
   i32.const 4
   i32.sub
   global.set $~lib/memory/__stack_pointer
   call $~stack_check
   global.get $~lib/memory/__stack_pointer
   i32.const 0
   i32.store
   global.get $~lib/memory/__stack_pointer
   local.get $0
   i32.store
   local.get $0
   call $~lib/util/string/strtol<f64>
   local.set $2
   global.get $~lib/memory/__stack_pointer
   i32.const 4
   i32.add
   global.set $~lib/memory/__stack_pointer
   local.get $2
   i64.trunc_sat_f64_u
  else
   i64.const 0
  end
  local.set $3
  global.get $~lib/memory/__stack_pointer
  i32.const 8
  i32.add
  global.set $~lib/memory/__stack_pointer
  local.get $3
 )
 (func $assembly/contracts/main/seedScheduler
  i32.const 4288
  i32.const 2016
  i32.const 155
  i32.const 4256
  call $byn$mgfn-shared$assembly/contracts/main/seedScheduler
 )
 (func $assembly/contracts/main/addToPrizePool
  i32.const 4384
  i32.const 1744
  i32.const 163
  i32.const 4336
  call $byn$mgfn-shared$assembly/contracts/main/seedScheduler
 )
 (func $assembly/contracts/main/userPrincipalConservativeKey (param $0 i32) (result i32)
  local.get $0
  i32.const 4512
  call $byn$mgfn-shared$assembly/contracts/main/userPrincipalConservativeKey
 )
 (func $assembly/contracts/main/participantKey (param $0 i32) (result i32)
  local.get $0
  i32.const 4592
  call $byn$mgfn-shared$assembly/contracts/main/participantKey
 )
 (func $assembly/contracts/main/userTicketsConservativeKey (param $0 i32) (result i32)
  local.get $0
  i32.const 4624
  call $byn$mgfn-shared$assembly/contracts/main/userPrincipalConservativeKey
 )
 (func $assembly/contracts/main/userTierKey (param $0 i32) (result i32)
  local.get $0
  i32.const 4704
  call $byn$mgfn-shared$assembly/contracts/main/userPrincipalConservativeKey
 )
 (func $assembly/contracts/main/depositConservative
  (local $0 i32)
  (local $1 i64)
  (local $2 i64)
  (local $3 i64)
  (local $4 i32)
  (local $5 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 28
  i32.sub
  global.set $~lib/memory/__stack_pointer
  call $~stack_check
  global.get $~lib/memory/__stack_pointer
  i32.const 0
  i32.const 28
  memory.fill
  call $~lib/@massalabs/massa-as-sdk/assembly/env/env/env.callCoins
  local.tee $1
  i64.eqz
  if
   global.get $~lib/memory/__stack_pointer
   i32.const 4448
   i32.store
   i32.const 4448
   call $~lib/@massalabs/massa-as-sdk/assembly/std/utils/events/generateEvent
   global.get $~lib/memory/__stack_pointer
   i32.const 28
   i32.add
   global.set $~lib/memory/__stack_pointer
   return
  end
  global.get $~lib/memory/__stack_pointer
  local.set $0
  call $~lib/@massalabs/massa-as-sdk/assembly/std/context/caller
  local.set $4
  global.get $~lib/memory/__stack_pointer
  local.get $4
  i32.store
  local.get $0
  local.get $4
  call $~lib/@massalabs/massa-as-sdk/assembly/std/address/Address#toString
  local.tee $0
  i32.store offset=4
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store offset=8
  local.get $0
  call $assembly/contracts/main/userPrincipalConservativeKey
  local.set $4
  global.get $~lib/memory/__stack_pointer
  local.get $4
  i32.store
  local.get $4
  call $assembly/contracts/main/sGetU64
  i64.eqz
  if
   global.get $~lib/memory/__stack_pointer
   i32.const 1952
   i32.store
   i32.const 1952
   call $assembly/contracts/main/sGetU64
   i32.wrap_i64
   local.tee $4
   call $assembly/contracts/main/participantKey
   local.set $5
   global.get $~lib/memory/__stack_pointer
   local.get $5
   i32.store
   global.get $~lib/memory/__stack_pointer
   local.get $0
   i32.store offset=8
   local.get $5
   local.get $0
   call $~lib/@massalabs/massa-as-sdk/assembly/std/storage/set<~lib/string/String>
   global.get $~lib/memory/__stack_pointer
   i32.const 1952
   i32.store
   i32.const 1952
   local.get $4
   i32.const 1
   i32.add
   i64.extend_i32_s
   call $assembly/contracts/main/sSetU64
  end
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store offset=8
  local.get $0
  call $assembly/contracts/main/userPrincipalConservativeKey
  local.set $4
  global.get $~lib/memory/__stack_pointer
  local.get $4
  i32.store
  local.get $4
  call $assembly/contracts/main/sGetU64
  local.set $2
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store offset=8
  local.get $0
  call $assembly/contracts/main/userTicketsConservativeKey
  local.set $4
  global.get $~lib/memory/__stack_pointer
  local.get $4
  i32.store
  local.get $4
  call $assembly/contracts/main/sGetU64
  local.set $3
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store offset=8
  local.get $0
  call $assembly/contracts/main/userPrincipalConservativeKey
  local.set $4
  global.get $~lib/memory/__stack_pointer
  local.get $4
  i32.store
  local.get $4
  local.get $1
  local.get $2
  i64.add
  call $assembly/contracts/main/sSetU64
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store offset=8
  local.get $0
  call $assembly/contracts/main/userTicketsConservativeKey
  local.set $4
  global.get $~lib/memory/__stack_pointer
  local.get $4
  i32.store
  local.get $4
  local.get $1
  local.get $3
  i64.add
  call $assembly/contracts/main/sSetU64
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store offset=12
  local.get $0
  call $assembly/contracts/main/userTierKey
  local.set $4
  global.get $~lib/memory/__stack_pointer
  local.get $4
  i32.store
  global.get $~lib/memory/__stack_pointer
  i32.const 4752
  i32.store offset=8
  local.get $4
  i32.const 4752
  call $~lib/@massalabs/massa-as-sdk/assembly/std/storage/set<~lib/string/String>
  global.get $~lib/memory/__stack_pointer
  i32.const 2240
  i32.store
  global.get $~lib/memory/__stack_pointer
  i32.const 2240
  i32.store offset=8
  i32.const 2240
  i32.const 2240
  call $assembly/contracts/main/sGetU64
  local.get $1
  i64.add
  call $assembly/contracts/main/sSetU64
  global.get $~lib/memory/__stack_pointer
  i32.const 2400
  i32.store
  global.get $~lib/memory/__stack_pointer
  i32.const 2400
  i32.store offset=8
  i32.const 2400
  i32.const 2400
  call $assembly/contracts/main/sGetU64
  local.get $1
  i64.add
  call $assembly/contracts/main/sSetU64
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store offset=16
  global.get $~lib/memory/__stack_pointer
  local.get $1
  call $~lib/util/number/utoa64
  local.tee $4
  i32.store offset=20
  global.get $~lib/memory/__stack_pointer
  local.get $1
  call $~lib/util/number/utoa64
  local.tee $5
  i32.store offset=24
  global.get $~lib/memory/__stack_pointer
  i32.const 4864
  i32.store offset=8
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store offset=12
  i32.const 4864
  i32.const 1
  local.get $0
  call $~lib/staticarray/StaticArray<~lib/string/String>#__uset
  global.get $~lib/memory/__stack_pointer
  i32.const 4864
  i32.store offset=8
  global.get $~lib/memory/__stack_pointer
  local.get $4
  i32.store offset=12
  i32.const 4864
  i32.const 3
  local.get $4
  call $~lib/staticarray/StaticArray<~lib/string/String>#__uset
  global.get $~lib/memory/__stack_pointer
  i32.const 4864
  i32.store offset=8
  global.get $~lib/memory/__stack_pointer
  local.get $5
  i32.store offset=12
  i32.const 4864
  i32.const 5
  local.get $5
  call $~lib/staticarray/StaticArray<~lib/string/String>#__uset
  global.get $~lib/memory/__stack_pointer
  i32.const 4864
  i32.store offset=8
  global.get $~lib/memory/__stack_pointer
  i32.const 2592
  i32.store offset=12
  i32.const 4864
  call $~lib/staticarray/StaticArray<~lib/string/String>#join
  local.set $0
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store
  local.get $0
  call $~lib/@massalabs/massa-as-sdk/assembly/std/utils/events/generateEvent
  global.get $~lib/memory/__stack_pointer
  i32.const 28
  i32.add
  global.set $~lib/memory/__stack_pointer
 )
 (func $assembly/contracts/main/userPrincipalModerateKey (param $0 i32) (result i32)
  local.get $0
  i32.const 4912
  call $byn$mgfn-shared$assembly/contracts/main/userPrincipalConservativeKey
 )
 (func $assembly/contracts/main/userTicketsModerateKey (param $0 i32) (result i32)
  local.get $0
  i32.const 4992
  call $byn$mgfn-shared$assembly/contracts/main/userPrincipalConservativeKey
 )
 (func $assembly/contracts/main/depositModerate
  (local $0 i32)
  (local $1 i64)
  (local $2 i64)
  (local $3 i32)
  (local $4 i32)
  (local $5 i64)
  global.get $~lib/memory/__stack_pointer
  i32.const 28
  i32.sub
  global.set $~lib/memory/__stack_pointer
  call $~stack_check
  global.get $~lib/memory/__stack_pointer
  i32.const 0
  i32.const 28
  memory.fill
  call $~lib/@massalabs/massa-as-sdk/assembly/env/env/env.callCoins
  local.tee $1
  i64.eqz
  if
   global.get $~lib/memory/__stack_pointer
   i32.const 4448
   i32.store
   i32.const 4448
   call $~lib/@massalabs/massa-as-sdk/assembly/std/utils/events/generateEvent
   global.get $~lib/memory/__stack_pointer
   i32.const 28
   i32.add
   global.set $~lib/memory/__stack_pointer
   return
  end
  global.get $~lib/memory/__stack_pointer
  local.set $0
  call $~lib/@massalabs/massa-as-sdk/assembly/std/context/caller
  local.set $3
  global.get $~lib/memory/__stack_pointer
  local.get $3
  i32.store
  local.get $0
  local.get $3
  call $~lib/@massalabs/massa-as-sdk/assembly/std/address/Address#toString
  local.tee $0
  i32.store offset=4
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store offset=8
  local.get $0
  call $assembly/contracts/main/userPrincipalModerateKey
  local.set $3
  global.get $~lib/memory/__stack_pointer
  local.get $3
  i32.store
  local.get $3
  call $assembly/contracts/main/sGetU64
  i64.eqz
  if
   global.get $~lib/memory/__stack_pointer
   i32.const 1952
   i32.store
   i32.const 1952
   call $assembly/contracts/main/sGetU64
   i32.wrap_i64
   local.tee $3
   call $assembly/contracts/main/participantKey
   local.set $4
   global.get $~lib/memory/__stack_pointer
   local.get $4
   i32.store
   global.get $~lib/memory/__stack_pointer
   local.get $0
   i32.store offset=8
   local.get $4
   local.get $0
   call $~lib/@massalabs/massa-as-sdk/assembly/std/storage/set<~lib/string/String>
   global.get $~lib/memory/__stack_pointer
   i32.const 1952
   i32.store
   i32.const 1952
   local.get $3
   i32.const 1
   i32.add
   i64.extend_i32_s
   call $assembly/contracts/main/sSetU64
  end
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store offset=8
  local.get $0
  call $assembly/contracts/main/userPrincipalModerateKey
  local.set $3
  global.get $~lib/memory/__stack_pointer
  local.get $3
  i32.store
  local.get $3
  call $assembly/contracts/main/sGetU64
  local.set $2
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store offset=8
  local.get $0
  call $assembly/contracts/main/userTicketsModerateKey
  local.set $3
  global.get $~lib/memory/__stack_pointer
  local.get $3
  i32.store
  local.get $3
  call $assembly/contracts/main/sGetU64
  local.set $5
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store offset=8
  local.get $0
  call $assembly/contracts/main/userPrincipalModerateKey
  local.set $3
  global.get $~lib/memory/__stack_pointer
  local.get $3
  i32.store
  local.get $3
  local.get $1
  local.get $2
  i64.add
  call $assembly/contracts/main/sSetU64
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store offset=8
  local.get $0
  call $assembly/contracts/main/userTicketsModerateKey
  local.set $3
  global.get $~lib/memory/__stack_pointer
  local.get $3
  i32.store
  local.get $3
  local.get $5
  local.get $1
  i64.const 1
  i64.shl
  local.tee $2
  i64.add
  call $assembly/contracts/main/sSetU64
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store offset=12
  local.get $0
  call $assembly/contracts/main/userTierKey
  local.set $3
  global.get $~lib/memory/__stack_pointer
  local.get $3
  i32.store
  global.get $~lib/memory/__stack_pointer
  i32.const 5056
  i32.store offset=8
  local.get $3
  i32.const 5056
  call $~lib/@massalabs/massa-as-sdk/assembly/std/storage/set<~lib/string/String>
  global.get $~lib/memory/__stack_pointer
  i32.const 2304
  i32.store
  global.get $~lib/memory/__stack_pointer
  i32.const 2304
  i32.store offset=8
  i32.const 2304
  i32.const 2304
  call $assembly/contracts/main/sGetU64
  local.get $1
  i64.add
  call $assembly/contracts/main/sSetU64
  global.get $~lib/memory/__stack_pointer
  i32.const 2464
  i32.store
  global.get $~lib/memory/__stack_pointer
  i32.const 2464
  i32.store offset=8
  i32.const 2464
  i32.const 2464
  call $assembly/contracts/main/sGetU64
  local.get $2
  i64.add
  call $assembly/contracts/main/sSetU64
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store offset=16
  global.get $~lib/memory/__stack_pointer
  local.get $1
  call $~lib/util/number/utoa64
  local.tee $3
  i32.store offset=20
  global.get $~lib/memory/__stack_pointer
  local.get $2
  call $~lib/util/number/utoa64
  local.tee $4
  i32.store offset=24
  global.get $~lib/memory/__stack_pointer
  i32.const 5168
  i32.store offset=8
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store offset=12
  i32.const 5168
  i32.const 1
  local.get $0
  call $~lib/staticarray/StaticArray<~lib/string/String>#__uset
  global.get $~lib/memory/__stack_pointer
  i32.const 5168
  i32.store offset=8
  global.get $~lib/memory/__stack_pointer
  local.get $3
  i32.store offset=12
  i32.const 5168
  i32.const 3
  local.get $3
  call $~lib/staticarray/StaticArray<~lib/string/String>#__uset
  global.get $~lib/memory/__stack_pointer
  i32.const 5168
  i32.store offset=8
  global.get $~lib/memory/__stack_pointer
  local.get $4
  i32.store offset=12
  i32.const 5168
  i32.const 5
  local.get $4
  call $~lib/staticarray/StaticArray<~lib/string/String>#__uset
  global.get $~lib/memory/__stack_pointer
  i32.const 5168
  i32.store offset=8
  global.get $~lib/memory/__stack_pointer
  i32.const 2592
  i32.store offset=12
  i32.const 5168
  call $~lib/staticarray/StaticArray<~lib/string/String>#join
  local.set $0
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store
  local.get $0
  call $~lib/@massalabs/massa-as-sdk/assembly/std/utils/events/generateEvent
  global.get $~lib/memory/__stack_pointer
  i32.const 28
  i32.add
  global.set $~lib/memory/__stack_pointer
 )
 (func $assembly/contracts/main/userPrincipalAggressiveKey (param $0 i32) (result i32)
  local.get $0
  i32.const 5216
  call $byn$mgfn-shared$assembly/contracts/main/userPrincipalConservativeKey
 )
 (func $assembly/contracts/main/userTicketsAggressiveKey (param $0 i32) (result i32)
  local.get $0
  i32.const 5296
  call $byn$mgfn-shared$assembly/contracts/main/userPrincipalConservativeKey
 )
 (func $assembly/contracts/main/depositAggressive
  (local $0 i32)
  (local $1 i64)
  (local $2 i64)
  (local $3 i32)
  (local $4 i32)
  (local $5 i64)
  global.get $~lib/memory/__stack_pointer
  i32.const 28
  i32.sub
  global.set $~lib/memory/__stack_pointer
  call $~stack_check
  global.get $~lib/memory/__stack_pointer
  i32.const 0
  i32.const 28
  memory.fill
  call $~lib/@massalabs/massa-as-sdk/assembly/env/env/env.callCoins
  local.tee $1
  i64.eqz
  if
   global.get $~lib/memory/__stack_pointer
   i32.const 4448
   i32.store
   i32.const 4448
   call $~lib/@massalabs/massa-as-sdk/assembly/std/utils/events/generateEvent
   global.get $~lib/memory/__stack_pointer
   i32.const 28
   i32.add
   global.set $~lib/memory/__stack_pointer
   return
  end
  global.get $~lib/memory/__stack_pointer
  local.set $0
  call $~lib/@massalabs/massa-as-sdk/assembly/std/context/caller
  local.set $3
  global.get $~lib/memory/__stack_pointer
  local.get $3
  i32.store
  local.get $0
  local.get $3
  call $~lib/@massalabs/massa-as-sdk/assembly/std/address/Address#toString
  local.tee $0
  i32.store offset=4
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store offset=8
  local.get $0
  call $assembly/contracts/main/userPrincipalAggressiveKey
  local.set $3
  global.get $~lib/memory/__stack_pointer
  local.get $3
  i32.store
  local.get $3
  call $assembly/contracts/main/sGetU64
  i64.eqz
  if
   global.get $~lib/memory/__stack_pointer
   i32.const 1952
   i32.store
   i32.const 1952
   call $assembly/contracts/main/sGetU64
   i32.wrap_i64
   local.tee $3
   call $assembly/contracts/main/participantKey
   local.set $4
   global.get $~lib/memory/__stack_pointer
   local.get $4
   i32.store
   global.get $~lib/memory/__stack_pointer
   local.get $0
   i32.store offset=8
   local.get $4
   local.get $0
   call $~lib/@massalabs/massa-as-sdk/assembly/std/storage/set<~lib/string/String>
   global.get $~lib/memory/__stack_pointer
   i32.const 1952
   i32.store
   i32.const 1952
   local.get $3
   i32.const 1
   i32.add
   i64.extend_i32_s
   call $assembly/contracts/main/sSetU64
  end
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store offset=8
  local.get $0
  call $assembly/contracts/main/userPrincipalAggressiveKey
  local.set $3
  global.get $~lib/memory/__stack_pointer
  local.get $3
  i32.store
  local.get $3
  call $assembly/contracts/main/sGetU64
  local.set $2
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store offset=8
  local.get $0
  call $assembly/contracts/main/userTicketsAggressiveKey
  local.set $3
  global.get $~lib/memory/__stack_pointer
  local.get $3
  i32.store
  local.get $3
  call $assembly/contracts/main/sGetU64
  local.set $5
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store offset=8
  local.get $0
  call $assembly/contracts/main/userPrincipalAggressiveKey
  local.set $3
  global.get $~lib/memory/__stack_pointer
  local.get $3
  i32.store
  local.get $3
  local.get $1
  local.get $2
  i64.add
  call $assembly/contracts/main/sSetU64
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store offset=8
  local.get $0
  call $assembly/contracts/main/userTicketsAggressiveKey
  local.set $3
  global.get $~lib/memory/__stack_pointer
  local.get $3
  i32.store
  local.get $3
  local.get $5
  local.get $1
  i64.const 2
  i64.shl
  local.tee $2
  i64.add
  call $assembly/contracts/main/sSetU64
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store offset=12
  local.get $0
  call $assembly/contracts/main/userTierKey
  local.set $3
  global.get $~lib/memory/__stack_pointer
  local.get $3
  i32.store
  global.get $~lib/memory/__stack_pointer
  i32.const 5376
  i32.store offset=8
  local.get $3
  i32.const 5376
  call $~lib/@massalabs/massa-as-sdk/assembly/std/storage/set<~lib/string/String>
  global.get $~lib/memory/__stack_pointer
  i32.const 2352
  i32.store
  global.get $~lib/memory/__stack_pointer
  i32.const 2352
  i32.store offset=8
  i32.const 2352
  i32.const 2352
  call $assembly/contracts/main/sGetU64
  local.get $1
  i64.add
  call $assembly/contracts/main/sSetU64
  global.get $~lib/memory/__stack_pointer
  i32.const 2528
  i32.store
  global.get $~lib/memory/__stack_pointer
  i32.const 2528
  i32.store offset=8
  i32.const 2528
  i32.const 2528
  call $assembly/contracts/main/sGetU64
  local.get $2
  i64.add
  call $assembly/contracts/main/sSetU64
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store offset=16
  global.get $~lib/memory/__stack_pointer
  local.get $1
  call $~lib/util/number/utoa64
  local.tee $3
  i32.store offset=20
  global.get $~lib/memory/__stack_pointer
  local.get $2
  call $~lib/util/number/utoa64
  local.tee $4
  i32.store offset=24
  global.get $~lib/memory/__stack_pointer
  i32.const 5488
  i32.store offset=8
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store offset=12
  i32.const 5488
  i32.const 1
  local.get $0
  call $~lib/staticarray/StaticArray<~lib/string/String>#__uset
  global.get $~lib/memory/__stack_pointer
  i32.const 5488
  i32.store offset=8
  global.get $~lib/memory/__stack_pointer
  local.get $3
  i32.store offset=12
  i32.const 5488
  i32.const 3
  local.get $3
  call $~lib/staticarray/StaticArray<~lib/string/String>#__uset
  global.get $~lib/memory/__stack_pointer
  i32.const 5488
  i32.store offset=8
  global.get $~lib/memory/__stack_pointer
  local.get $4
  i32.store offset=12
  i32.const 5488
  i32.const 5
  local.get $4
  call $~lib/staticarray/StaticArray<~lib/string/String>#__uset
  global.get $~lib/memory/__stack_pointer
  i32.const 5488
  i32.store offset=8
  global.get $~lib/memory/__stack_pointer
  i32.const 2592
  i32.store offset=12
  i32.const 5488
  call $~lib/staticarray/StaticArray<~lib/string/String>#join
  local.set $0
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store
  local.get $0
  call $~lib/@massalabs/massa-as-sdk/assembly/std/utils/events/generateEvent
  global.get $~lib/memory/__stack_pointer
  i32.const 28
  i32.add
  global.set $~lib/memory/__stack_pointer
 )
 (func $~lib/@massalabs/massa-as-sdk/assembly/std/coins/transfer/transferCoins (param $0 i32) (param $1 i64)
  global.get $~lib/memory/__stack_pointer
  i32.const 8
  i32.sub
  global.set $~lib/memory/__stack_pointer
  call $~stack_check
  global.get $~lib/memory/__stack_pointer
  i64.const 0
  i64.store
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store offset=4
  local.get $0
  call $~lib/@massalabs/massa-as-sdk/assembly/std/address/Address#toString
  local.set $0
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store
  local.get $0
  local.get $1
  call $~lib/@massalabs/massa-as-sdk/assembly/env/env/env.transferCoins
  global.get $~lib/memory/__stack_pointer
  i32.const 8
  i32.add
  global.set $~lib/memory/__stack_pointer
 )
 (func $assembly/contracts/main/withdraw (param $0 i32)
  (local $1 i64)
  (local $2 i32)
  (local $3 i32)
  (local $4 i32)
  (local $5 i64)
  (local $6 i64)
  (local $7 i32)
  (local $8 i32)
  (local $9 i64)
  global.get $~lib/memory/__stack_pointer
  i32.const 84
  i32.sub
  global.set $~lib/memory/__stack_pointer
  call $~stack_check
  global.get $~lib/memory/__stack_pointer
  i32.const 0
  i32.const 84
  memory.fill
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store
  global.get $~lib/memory/__stack_pointer
  local.get $0
  call $~lib/@massalabs/as-types/assembly/argument/Args#constructor
  local.tee $0
  i32.store offset=4
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store
  global.get $~lib/memory/__stack_pointer
  local.get $0
  call $~lib/@massalabs/as-types/assembly/argument/Args#nextU64
  local.tee $0
  i32.store offset=8
  global.get $~lib/memory/__stack_pointer
  i32.const 5536
  i32.store offset=12
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store offset=16
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store offset=20
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store offset=24
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.load offset=8
  local.tee $2
  i32.store
  local.get $2
  call $~lib/string/String.__not
  i32.eqz
  if
   global.get $~lib/memory/__stack_pointer
   i32.const 5536
   i32.store offset=28
   global.get $~lib/memory/__stack_pointer
   local.get $0
   i32.store
   global.get $~lib/memory/__stack_pointer
   local.get $0
   i32.load offset=8
   local.tee $0
   i32.store offset=32
   global.get $~lib/memory/__stack_pointer
   local.set $2
   local.get $0
   i32.eqz
   if
    i32.const 3152
    i32.const 3280
    i32.const 52
    i32.const 32
    call $~lib/builtins/abort
    unreachable
   end
   local.get $2
   local.get $0
   i32.store offset=36
   global.get $~lib/memory/__stack_pointer
   i32.const 5568
   i32.store
   global.get $~lib/memory/__stack_pointer
   i32.const 5536
   i32.store offset=24
   i32.const 5568
   i32.const 0
   i32.const 5536
   call $~lib/staticarray/StaticArray<~lib/string/String>#__uset
   global.get $~lib/memory/__stack_pointer
   i32.const 5568
   i32.store
   global.get $~lib/memory/__stack_pointer
   local.get $0
   i32.store offset=24
   i32.const 5568
   i32.const 2
   local.get $0
   call $~lib/staticarray/StaticArray<~lib/string/String>#__uset
   global.get $~lib/memory/__stack_pointer
   i32.const 5568
   i32.store
   global.get $~lib/memory/__stack_pointer
   i32.const 2592
   i32.store offset=24
   i32.const 5568
   call $~lib/staticarray/StaticArray<~lib/string/String>#join
   i32.const 3280
   i32.const 52
   i32.const 7
   call $~lib/builtins/abort
   unreachable
  end
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store offset=40
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store
  local.get $0
  i64.load
  local.set $1
  global.get $~lib/memory/__stack_pointer
  local.set $0
  call $~lib/@massalabs/massa-as-sdk/assembly/std/context/caller
  local.set $2
  global.get $~lib/memory/__stack_pointer
  local.get $2
  i32.store
  local.get $0
  local.get $2
  call $~lib/@massalabs/massa-as-sdk/assembly/std/address/Address#toString
  local.tee $8
  i32.store offset=44
  local.get $1
  i64.eqz
  if
   i32.const 5600
   i32.const 2864
   i32.const 279
   i32.const 3
   call $~lib/builtins/abort
   unreachable
  end
  global.get $~lib/memory/__stack_pointer
  local.set $0
  global.get $~lib/memory/__stack_pointer
  local.get $8
  i32.store offset=24
  local.get $8
  call $assembly/contracts/main/userTierKey
  local.set $2
  global.get $~lib/memory/__stack_pointer
  local.get $2
  i32.store
  local.get $0
  local.get $2
  call $~lib/@massalabs/massa-as-sdk/assembly/std/storage/has<~lib/string/String>
  if (result i32)
   global.get $~lib/memory/__stack_pointer
   local.get $8
   i32.store offset=24
   local.get $8
   call $assembly/contracts/main/userTierKey
   local.set $0
   global.get $~lib/memory/__stack_pointer
   local.get $0
   i32.store
   local.get $0
   call $~lib/@massalabs/massa-as-sdk/assembly/std/storage/get<~lib/string/String>
  else
   i32.const 4752
  end
  local.tee $7
  i32.store offset=48
  global.get $~lib/memory/__stack_pointer
  i32.const 2592
  i32.store offset=52
  global.get $~lib/memory/__stack_pointer
  i32.const 2592
  i32.store offset=56
  global.get $~lib/memory/__stack_pointer
  i32.const 2592
  i32.store offset=60
  global.get $~lib/memory/__stack_pointer
  i32.const 2592
  i32.store offset=64
  global.get $~lib/memory/__stack_pointer
  local.get $7
  i32.store
  global.get $~lib/memory/__stack_pointer
  i32.const 4752
  i32.store offset=24
  local.get $7
  i32.const 4752
  call $~lib/string/String.__eq
  if (result i64)
   global.get $~lib/memory/__stack_pointer
   local.get $8
   i32.store
   global.get $~lib/memory/__stack_pointer
   local.get $8
   call $assembly/contracts/main/userPrincipalConservativeKey
   local.tee $0
   i32.store offset=52
   global.get $~lib/memory/__stack_pointer
   local.get $8
   i32.store
   global.get $~lib/memory/__stack_pointer
   local.get $8
   call $assembly/contracts/main/userTicketsConservativeKey
   local.tee $2
   i32.store offset=56
   i32.const 2240
   local.set $3
   global.get $~lib/memory/__stack_pointer
   i32.const 2240
   i32.store offset=60
   i32.const 2400
   local.set $4
   global.get $~lib/memory/__stack_pointer
   i32.const 2400
   i32.store offset=64
   i64.const 1
  else
   global.get $~lib/memory/__stack_pointer
   local.get $7
   i32.store
   global.get $~lib/memory/__stack_pointer
   i32.const 5056
   i32.store offset=24
   local.get $7
   i32.const 5056
   call $~lib/string/String.__eq
   if (result i64)
    global.get $~lib/memory/__stack_pointer
    local.get $8
    i32.store
    global.get $~lib/memory/__stack_pointer
    local.get $8
    call $assembly/contracts/main/userPrincipalModerateKey
    local.tee $0
    i32.store offset=52
    global.get $~lib/memory/__stack_pointer
    local.get $8
    i32.store
    global.get $~lib/memory/__stack_pointer
    local.get $8
    call $assembly/contracts/main/userTicketsModerateKey
    local.tee $2
    i32.store offset=56
    i32.const 2304
    local.set $3
    global.get $~lib/memory/__stack_pointer
    i32.const 2304
    i32.store offset=60
    i32.const 2464
    local.set $4
    global.get $~lib/memory/__stack_pointer
    i32.const 2464
    i32.store offset=64
    i64.const 2
   else
    global.get $~lib/memory/__stack_pointer
    local.get $8
    i32.store
    global.get $~lib/memory/__stack_pointer
    local.get $8
    call $assembly/contracts/main/userPrincipalAggressiveKey
    local.tee $0
    i32.store offset=52
    global.get $~lib/memory/__stack_pointer
    local.get $8
    i32.store
    global.get $~lib/memory/__stack_pointer
    local.get $8
    call $assembly/contracts/main/userTicketsAggressiveKey
    local.tee $2
    i32.store offset=56
    i32.const 2352
    local.set $3
    global.get $~lib/memory/__stack_pointer
    i32.const 2352
    i32.store offset=60
    i32.const 2528
    local.set $4
    global.get $~lib/memory/__stack_pointer
    i32.const 2528
    i32.store offset=64
    i64.const 4
   end
  end
  local.set $9
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store
  local.get $0
  call $assembly/contracts/main/sGetU64
  local.set $5
  global.get $~lib/memory/__stack_pointer
  local.get $2
  i32.store
  local.get $2
  call $assembly/contracts/main/sGetU64
  local.set $6
  local.get $1
  local.get $5
  i64.gt_u
  if
   i32.const 5648
   i32.const 2864
   i32.const 315
   i32.const 3
   call $~lib/builtins/abort
   unreachable
  end
  local.get $6
  local.get $1
  local.get $9
  i64.mul
  local.tee $9
  i64.lt_u
  if
   i32.const 5712
   i32.const 2864
   i32.const 319
   i32.const 3
   call $~lib/builtins/abort
   unreachable
  end
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store
  local.get $0
  local.get $5
  local.get $1
  i64.sub
  call $assembly/contracts/main/sSetU64
  global.get $~lib/memory/__stack_pointer
  local.get $2
  i32.store
  local.get $2
  local.get $6
  local.get $9
  i64.sub
  call $assembly/contracts/main/sSetU64
  global.get $~lib/memory/__stack_pointer
  local.get $3
  i32.store
  global.get $~lib/memory/__stack_pointer
  local.get $3
  i32.store offset=24
  local.get $3
  local.get $3
  call $assembly/contracts/main/sGetU64
  local.get $1
  i64.sub
  call $assembly/contracts/main/sSetU64
  global.get $~lib/memory/__stack_pointer
  local.get $4
  i32.store
  global.get $~lib/memory/__stack_pointer
  local.get $4
  i32.store offset=24
  local.get $4
  local.get $4
  call $assembly/contracts/main/sGetU64
  local.get $9
  i64.sub
  call $assembly/contracts/main/sSetU64
  global.get $~lib/memory/__stack_pointer
  local.get $8
  i32.store offset=24
  local.get $8
  call $~lib/@massalabs/massa-as-sdk/assembly/std/address/Address#constructor
  local.set $0
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store
  local.get $0
  local.get $1
  call $~lib/@massalabs/massa-as-sdk/assembly/std/coins/transfer/transferCoins
  global.get $~lib/memory/__stack_pointer
  local.get $8
  i32.store offset=68
  global.get $~lib/memory/__stack_pointer
  local.get $1
  call $~lib/util/number/utoa64
  local.tee $0
  i32.store offset=72
  global.get $~lib/memory/__stack_pointer
  local.get $7
  i32.store offset=76
  global.get $~lib/memory/__stack_pointer
  i32.const 5824
  i32.store offset=24
  global.get $~lib/memory/__stack_pointer
  local.get $8
  i32.store offset=80
  i32.const 5824
  i32.const 1
  local.get $8
  call $~lib/staticarray/StaticArray<~lib/string/String>#__uset
  global.get $~lib/memory/__stack_pointer
  i32.const 5824
  i32.store offset=24
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store offset=80
  i32.const 5824
  i32.const 3
  local.get $0
  call $~lib/staticarray/StaticArray<~lib/string/String>#__uset
  global.get $~lib/memory/__stack_pointer
  i32.const 5824
  i32.store offset=24
  global.get $~lib/memory/__stack_pointer
  local.get $7
  i32.store offset=80
  i32.const 5824
  i32.const 5
  local.get $7
  call $~lib/staticarray/StaticArray<~lib/string/String>#__uset
  global.get $~lib/memory/__stack_pointer
  i32.const 5824
  i32.store offset=24
  global.get $~lib/memory/__stack_pointer
  i32.const 2592
  i32.store offset=80
  i32.const 5824
  call $~lib/staticarray/StaticArray<~lib/string/String>#join
  local.set $0
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store
  local.get $0
  call $~lib/@massalabs/massa-as-sdk/assembly/std/utils/events/generateEvent
  global.get $~lib/memory/__stack_pointer
  i32.const 84
  i32.add
  global.set $~lib/memory/__stack_pointer
 )
 (func $assembly/contracts/main/winnerKey (param $0 i32) (result i32)
  local.get $0
  i32.const 6368
  call $byn$mgfn-shared$assembly/contracts/main/participantKey
 )
 (func $assembly/contracts/main/enhancedRunDraw (result i32)
  (local $0 i32)
  (local $1 i32)
  (local $2 i32)
  (local $3 i32)
  (local $4 i32)
  (local $5 i64)
  (local $6 i64)
  (local $7 i64)
  (local $8 i64)
  (local $9 i64)
  (local $10 i64)
  (local $11 i64)
  global.get $~lib/memory/__stack_pointer
  i32.const 68
  i32.sub
  global.set $~lib/memory/__stack_pointer
  call $~stack_check
  global.get $~lib/memory/__stack_pointer
  i32.const 0
  i32.const 68
  memory.fill
  global.get $~lib/memory/__stack_pointer
  i32.const 1744
  i32.store
  i32.const 1744
  call $assembly/contracts/main/sGetU64
  local.set $11
  global.get $~lib/memory/__stack_pointer
  i32.const 2400
  i32.store
  i32.const 2400
  call $assembly/contracts/main/sGetU64
  local.set $6
  global.get $~lib/memory/__stack_pointer
  i32.const 2464
  i32.store
  i32.const 2464
  call $assembly/contracts/main/sGetU64
  local.set $5
  global.get $~lib/memory/__stack_pointer
  i32.const 2528
  i32.store
  i32.const 2528
  call $assembly/contracts/main/sGetU64
  local.get $5
  local.get $6
  i64.add
  i64.add
  local.set $8
  global.get $~lib/memory/__stack_pointer
  i32.const 1952
  i32.store
  i32.const 1952
  call $assembly/contracts/main/sGetU64
  i32.wrap_i64
  local.set $3
  global.get $~lib/memory/__stack_pointer
  i32.const 2064
  i32.store
  i32.const 2064
  call $assembly/contracts/main/sGetU64
  local.set $5
  call $~lib/@massalabs/massa-as-sdk/assembly/env/env/env.currentPeriod
  local.set $10
  block $folding-inner0
   local.get $5
   local.get $11
   i64.gt_u
   if
    global.get $~lib/memory/__stack_pointer
    i32.const 5872
    i32.store offset=4
    local.get $11
    call $~lib/util/number/utoa64
    local.set $0
    global.get $~lib/memory/__stack_pointer
    local.get $0
    i32.store offset=8
    i32.const 5872
    local.get $0
    call $~lib/string/String#concat
    local.set $1
    global.get $~lib/memory/__stack_pointer
    local.get $1
    i32.store
    br $folding-inner0
   end
   local.get $3
   i32.eqz
   local.get $8
   i64.eqz
   i32.or
   if
    i32.const 5968
    local.set $1
    global.get $~lib/memory/__stack_pointer
    i32.const 5968
    i32.store
    br $folding-inner0
   end
   global.get $~lib/memory/__stack_pointer
   i32.const 4
   i32.sub
   global.set $~lib/memory/__stack_pointer
   call $~stack_check
   global.get $~lib/memory/__stack_pointer
   i32.const 0
   i32.store
   call $~lib/@massalabs/massa-as-sdk/assembly/env/env/env.currentPeriod
   local.set $6
   global.get $~lib/memory/__stack_pointer
   i32.const 2400
   i32.store
   i32.const 2400
   call $assembly/contracts/main/sGetU64
   local.set $5
   global.get $~lib/memory/__stack_pointer
   i32.const 2464
   i32.store
   i32.const 2464
   call $assembly/contracts/main/sGetU64
   local.get $5
   i64.add
   local.set $5
   global.get $~lib/memory/__stack_pointer
   i32.const 2528
   i32.store
   i32.const 2528
   call $assembly/contracts/main/sGetU64
   local.get $5
   i64.add
   local.set $5
   global.get $~lib/memory/__stack_pointer
   i32.const 1744
   i32.store
   local.get $6
   local.get $6
   i64.const 1
   i64.sub
   i64.const 16
   i64.shl
   i64.xor
   local.get $6
   i64.const 2
   i64.sub
   i64.const 32
   i64.shl
   i64.xor
   local.get $5
   i64.xor
   i32.const 1744
   call $assembly/contracts/main/sGetU64
   i64.const 8
   i64.shl
   i64.xor
   local.set $7
   global.get $~lib/memory/__stack_pointer
   i32.const 4
   i32.add
   global.set $~lib/memory/__stack_pointer
   local.get $7
   local.get $8
   i64.rem_u
   local.set $6
   global.get $~lib/memory/__stack_pointer
   local.get $7
   call $~lib/util/number/utoa64
   local.tee $2
   i32.store offset=12
   global.get $~lib/memory/__stack_pointer
   local.get $6
   call $~lib/util/number/utoa64
   local.tee $1
   i32.store offset=16
   global.get $~lib/memory/__stack_pointer
   local.get $8
   call $~lib/util/number/utoa64
   local.tee $0
   i32.store offset=20
   global.get $~lib/memory/__stack_pointer
   i32.const 6192
   i32.store offset=4
   global.get $~lib/memory/__stack_pointer
   local.get $2
   i32.store offset=8
   i32.const 6192
   i32.const 1
   local.get $2
   call $~lib/staticarray/StaticArray<~lib/string/String>#__uset
   global.get $~lib/memory/__stack_pointer
   i32.const 6192
   i32.store offset=4
   global.get $~lib/memory/__stack_pointer
   local.get $1
   i32.store offset=8
   i32.const 6192
   i32.const 3
   local.get $1
   call $~lib/staticarray/StaticArray<~lib/string/String>#__uset
   global.get $~lib/memory/__stack_pointer
   i32.const 6192
   i32.store offset=4
   global.get $~lib/memory/__stack_pointer
   local.get $0
   i32.store offset=8
   i32.const 6192
   i32.const 5
   local.get $0
   call $~lib/staticarray/StaticArray<~lib/string/String>#__uset
   global.get $~lib/memory/__stack_pointer
   i32.const 6192
   i32.store offset=4
   global.get $~lib/memory/__stack_pointer
   i32.const 2592
   i32.store offset=8
   i32.const 6192
   call $~lib/staticarray/StaticArray<~lib/string/String>#join
   local.set $0
   global.get $~lib/memory/__stack_pointer
   local.get $0
   i32.store
   local.get $0
   call $~lib/@massalabs/massa-as-sdk/assembly/std/utils/events/generateEvent
   i32.const 2592
   local.set $1
   global.get $~lib/memory/__stack_pointer
   i32.const 2592
   i32.store offset=24
   loop $for-loop|0
    local.get $3
    local.get $4
    i32.gt_s
    if
     block $for-break0
      global.get $~lib/memory/__stack_pointer
      local.set $2
      local.get $4
      call $assembly/contracts/main/participantKey
      local.set $0
      global.get $~lib/memory/__stack_pointer
      local.get $0
      i32.store
      local.get $2
      local.get $0
      call $~lib/@massalabs/massa-as-sdk/assembly/std/storage/get<~lib/string/String>
      local.tee $0
      i32.store offset=28
      global.get $~lib/memory/__stack_pointer
      local.get $0
      i32.store offset=4
      local.get $0
      call $assembly/contracts/main/userTicketsConservativeKey
      local.set $2
      global.get $~lib/memory/__stack_pointer
      local.get $2
      i32.store
      local.get $2
      call $assembly/contracts/main/sGetU64
      local.set $5
      global.get $~lib/memory/__stack_pointer
      local.get $0
      i32.store offset=4
      local.get $0
      call $assembly/contracts/main/userTicketsModerateKey
      local.set $2
      global.get $~lib/memory/__stack_pointer
      local.get $2
      i32.store
      local.get $2
      call $assembly/contracts/main/sGetU64
      local.set $8
      global.get $~lib/memory/__stack_pointer
      local.get $0
      i32.store offset=4
      local.get $0
      call $assembly/contracts/main/userTicketsAggressiveKey
      local.set $2
      global.get $~lib/memory/__stack_pointer
      local.get $2
      i32.store
      local.get $2
      call $assembly/contracts/main/sGetU64
      local.get $5
      local.get $8
      i64.add
      i64.add
      local.get $9
      i64.add
      local.tee $9
      local.get $6
      i64.gt_u
      if
       global.get $~lib/memory/__stack_pointer
       local.get $0
       local.tee $1
       i32.store offset=24
       br $for-break0
      end
      local.get $4
      i32.const 1
      i32.add
      local.set $4
      br $for-loop|0
     end
    end
   end
   global.get $~lib/memory/__stack_pointer
   local.get $1
   i32.store
   local.get $1
   call $~lib/string/String#get:length
   i32.eqz
   if
    i32.const 6240
    local.set $1
    global.get $~lib/memory/__stack_pointer
    i32.const 6240
    i32.store
    br $folding-inner0
   end
   global.get $~lib/memory/__stack_pointer
   i32.const 2128
   i32.store
   i32.const 2128
   call $assembly/contracts/main/sGetU64
   local.set $5
   global.get $~lib/memory/__stack_pointer
   local.set $4
   global.get $~lib/memory/__stack_pointer
   local.get $10
   call $~lib/util/number/utoa64
   local.tee $3
   i32.store offset=32
   global.get $~lib/memory/__stack_pointer
   local.get $1
   i32.store offset=36
   global.get $~lib/memory/__stack_pointer
   local.get $11
   call $~lib/util/number/utoa64
   local.tee $2
   i32.store offset=40
   global.get $~lib/memory/__stack_pointer
   local.get $7
   call $~lib/util/number/utoa64
   local.tee $0
   i32.store offset=44
   global.get $~lib/memory/__stack_pointer
   i32.const 6320
   i32.store
   global.get $~lib/memory/__stack_pointer
   local.get $3
   i32.store offset=4
   i32.const 6320
   i32.const 0
   local.get $3
   call $~lib/staticarray/StaticArray<~lib/string/String>#__uset
   global.get $~lib/memory/__stack_pointer
   i32.const 6320
   i32.store
   global.get $~lib/memory/__stack_pointer
   local.get $1
   i32.store offset=4
   i32.const 6320
   i32.const 2
   local.get $1
   call $~lib/staticarray/StaticArray<~lib/string/String>#__uset
   global.get $~lib/memory/__stack_pointer
   i32.const 6320
   i32.store
   global.get $~lib/memory/__stack_pointer
   local.get $2
   i32.store offset=4
   i32.const 6320
   i32.const 4
   local.get $2
   call $~lib/staticarray/StaticArray<~lib/string/String>#__uset
   global.get $~lib/memory/__stack_pointer
   i32.const 6320
   i32.store
   global.get $~lib/memory/__stack_pointer
   local.get $0
   i32.store offset=4
   i32.const 6320
   i32.const 6
   local.get $0
   call $~lib/staticarray/StaticArray<~lib/string/String>#__uset
   global.get $~lib/memory/__stack_pointer
   i32.const 6320
   i32.store
   global.get $~lib/memory/__stack_pointer
   i32.const 2592
   i32.store offset=4
   local.get $4
   i32.const 6320
   call $~lib/staticarray/StaticArray<~lib/string/String>#join
   local.tee $2
   i32.store offset=48
   local.get $5
   i32.wrap_i64
   call $assembly/contracts/main/winnerKey
   local.set $0
   global.get $~lib/memory/__stack_pointer
   local.get $0
   i32.store
   global.get $~lib/memory/__stack_pointer
   local.get $2
   i32.store offset=4
   local.get $0
   local.get $2
   call $~lib/@massalabs/massa-as-sdk/assembly/std/storage/set<~lib/string/String>
   global.get $~lib/memory/__stack_pointer
   i32.const 2128
   i32.store
   i32.const 2128
   local.get $5
   i64.const 1
   i64.add
   call $assembly/contracts/main/sSetU64
   global.get $~lib/memory/__stack_pointer
   i32.const 2176
   i32.store
   i32.const 2176
   local.get $10
   call $assembly/contracts/main/sSetU64
   global.get $~lib/memory/__stack_pointer
   local.get $1
   i32.store offset=4
   local.get $1
   call $~lib/@massalabs/massa-as-sdk/assembly/std/address/Address#constructor
   local.set $0
   global.get $~lib/memory/__stack_pointer
   local.get $0
   i32.store
   local.get $0
   local.get $11
   call $~lib/@massalabs/massa-as-sdk/assembly/std/coins/transfer/transferCoins
   global.get $~lib/memory/__stack_pointer
   i32.const 1744
   i32.store
   i32.const 1744
   i64.const 0
   call $assembly/contracts/main/sSetU64
   global.get $~lib/memory/__stack_pointer
   local.get $10
   call $~lib/util/number/utoa64
   local.tee $3
   i32.store offset=52
   global.get $~lib/memory/__stack_pointer
   local.get $1
   i32.store offset=56
   global.get $~lib/memory/__stack_pointer
   local.get $11
   call $~lib/util/number/utoa64
   local.tee $2
   i32.store offset=60
   global.get $~lib/memory/__stack_pointer
   local.get $7
   call $~lib/util/number/utoa64
   local.tee $0
   i32.store offset=64
   global.get $~lib/memory/__stack_pointer
   i32.const 6448
   i32.store offset=4
   global.get $~lib/memory/__stack_pointer
   local.get $3
   i32.store offset=8
   i32.const 6448
   i32.const 1
   local.get $3
   call $~lib/staticarray/StaticArray<~lib/string/String>#__uset
   global.get $~lib/memory/__stack_pointer
   i32.const 6448
   i32.store offset=4
   global.get $~lib/memory/__stack_pointer
   local.get $1
   i32.store offset=8
   i32.const 6448
   i32.const 3
   local.get $1
   call $~lib/staticarray/StaticArray<~lib/string/String>#__uset
   global.get $~lib/memory/__stack_pointer
   i32.const 6448
   i32.store offset=4
   global.get $~lib/memory/__stack_pointer
   local.get $2
   i32.store offset=8
   i32.const 6448
   i32.const 5
   local.get $2
   call $~lib/staticarray/StaticArray<~lib/string/String>#__uset
   global.get $~lib/memory/__stack_pointer
   i32.const 6448
   i32.store offset=4
   global.get $~lib/memory/__stack_pointer
   local.get $0
   i32.store offset=8
   i32.const 6448
   i32.const 7
   local.get $0
   call $~lib/staticarray/StaticArray<~lib/string/String>#__uset
   global.get $~lib/memory/__stack_pointer
   i32.const 6448
   i32.store offset=4
   global.get $~lib/memory/__stack_pointer
   i32.const 2592
   i32.store offset=8
   i32.const 6448
   call $~lib/staticarray/StaticArray<~lib/string/String>#join
   local.set $0
   global.get $~lib/memory/__stack_pointer
   local.get $0
   i32.store
   local.get $0
   call $~lib/@massalabs/massa-as-sdk/assembly/std/utils/events/generateEvent
   global.get $~lib/memory/__stack_pointer
   i32.const 68
   i32.add
   global.set $~lib/memory/__stack_pointer
   i32.const 1
   return
  end
  local.get $1
  call $~lib/@massalabs/massa-as-sdk/assembly/std/utils/events/generateEvent
  global.get $~lib/memory/__stack_pointer
  i32.const 68
  i32.add
  global.set $~lib/memory/__stack_pointer
  i32.const 0
 )
 (func $assembly/contracts/main/tick
  (local $0 i32)
  (local $1 i64)
  (local $2 i64)
  (local $3 i64)
  global.get $~lib/memory/__stack_pointer
  i32.const 12
  i32.sub
  global.set $~lib/memory/__stack_pointer
  call $~stack_check
  global.get $~lib/memory/__stack_pointer
  i64.const 0
  i64.store
  global.get $~lib/memory/__stack_pointer
  i32.const 0
  i32.store offset=8
  call $~lib/@massalabs/massa-as-sdk/assembly/env/env/env.currentPeriod
  local.set $1
  global.get $~lib/memory/__stack_pointer
  i32.const 1792
  i32.store
  i32.const 1792
  call $assembly/contracts/main/sGetU64
  local.set $3
  global.get $~lib/memory/__stack_pointer
  i32.const 1904
  i32.store
  i32.const 1904
  call $assembly/contracts/main/sGetU64
  local.set $2
  local.get $1
  local.get $3
  i64.ge_u
  if
   call $assembly/contracts/main/enhancedRunDraw
   if
    global.get $~lib/memory/__stack_pointer
    i32.const 1856
    i32.store
    i32.const 1856
    call $assembly/contracts/main/sGetU64
    local.set $3
    global.get $~lib/memory/__stack_pointer
    i32.const 1792
    i32.store
    i32.const 1792
    local.get $1
    local.get $3
    i64.add
    call $assembly/contracts/main/sSetU64
   end
  end
  local.get $1
  local.get $2
  i64.add
  call $assembly/contracts/main/scheduleTick
  global.get $~lib/memory/__stack_pointer
  i32.const 6512
  i32.store offset=4
  local.get $1
  call $~lib/util/number/utoa64
  local.set $0
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store offset=8
  i32.const 6512
  local.get $0
  call $~lib/string/String#concat
  local.set $0
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store
  local.get $0
  call $~lib/@massalabs/massa-as-sdk/assembly/std/utils/events/generateEvent
  global.get $~lib/memory/__stack_pointer
  i32.const 12
  i32.add
  global.set $~lib/memory/__stack_pointer
 )
 (func $assembly/contracts/main/manualDraw
  (local $0 i64)
  (local $1 i64)
  global.get $~lib/memory/__stack_pointer
  i32.const 4
  i32.sub
  global.set $~lib/memory/__stack_pointer
  call $~stack_check
  global.get $~lib/memory/__stack_pointer
  i32.const 0
  i32.store
  call $assembly/contracts/main/enhancedRunDraw
  if
   call $~lib/@massalabs/massa-as-sdk/assembly/env/env/env.currentPeriod
   local.set $0
   global.get $~lib/memory/__stack_pointer
   i32.const 1856
   i32.store
   i32.const 1856
   call $assembly/contracts/main/sGetU64
   local.set $1
   global.get $~lib/memory/__stack_pointer
   i32.const 1792
   i32.store
   i32.const 1792
   local.get $0
   local.get $1
   i64.add
   call $assembly/contracts/main/sSetU64
  end
  global.get $~lib/memory/__stack_pointer
  i32.const 4
  i32.add
  global.set $~lib/memory/__stack_pointer
 )
 (func $~lib/staticarray/StaticArray<u8>#concat<~lib/staticarray/StaticArray<u8>> (param $0 i32) (param $1 i32) (result i32)
  (local $2 i32)
  (local $3 i32)
  (local $4 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 8
  i32.sub
  global.set $~lib/memory/__stack_pointer
  call $~stack_check
  global.get $~lib/memory/__stack_pointer
  i64.const 0
  i64.store
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store
  local.get $0
  call $~lib/staticarray/StaticArray<u8>#get:length
  local.set $2
  global.get $~lib/memory/__stack_pointer
  local.get $1
  i32.store
  local.get $1
  call $~lib/staticarray/StaticArray<u8>#get:length
  local.tee $3
  local.get $2
  i32.add
  local.tee $4
  i32.const 1073741820
  i32.gt_u
  if
   i32.const 1456
   i32.const 1504
   i32.const 178
   i32.const 7
   call $~lib/builtins/abort
   unreachable
  end
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store offset=4
  global.get $~lib/memory/__stack_pointer
  local.get $4
  i32.const 5
  call $~lib/rt/itcms/__new
  local.tee $4
  i32.store offset=4
  local.get $4
  local.get $0
  local.get $2
  memory.copy
  local.get $2
  local.get $4
  i32.add
  local.get $1
  local.get $3
  memory.copy
  global.get $~lib/memory/__stack_pointer
  i32.const 8
  i32.add
  global.set $~lib/memory/__stack_pointer
  local.get $4
 )
 (func $"~lib/@massalabs/as-types/assembly/argument/Args#add<u64,void>" (param $0 i32) (param $1 i64) (result i32)
  (local $2 i32)
  (local $3 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 20
  i32.sub
  global.set $~lib/memory/__stack_pointer
  call $~stack_check
  global.get $~lib/memory/__stack_pointer
  i32.const 0
  i32.const 20
  memory.fill
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store offset=16
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.load offset=4
  local.tee $3
  i32.store offset=8
  global.get $~lib/memory/__stack_pointer
  i32.const 4
  i32.sub
  global.set $~lib/memory/__stack_pointer
  call $~stack_check
  global.get $~lib/memory/__stack_pointer
  i32.const 0
  i32.store
  global.get $~lib/memory/__stack_pointer
  i32.const 8
  call $~lib/staticarray/StaticArray<u8>#constructor
  local.tee $2
  i32.store
  local.get $2
  local.get $1
  i64.store
  global.get $~lib/memory/__stack_pointer
  i32.const 4
  i32.add
  global.set $~lib/memory/__stack_pointer
  global.get $~lib/memory/__stack_pointer
  local.get $2
  i32.store offset=12
  local.get $3
  local.get $2
  call $~lib/staticarray/StaticArray<u8>#concat<~lib/staticarray/StaticArray<u8>>
  local.set $2
  global.get $~lib/memory/__stack_pointer
  local.get $2
  i32.store offset=4
  local.get $0
  local.get $2
  call $~lib/@massalabs/as-types/assembly/argument/Args#set:serialized
  global.get $~lib/memory/__stack_pointer
  i32.const 20
  i32.add
  global.set $~lib/memory/__stack_pointer
  local.get $0
 )
 (func $~lib/@massalabs/as-types/assembly/argument/Args#serialize (param $0 i32) (result i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 4
  i32.sub
  global.set $~lib/memory/__stack_pointer
  call $~stack_check
  global.get $~lib/memory/__stack_pointer
  i32.const 0
  i32.store
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store
  local.get $0
  i32.load offset=4
  local.set $0
  global.get $~lib/memory/__stack_pointer
  i32.const 4
  i32.add
  global.set $~lib/memory/__stack_pointer
  local.get $0
 )
 (func $assembly/contracts/main/getTVL (result i32)
  i32.const 2352
  i32.const 2304
  i32.const 2240
  call $byn$mgfn-shared$assembly/contracts/main/getTVL
 )
 (func $assembly/contracts/main/getConservativeTVL (result i32)
  i32.const 2240
  call $byn$mgfn-shared$assembly/contracts/main/getConservativeTVL
 )
 (func $assembly/contracts/main/getModerateTVL (result i32)
  i32.const 2304
  call $byn$mgfn-shared$assembly/contracts/main/getConservativeTVL
 )
 (func $assembly/contracts/main/getAggressiveTVL (result i32)
  i32.const 2352
  call $byn$mgfn-shared$assembly/contracts/main/getConservativeTVL
 )
 (func $assembly/contracts/main/getTotalTickets (result i32)
  i32.const 2528
  i32.const 2464
  i32.const 2400
  call $byn$mgfn-shared$assembly/contracts/main/getTVL
 )
 (func $assembly/contracts/main/getConservativeTickets (result i32)
  i32.const 2400
  call $byn$mgfn-shared$assembly/contracts/main/getConservativeTVL
 )
 (func $assembly/contracts/main/getModerateTickets (result i32)
  i32.const 2464
  call $byn$mgfn-shared$assembly/contracts/main/getConservativeTVL
 )
 (func $assembly/contracts/main/getAggressiveTickets (result i32)
  i32.const 2528
  call $byn$mgfn-shared$assembly/contracts/main/getConservativeTVL
 )
 (func $assembly/contracts/main/getPrizePool (result i32)
  i32.const 1744
  call $byn$mgfn-shared$assembly/contracts/main/getConservativeTVL
 )
 (func $assembly/contracts/main/getParticipantCount (result i32)
  i32.const 1952
  call $byn$mgfn-shared$assembly/contracts/main/getConservativeTVL
 )
 (func $assembly/contracts/main/getNextDrawPeriod (result i32)
  i32.const 1792
  call $byn$mgfn-shared$assembly/contracts/main/getConservativeTVL
 )
 (func $~lib/@massalabs/as-types/assembly/result/Result<u32>#constructor (param $0 i32) (param $1 i32) (result i32)
  (local $2 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 12
  i32.sub
  global.set $~lib/memory/__stack_pointer
  call $~stack_check
  global.get $~lib/memory/__stack_pointer
  i64.const 0
  i64.store
  global.get $~lib/memory/__stack_pointer
  i32.const 0
  i32.store offset=8
  global.get $~lib/memory/__stack_pointer
  i32.const 8
  i32.const 19
  call $~lib/rt/itcms/__new
  local.tee $2
  i32.store
  global.get $~lib/memory/__stack_pointer
  local.get $2
  i32.store offset=4
  local.get $2
  local.get $0
  call $~lib/@massalabs/as-types/assembly/argument/Args#set:_offset
  global.get $~lib/memory/__stack_pointer
  local.get $2
  i32.store offset=4
  global.get $~lib/memory/__stack_pointer
  local.get $1
  i32.store offset=8
  local.get $2
  local.get $1
  call $~lib/@massalabs/as-types/assembly/argument/Args#set:serialized
  global.get $~lib/memory/__stack_pointer
  i32.const 12
  i32.add
  global.set $~lib/memory/__stack_pointer
  local.get $2
 )
 (func $~lib/@massalabs/as-types/assembly/result/Result<~lib/string/String>#constructor (param $0 i32) (param $1 i32) (result i32)
  (local $2 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 12
  i32.sub
  global.set $~lib/memory/__stack_pointer
  call $~stack_check
  global.get $~lib/memory/__stack_pointer
  i64.const 0
  i64.store
  global.get $~lib/memory/__stack_pointer
  i32.const 0
  i32.store offset=8
  global.get $~lib/memory/__stack_pointer
  i32.const 8
  i32.const 18
  call $~lib/rt/itcms/__new
  local.tee $2
  i32.store
  global.get $~lib/memory/__stack_pointer
  local.get $2
  i32.store offset=4
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store offset=8
  local.get $2
  local.get $0
  call $~lib/@massalabs/massa-as-sdk/assembly/std/address/Address#set:_value
  global.get $~lib/memory/__stack_pointer
  local.get $2
  i32.store offset=4
  global.get $~lib/memory/__stack_pointer
  local.get $1
  i32.store offset=8
  local.get $2
  local.get $1
  call $~lib/@massalabs/as-types/assembly/argument/Args#set:serialized
  global.get $~lib/memory/__stack_pointer
  i32.const 12
  i32.add
  global.set $~lib/memory/__stack_pointer
  local.get $2
 )
 (func $~lib/@massalabs/as-types/assembly/argument/Args#nextString (param $0 i32) (result i32)
  (local $1 i32)
  (local $2 i32)
  (local $3 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const -64
  i32.add
  global.set $~lib/memory/__stack_pointer
  call $~stack_check
  global.get $~lib/memory/__stack_pointer
  i32.const 0
  i32.const 64
  memory.fill
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store
  global.get $~lib/memory/__stack_pointer
  local.set $1
  global.get $~lib/memory/__stack_pointer
  i32.const 8
  i32.sub
  global.set $~lib/memory/__stack_pointer
  call $~stack_check
  global.get $~lib/memory/__stack_pointer
  i64.const 0
  i64.store
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store
  block $folding-inner0 (result i32)
   local.get $0
   i32.load
   i32.const 4
   i32.add
   local.set $2
   global.get $~lib/memory/__stack_pointer
   local.get $0
   i32.store offset=4
   global.get $~lib/memory/__stack_pointer
   local.get $0
   i32.load offset=4
   local.tee $3
   i32.store
   local.get $3
   call $~lib/staticarray/StaticArray<u8>#get:length
   local.get $2
   i32.lt_s
   if
    global.get $~lib/memory/__stack_pointer
    i32.const 6544
    i32.store
    i32.const 0
    i32.const 6544
    call $~lib/@massalabs/as-types/assembly/result/Result<u32>#constructor
    br $folding-inner0
   end
   global.get $~lib/memory/__stack_pointer
   local.get $0
   i32.store offset=4
   local.get $0
   i32.const 4
   call $~lib/@massalabs/as-types/assembly/argument/Args#getNextData
   local.set $2
   global.get $~lib/memory/__stack_pointer
   local.get $2
   i32.store
   global.get $~lib/memory/__stack_pointer
   i32.const 4
   i32.sub
   global.set $~lib/memory/__stack_pointer
   call $~stack_check
   global.get $~lib/memory/__stack_pointer
   i32.const 0
   i32.store
   global.get $~lib/memory/__stack_pointer
   local.get $2
   i32.store
   local.get $2
   i32.load
   local.set $2
   global.get $~lib/memory/__stack_pointer
   i32.const 4
   i32.add
   global.set $~lib/memory/__stack_pointer
   local.get $2
   i32.const 0
   call $~lib/@massalabs/as-types/assembly/result/Result<u32>#constructor
  end
  local.set $2
  global.get $~lib/memory/__stack_pointer
  i32.const 8
  i32.add
  global.set $~lib/memory/__stack_pointer
  local.get $1
  local.get $2
  i32.store offset=4
  global.get $~lib/memory/__stack_pointer
  local.get $2
  i32.store offset=8
  global.get $~lib/memory/__stack_pointer
  local.get $2
  i32.store offset=12
  global.get $~lib/memory/__stack_pointer
  local.get $2
  i32.store offset=16
  global.get $~lib/memory/__stack_pointer
  local.get $2
  i32.load offset=4
  local.tee $1
  i32.store
  block $folding-inner2
   block $folding-inner1
    block $folding-inner00
     local.get $1
     call $~lib/string/String.__not
     if (result i32)
      global.get $~lib/memory/__stack_pointer
      local.get $0
      i32.store
      local.get $0
      i32.load
      local.set $1
      global.get $~lib/memory/__stack_pointer
      local.get $2
      i32.store offset=20
      global.get $~lib/memory/__stack_pointer
      local.get $2
      i32.store offset=24
      global.get $~lib/memory/__stack_pointer
      local.get $2
      i32.store offset=16
      global.get $~lib/memory/__stack_pointer
      local.get $2
      i32.load offset=4
      local.tee $3
      i32.store
      local.get $3
      call $~lib/string/String.__not
      i32.eqz
      if
       global.get $~lib/memory/__stack_pointer
       local.get $2
       i32.store
       global.get $~lib/memory/__stack_pointer
       local.get $2
       i32.load offset=4
       local.tee $0
       i32.store offset=28
       local.get $0
       i32.eqz
       br_if $folding-inner00
       br $folding-inner2
      end
      global.get $~lib/memory/__stack_pointer
      local.get $2
      i32.store offset=32
      global.get $~lib/memory/__stack_pointer
      local.get $2
      i32.store
      local.get $1
      local.get $2
      i32.load
      i32.add
      local.set $1
      global.get $~lib/memory/__stack_pointer
      local.get $0
      i32.store offset=16
      global.get $~lib/memory/__stack_pointer
      local.get $0
      i32.load offset=4
      local.tee $3
      i32.store
      local.get $3
      call $~lib/staticarray/StaticArray<u8>#get:length
      local.get $1
      i32.lt_s
     else
      i32.const 1
     end
     if
      global.get $~lib/memory/__stack_pointer
      i32.const 2592
      i32.store
      global.get $~lib/memory/__stack_pointer
      i32.const 6688
      i32.store offset=16
      i32.const 2592
      i32.const 6688
      call $~lib/@massalabs/as-types/assembly/result/Result<~lib/string/String>#constructor
      local.set $0
      br $folding-inner1
     end
     global.get $~lib/memory/__stack_pointer
     local.set $1
     global.get $~lib/memory/__stack_pointer
     local.get $0
     i32.store offset=16
     global.get $~lib/memory/__stack_pointer
     local.get $2
     i32.store offset=36
     global.get $~lib/memory/__stack_pointer
     local.get $2
     i32.store offset=40
     global.get $~lib/memory/__stack_pointer
     local.get $2
     i32.store offset=48
     global.get $~lib/memory/__stack_pointer
     local.get $2
     i32.load offset=4
     local.tee $3
     i32.store offset=44
     local.get $3
     call $~lib/string/String.__not
     i32.eqz
     if
      global.get $~lib/memory/__stack_pointer
      local.get $2
      i32.store offset=44
      global.get $~lib/memory/__stack_pointer
      local.get $2
      i32.load offset=4
      local.tee $0
      i32.store offset=52
      local.get $0
      i32.eqz
      br_if $folding-inner00
      br $folding-inner2
     end
     global.get $~lib/memory/__stack_pointer
     local.get $2
     i32.store offset=56
     global.get $~lib/memory/__stack_pointer
     local.get $2
     i32.store offset=44
     local.get $0
     local.get $2
     i32.load
     call $~lib/@massalabs/as-types/assembly/argument/Args#getNextData
     local.set $0
     global.get $~lib/memory/__stack_pointer
     local.get $0
     i32.store
     local.get $1
     local.get $0
     call $~lib/@massalabs/as-types/assembly/serialization/strings/bytesToString
     local.tee $0
     i32.store offset=60
     global.get $~lib/memory/__stack_pointer
     local.get $0
     i32.store
     local.get $0
     i32.const 0
     call $~lib/@massalabs/as-types/assembly/result/Result<~lib/string/String>#constructor
     local.set $0
     br $folding-inner1
    end
    i32.const 3152
    i32.const 3280
    i32.const 70
    i32.const 21
    call $~lib/builtins/abort
    unreachable
   end
   global.get $~lib/memory/__stack_pointer
   i32.const -64
   i32.sub
   global.set $~lib/memory/__stack_pointer
   local.get $0
   return
  end
  local.get $0
  i32.const 3280
  i32.const 70
  i32.const 7
  call $~lib/builtins/abort
  unreachable
 )
 (func $assembly/contracts/main/getUserPrincipal (param $0 i32) (result i32)
  (local $1 i64)
  (local $2 i32)
  (local $3 i32)
  (local $4 i64)
  global.get $~lib/memory/__stack_pointer
  i32.const 48
  i32.sub
  global.set $~lib/memory/__stack_pointer
  call $~stack_check
  global.get $~lib/memory/__stack_pointer
  i32.const 0
  i32.const 48
  memory.fill
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store
  global.get $~lib/memory/__stack_pointer
  local.get $0
  call $~lib/@massalabs/as-types/assembly/argument/Args#constructor
  local.tee $0
  i32.store offset=4
  global.get $~lib/memory/__stack_pointer
  local.set $2
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store
  global.get $~lib/memory/__stack_pointer
  local.get $0
  call $~lib/@massalabs/as-types/assembly/argument/Args#nextString
  local.tee $3
  i32.store offset=8
  global.get $~lib/memory/__stack_pointer
  i32.const 6832
  i32.store offset=12
  global.get $~lib/memory/__stack_pointer
  local.get $3
  i32.store offset=16
  global.get $~lib/memory/__stack_pointer
  local.get $3
  i32.store offset=20
  global.get $~lib/memory/__stack_pointer
  local.get $3
  i32.store offset=24
  global.get $~lib/memory/__stack_pointer
  local.get $3
  i32.load offset=4
  local.tee $0
  i32.store
  local.get $0
  call $~lib/string/String.__not
  i32.eqz
  if
   global.get $~lib/memory/__stack_pointer
   i32.const 6832
   i32.store offset=28
   global.get $~lib/memory/__stack_pointer
   local.get $3
   i32.store
   global.get $~lib/memory/__stack_pointer
   local.get $3
   i32.load offset=4
   local.tee $0
   i32.store offset=32
   global.get $~lib/memory/__stack_pointer
   local.set $2
   local.get $0
   i32.eqz
   if
    i32.const 3152
    i32.const 3280
    i32.const 52
    i32.const 32
    call $~lib/builtins/abort
    unreachable
   end
   local.get $2
   local.get $0
   i32.store offset=36
   global.get $~lib/memory/__stack_pointer
   i32.const 6880
   i32.store
   global.get $~lib/memory/__stack_pointer
   i32.const 6832
   i32.store offset=24
   i32.const 6880
   i32.const 0
   i32.const 6832
   call $~lib/staticarray/StaticArray<~lib/string/String>#__uset
   global.get $~lib/memory/__stack_pointer
   i32.const 6880
   i32.store
   global.get $~lib/memory/__stack_pointer
   local.get $0
   i32.store offset=24
   i32.const 6880
   i32.const 2
   local.get $0
   call $~lib/staticarray/StaticArray<~lib/string/String>#__uset
   global.get $~lib/memory/__stack_pointer
   i32.const 6880
   i32.store
   global.get $~lib/memory/__stack_pointer
   i32.const 2592
   i32.store offset=24
   i32.const 6880
   call $~lib/staticarray/StaticArray<~lib/string/String>#join
   i32.const 3280
   i32.const 52
   i32.const 7
   call $~lib/builtins/abort
   unreachable
  end
  global.get $~lib/memory/__stack_pointer
  local.get $3
  i32.store offset=40
  global.get $~lib/memory/__stack_pointer
  local.get $3
  i32.store
  local.get $2
  local.get $3
  i32.load
  local.tee $0
  i32.store offset=44
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store offset=24
  local.get $0
  call $assembly/contracts/main/userPrincipalConservativeKey
  local.set $2
  global.get $~lib/memory/__stack_pointer
  local.get $2
  i32.store
  local.get $2
  call $assembly/contracts/main/sGetU64
  local.set $1
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store offset=24
  local.get $0
  call $assembly/contracts/main/userPrincipalModerateKey
  local.set $2
  global.get $~lib/memory/__stack_pointer
  local.get $2
  i32.store
  local.get $2
  call $assembly/contracts/main/sGetU64
  local.set $4
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store offset=24
  local.get $0
  call $assembly/contracts/main/userPrincipalAggressiveKey
  local.set $0
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store
  local.get $0
  call $assembly/contracts/main/sGetU64
  local.get $1
  local.get $4
  i64.add
  i64.add
  local.set $1
  i32.const 0
  global.set $~argumentsLength
  call $~lib/@massalabs/as-types/assembly/argument/Args#constructor@varargs
  local.set $0
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store offset=24
  local.get $0
  local.get $1
  call $"~lib/@massalabs/as-types/assembly/argument/Args#add<u64,void>"
  local.set $0
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store
  local.get $0
  call $~lib/@massalabs/as-types/assembly/argument/Args#serialize
  local.set $0
  global.get $~lib/memory/__stack_pointer
  i32.const 48
  i32.add
  global.set $~lib/memory/__stack_pointer
  local.get $0
 )
 (func $assembly/contracts/main/getUserTickets (param $0 i32) (result i32)
  (local $1 i64)
  (local $2 i32)
  (local $3 i32)
  (local $4 i64)
  global.get $~lib/memory/__stack_pointer
  i32.const 48
  i32.sub
  global.set $~lib/memory/__stack_pointer
  call $~stack_check
  global.get $~lib/memory/__stack_pointer
  i32.const 0
  i32.const 48
  memory.fill
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store
  global.get $~lib/memory/__stack_pointer
  local.get $0
  call $~lib/@massalabs/as-types/assembly/argument/Args#constructor
  local.tee $0
  i32.store offset=4
  global.get $~lib/memory/__stack_pointer
  local.set $2
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store
  global.get $~lib/memory/__stack_pointer
  local.get $0
  call $~lib/@massalabs/as-types/assembly/argument/Args#nextString
  local.tee $3
  i32.store offset=8
  global.get $~lib/memory/__stack_pointer
  i32.const 6832
  i32.store offset=12
  global.get $~lib/memory/__stack_pointer
  local.get $3
  i32.store offset=16
  global.get $~lib/memory/__stack_pointer
  local.get $3
  i32.store offset=20
  global.get $~lib/memory/__stack_pointer
  local.get $3
  i32.store offset=24
  global.get $~lib/memory/__stack_pointer
  local.get $3
  i32.load offset=4
  local.tee $0
  i32.store
  local.get $0
  call $~lib/string/String.__not
  i32.eqz
  if
   global.get $~lib/memory/__stack_pointer
   i32.const 6832
   i32.store offset=28
   global.get $~lib/memory/__stack_pointer
   local.get $3
   i32.store
   global.get $~lib/memory/__stack_pointer
   local.get $3
   i32.load offset=4
   local.tee $0
   i32.store offset=32
   global.get $~lib/memory/__stack_pointer
   local.set $2
   local.get $0
   i32.eqz
   if
    i32.const 3152
    i32.const 3280
    i32.const 52
    i32.const 32
    call $~lib/builtins/abort
    unreachable
   end
   local.get $2
   local.get $0
   i32.store offset=36
   global.get $~lib/memory/__stack_pointer
   i32.const 6912
   i32.store
   global.get $~lib/memory/__stack_pointer
   i32.const 6832
   i32.store offset=24
   i32.const 6912
   i32.const 0
   i32.const 6832
   call $~lib/staticarray/StaticArray<~lib/string/String>#__uset
   global.get $~lib/memory/__stack_pointer
   i32.const 6912
   i32.store
   global.get $~lib/memory/__stack_pointer
   local.get $0
   i32.store offset=24
   i32.const 6912
   i32.const 2
   local.get $0
   call $~lib/staticarray/StaticArray<~lib/string/String>#__uset
   global.get $~lib/memory/__stack_pointer
   i32.const 6912
   i32.store
   global.get $~lib/memory/__stack_pointer
   i32.const 2592
   i32.store offset=24
   i32.const 6912
   call $~lib/staticarray/StaticArray<~lib/string/String>#join
   i32.const 3280
   i32.const 52
   i32.const 7
   call $~lib/builtins/abort
   unreachable
  end
  global.get $~lib/memory/__stack_pointer
  local.get $3
  i32.store offset=40
  global.get $~lib/memory/__stack_pointer
  local.get $3
  i32.store
  local.get $2
  local.get $3
  i32.load
  local.tee $0
  i32.store offset=44
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store offset=24
  local.get $0
  call $assembly/contracts/main/userTicketsConservativeKey
  local.set $2
  global.get $~lib/memory/__stack_pointer
  local.get $2
  i32.store
  local.get $2
  call $assembly/contracts/main/sGetU64
  local.set $1
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store offset=24
  local.get $0
  call $assembly/contracts/main/userTicketsModerateKey
  local.set $2
  global.get $~lib/memory/__stack_pointer
  local.get $2
  i32.store
  local.get $2
  call $assembly/contracts/main/sGetU64
  local.set $4
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store offset=24
  local.get $0
  call $assembly/contracts/main/userTicketsAggressiveKey
  local.set $0
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store
  local.get $0
  call $assembly/contracts/main/sGetU64
  local.get $1
  local.get $4
  i64.add
  i64.add
  local.set $1
  i32.const 0
  global.set $~argumentsLength
  call $~lib/@massalabs/as-types/assembly/argument/Args#constructor@varargs
  local.set $0
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store offset=24
  local.get $0
  local.get $1
  call $"~lib/@massalabs/as-types/assembly/argument/Args#add<u64,void>"
  local.set $0
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store
  local.get $0
  call $~lib/@massalabs/as-types/assembly/argument/Args#serialize
  local.set $0
  global.get $~lib/memory/__stack_pointer
  i32.const 48
  i32.add
  global.set $~lib/memory/__stack_pointer
  local.get $0
 )
 (func $"~lib/@massalabs/as-types/assembly/argument/Args#add<~lib/string/String,void>" (param $0 i32) (param $1 i32) (result i32)
  (local $2 i32)
  (local $3 i32)
  (local $4 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 24
  i32.sub
  global.set $~lib/memory/__stack_pointer
  call $~stack_check
  global.get $~lib/memory/__stack_pointer
  i32.const 0
  i32.const 24
  memory.fill
  global.get $~lib/memory/__stack_pointer
  local.get $1
  i32.store
  global.get $~lib/memory/__stack_pointer
  local.get $1
  call $~lib/@massalabs/as-types/assembly/serialization/strings/stringToBytes
  local.tee $2
  i32.store offset=4
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store
  global.get $~lib/memory/__stack_pointer
  local.get $2
  i32.store offset=8
  local.get $2
  call $~lib/staticarray/StaticArray<u8>#get:length
  local.set $4
  global.get $~lib/memory/__stack_pointer
  i32.const 20
  i32.sub
  global.set $~lib/memory/__stack_pointer
  call $~stack_check
  global.get $~lib/memory/__stack_pointer
  i32.const 0
  i32.const 20
  memory.fill
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store offset=16
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.load offset=4
  local.tee $1
  i32.store offset=8
  global.get $~lib/memory/__stack_pointer
  i32.const 4
  i32.sub
  global.set $~lib/memory/__stack_pointer
  call $~stack_check
  global.get $~lib/memory/__stack_pointer
  i32.const 0
  i32.store
  global.get $~lib/memory/__stack_pointer
  i32.const 4
  call $~lib/staticarray/StaticArray<u8>#constructor
  local.tee $3
  i32.store
  local.get $3
  local.get $4
  i32.store
  global.get $~lib/memory/__stack_pointer
  i32.const 4
  i32.add
  global.set $~lib/memory/__stack_pointer
  global.get $~lib/memory/__stack_pointer
  local.get $3
  i32.store offset=12
  local.get $1
  local.get $3
  call $~lib/staticarray/StaticArray<u8>#concat<~lib/staticarray/StaticArray<u8>>
  local.set $1
  global.get $~lib/memory/__stack_pointer
  local.get $1
  i32.store offset=4
  local.get $0
  local.get $1
  call $~lib/@massalabs/as-types/assembly/argument/Args#set:serialized
  global.get $~lib/memory/__stack_pointer
  i32.const 20
  i32.add
  global.set $~lib/memory/__stack_pointer
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store offset=20
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.load offset=4
  local.tee $1
  i32.store offset=12
  global.get $~lib/memory/__stack_pointer
  local.get $2
  i32.store offset=16
  local.get $1
  local.get $2
  call $~lib/staticarray/StaticArray<u8>#concat<~lib/staticarray/StaticArray<u8>>
  local.set $1
  global.get $~lib/memory/__stack_pointer
  local.get $1
  i32.store offset=8
  local.get $0
  local.get $1
  call $~lib/@massalabs/as-types/assembly/argument/Args#set:serialized
  global.get $~lib/memory/__stack_pointer
  i32.const 24
  i32.add
  global.set $~lib/memory/__stack_pointer
  local.get $0
 )
 (func $assembly/contracts/main/getUserTier (param $0 i32) (result i32)
  (local $1 i32)
  (local $2 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 56
  i32.sub
  global.set $~lib/memory/__stack_pointer
  call $~stack_check
  global.get $~lib/memory/__stack_pointer
  i32.const 0
  i32.const 56
  memory.fill
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store
  global.get $~lib/memory/__stack_pointer
  local.get $0
  call $~lib/@massalabs/as-types/assembly/argument/Args#constructor
  local.tee $0
  i32.store offset=4
  global.get $~lib/memory/__stack_pointer
  local.set $1
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store
  global.get $~lib/memory/__stack_pointer
  local.get $0
  call $~lib/@massalabs/as-types/assembly/argument/Args#nextString
  local.tee $0
  i32.store offset=8
  global.get $~lib/memory/__stack_pointer
  i32.const 6832
  i32.store offset=12
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store offset=16
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store offset=20
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store offset=24
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.load offset=4
  local.tee $2
  i32.store
  local.get $2
  call $~lib/string/String.__not
  i32.eqz
  if
   global.get $~lib/memory/__stack_pointer
   i32.const 6832
   i32.store offset=28
   global.get $~lib/memory/__stack_pointer
   local.get $0
   i32.store
   global.get $~lib/memory/__stack_pointer
   local.get $0
   i32.load offset=4
   local.tee $0
   i32.store offset=32
   global.get $~lib/memory/__stack_pointer
   local.set $1
   local.get $0
   i32.eqz
   if
    i32.const 3152
    i32.const 3280
    i32.const 52
    i32.const 32
    call $~lib/builtins/abort
    unreachable
   end
   local.get $1
   local.get $0
   i32.store offset=36
   global.get $~lib/memory/__stack_pointer
   i32.const 6944
   i32.store
   global.get $~lib/memory/__stack_pointer
   i32.const 6832
   i32.store offset=24
   i32.const 6944
   i32.const 0
   i32.const 6832
   call $~lib/staticarray/StaticArray<~lib/string/String>#__uset
   global.get $~lib/memory/__stack_pointer
   i32.const 6944
   i32.store
   global.get $~lib/memory/__stack_pointer
   local.get $0
   i32.store offset=24
   i32.const 6944
   i32.const 2
   local.get $0
   call $~lib/staticarray/StaticArray<~lib/string/String>#__uset
   global.get $~lib/memory/__stack_pointer
   i32.const 6944
   i32.store
   global.get $~lib/memory/__stack_pointer
   i32.const 2592
   i32.store offset=24
   i32.const 6944
   call $~lib/staticarray/StaticArray<~lib/string/String>#join
   i32.const 3280
   i32.const 52
   i32.const 7
   call $~lib/builtins/abort
   unreachable
  end
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store offset=40
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store
  local.get $1
  local.get $0
  i32.load
  local.tee $0
  i32.store offset=44
  global.get $~lib/memory/__stack_pointer
  local.set $1
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store offset=24
  local.get $0
  call $assembly/contracts/main/userTierKey
  local.set $2
  global.get $~lib/memory/__stack_pointer
  local.get $2
  i32.store
  local.get $1
  local.get $2
  call $~lib/@massalabs/massa-as-sdk/assembly/std/storage/has<~lib/string/String>
  if (result i32)
   global.get $~lib/memory/__stack_pointer
   local.get $0
   i32.store offset=24
   local.get $0
   call $assembly/contracts/main/userTierKey
   local.set $0
   global.get $~lib/memory/__stack_pointer
   local.get $0
   i32.store
   local.get $0
   call $~lib/@massalabs/massa-as-sdk/assembly/std/storage/get<~lib/string/String>
  else
   i32.const 6976
  end
  local.tee $0
  i32.store offset=48
  i32.const 0
  global.set $~argumentsLength
  call $~lib/@massalabs/as-types/assembly/argument/Args#constructor@varargs
  local.set $1
  global.get $~lib/memory/__stack_pointer
  local.get $1
  i32.store offset=24
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store offset=52
  local.get $1
  local.get $0
  call $"~lib/@massalabs/as-types/assembly/argument/Args#add<~lib/string/String,void>"
  local.set $0
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store
  local.get $0
  call $~lib/@massalabs/as-types/assembly/argument/Args#serialize
  local.set $0
  global.get $~lib/memory/__stack_pointer
  i32.const 56
  i32.add
  global.set $~lib/memory/__stack_pointer
  local.get $0
 )
 (func $assembly/contracts/main/getWinnerCount (result i32)
  i32.const 2128
  call $byn$mgfn-shared$assembly/contracts/main/getConservativeTVL
 )
 (func $assembly/contracts/main/getWinner (param $0 i32) (result i32)
  (local $1 i64)
  (local $2 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 52
  i32.sub
  global.set $~lib/memory/__stack_pointer
  call $~stack_check
  global.get $~lib/memory/__stack_pointer
  i32.const 0
  i32.const 52
  memory.fill
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store
  global.get $~lib/memory/__stack_pointer
  local.get $0
  call $~lib/@massalabs/as-types/assembly/argument/Args#constructor
  local.tee $0
  i32.store offset=4
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store
  global.get $~lib/memory/__stack_pointer
  local.get $0
  call $~lib/@massalabs/as-types/assembly/argument/Args#nextU64
  local.tee $0
  i32.store offset=8
  global.get $~lib/memory/__stack_pointer
  i32.const 7008
  i32.store offset=12
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store offset=16
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store offset=20
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store offset=24
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.load offset=8
  local.tee $2
  i32.store
  local.get $2
  call $~lib/string/String.__not
  i32.eqz
  if
   global.get $~lib/memory/__stack_pointer
   i32.const 7008
   i32.store offset=28
   global.get $~lib/memory/__stack_pointer
   local.get $0
   i32.store
   global.get $~lib/memory/__stack_pointer
   local.get $0
   i32.load offset=8
   local.tee $0
   i32.store offset=32
   global.get $~lib/memory/__stack_pointer
   local.set $2
   local.get $0
   i32.eqz
   if
    i32.const 3152
    i32.const 3280
    i32.const 52
    i32.const 32
    call $~lib/builtins/abort
    unreachable
   end
   local.get $2
   local.get $0
   i32.store offset=36
   global.get $~lib/memory/__stack_pointer
   i32.const 7040
   i32.store
   global.get $~lib/memory/__stack_pointer
   i32.const 7008
   i32.store offset=24
   i32.const 7040
   i32.const 0
   i32.const 7008
   call $~lib/staticarray/StaticArray<~lib/string/String>#__uset
   global.get $~lib/memory/__stack_pointer
   i32.const 7040
   i32.store
   global.get $~lib/memory/__stack_pointer
   local.get $0
   i32.store offset=24
   i32.const 7040
   i32.const 2
   local.get $0
   call $~lib/staticarray/StaticArray<~lib/string/String>#__uset
   global.get $~lib/memory/__stack_pointer
   i32.const 7040
   i32.store
   global.get $~lib/memory/__stack_pointer
   i32.const 2592
   i32.store offset=24
   i32.const 7040
   call $~lib/staticarray/StaticArray<~lib/string/String>#join
   i32.const 3280
   i32.const 52
   i32.const 7
   call $~lib/builtins/abort
   unreachable
  end
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store offset=40
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store
  global.get $~lib/memory/__stack_pointer
  local.set $2
  local.get $0
  i64.load
  local.tee $1
  i32.wrap_i64
  call $assembly/contracts/main/winnerKey
  local.set $0
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store
  local.get $2
  local.get $0
  call $~lib/@massalabs/massa-as-sdk/assembly/std/storage/has<~lib/string/String>
  if (result i32)
   local.get $1
   i32.wrap_i64
   call $assembly/contracts/main/winnerKey
   local.set $0
   global.get $~lib/memory/__stack_pointer
   local.get $0
   i32.store
   local.get $0
   call $~lib/@massalabs/massa-as-sdk/assembly/std/storage/get<~lib/string/String>
  else
   i32.const 2592
  end
  local.tee $0
  i32.store offset=44
  i32.const 0
  global.set $~argumentsLength
  call $~lib/@massalabs/as-types/assembly/argument/Args#constructor@varargs
  local.set $2
  global.get $~lib/memory/__stack_pointer
  local.get $2
  i32.store offset=24
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store offset=48
  local.get $2
  local.get $0
  call $"~lib/@massalabs/as-types/assembly/argument/Args#add<~lib/string/String,void>"
  local.set $0
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store
  local.get $0
  call $~lib/@massalabs/as-types/assembly/argument/Args#serialize
  local.set $0
  global.get $~lib/memory/__stack_pointer
  i32.const 52
  i32.add
  global.set $~lib/memory/__stack_pointer
  local.get $0
 )
 (func $assembly/contracts/main/stringToBytes (param $0 i32) (result i32)
  (local $1 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 12
  i32.sub
  global.set $~lib/memory/__stack_pointer
  call $~stack_check
  global.get $~lib/memory/__stack_pointer
  i64.const 0
  i64.store
  global.get $~lib/memory/__stack_pointer
  i32.const 0
  i32.store offset=8
  global.get $~lib/memory/__stack_pointer
  local.set $1
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store
  i32.const 1
  global.set $~argumentsLength
  global.get $~lib/memory/__stack_pointer
  i32.const 4
  i32.sub
  global.set $~lib/memory/__stack_pointer
  call $~stack_check
  global.get $~lib/memory/__stack_pointer
  i32.const 0
  i32.store
  block $2of2
   block $outOfRange
    global.get $~argumentsLength
    i32.const 1
    i32.sub
    br_table $2of2 $2of2 $2of2 $outOfRange
   end
   unreachable
  end
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store
  local.get $0
  i32.const 0
  call $~lib/string/String.UTF8.encode
  local.set $0
  global.get $~lib/memory/__stack_pointer
  i32.const 4
  i32.add
  global.set $~lib/memory/__stack_pointer
  local.get $1
  local.get $0
  i32.store offset=4
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store
  global.get $~lib/memory/__stack_pointer
  local.get $0
  call $~lib/staticarray/StaticArray<u8>#get:length
  call $~lib/staticarray/StaticArray<u8>#constructor
  local.tee $1
  i32.store offset=8
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store
  local.get $1
  local.get $0
  local.get $0
  call $~lib/staticarray/StaticArray<u8>#get:length
  memory.copy
  global.get $~lib/memory/__stack_pointer
  i32.const 12
  i32.add
  global.set $~lib/memory/__stack_pointer
  local.get $1
 )
 (func $assembly/contracts/main/getVaultStats (result i32)
  (local $0 i32)
  (local $1 i64)
  (local $2 i32)
  (local $3 i32)
  (local $4 i32)
  (local $5 i32)
  (local $6 i32)
  (local $7 i32)
  (local $8 i32)
  (local $9 i32)
  (local $10 i32)
  (local $11 i32)
  (local $12 i64)
  (local $13 i64)
  (local $14 i64)
  (local $15 i32)
  (local $16 i64)
  (local $17 i64)
  (local $18 i32)
  (local $19 i64)
  (local $20 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const -64
  i32.add
  global.set $~lib/memory/__stack_pointer
  call $~stack_check
  global.get $~lib/memory/__stack_pointer
  i32.const 0
  i32.const 64
  memory.fill
  global.get $~lib/memory/__stack_pointer
  i32.const 2240
  i32.store
  i32.const 2240
  call $assembly/contracts/main/sGetU64
  local.set $1
  global.get $~lib/memory/__stack_pointer
  i32.const 2304
  i32.store
  i32.const 2304
  call $assembly/contracts/main/sGetU64
  local.get $1
  i64.add
  local.set $1
  global.get $~lib/memory/__stack_pointer
  i32.const 2352
  i32.store
  i32.const 2352
  call $assembly/contracts/main/sGetU64
  local.get $1
  i64.add
  local.set $16
  global.get $~lib/memory/__stack_pointer
  i32.const 2400
  i32.store
  i32.const 2400
  call $assembly/contracts/main/sGetU64
  local.set $1
  global.get $~lib/memory/__stack_pointer
  i32.const 2464
  i32.store
  i32.const 2464
  call $assembly/contracts/main/sGetU64
  local.get $1
  i64.add
  local.set $1
  global.get $~lib/memory/__stack_pointer
  i32.const 2528
  i32.store
  i32.const 2528
  call $assembly/contracts/main/sGetU64
  local.get $1
  i64.add
  local.set $17
  global.get $~lib/memory/__stack_pointer
  i32.const 1744
  i32.store
  i32.const 1744
  call $assembly/contracts/main/sGetU64
  local.set $19
  global.get $~lib/memory/__stack_pointer
  i32.const 1952
  i32.store
  i32.const 1952
  call $assembly/contracts/main/sGetU64
  local.set $1
  global.get $~lib/memory/__stack_pointer
  i32.const 1792
  i32.store
  i32.const 1792
  call $assembly/contracts/main/sGetU64
  local.set $12
  global.get $~lib/memory/__stack_pointer
  i32.const 2176
  i32.store
  i32.const 2176
  call $assembly/contracts/main/sGetU64
  local.set $13
  global.get $~lib/memory/__stack_pointer
  i32.const 2128
  i32.store
  i32.const 2128
  call $assembly/contracts/main/sGetU64
  local.set $14
  global.get $~lib/memory/__stack_pointer
  local.set $15
  global.get $~lib/memory/__stack_pointer
  local.get $16
  call $~lib/util/number/utoa64
  local.tee $18
  i32.store offset=4
  global.get $~lib/memory/__stack_pointer
  local.get $17
  call $~lib/util/number/utoa64
  local.tee $20
  i32.store offset=8
  global.get $~lib/memory/__stack_pointer
  local.get $19
  call $~lib/util/number/utoa64
  local.tee $0
  i32.store offset=12
  global.get $~lib/memory/__stack_pointer
  local.get $1
  call $~lib/util/number/utoa64
  local.tee $2
  i32.store offset=16
  global.get $~lib/memory/__stack_pointer
  local.get $12
  call $~lib/util/number/utoa64
  local.tee $3
  i32.store offset=20
  global.get $~lib/memory/__stack_pointer
  local.get $13
  call $~lib/util/number/utoa64
  local.tee $4
  i32.store offset=24
  global.get $~lib/memory/__stack_pointer
  local.get $14
  call $~lib/util/number/utoa64
  local.tee $5
  i32.store offset=28
  global.get $~lib/memory/__stack_pointer
  i32.const 2240
  i32.store
  global.get $~lib/memory/__stack_pointer
  i32.const 2240
  call $assembly/contracts/main/sGetU64
  call $~lib/util/number/utoa64
  local.tee $6
  i32.store offset=32
  global.get $~lib/memory/__stack_pointer
  i32.const 2304
  i32.store
  global.get $~lib/memory/__stack_pointer
  i32.const 2304
  call $assembly/contracts/main/sGetU64
  call $~lib/util/number/utoa64
  local.tee $7
  i32.store offset=36
  global.get $~lib/memory/__stack_pointer
  i32.const 2352
  i32.store
  global.get $~lib/memory/__stack_pointer
  i32.const 2352
  call $assembly/contracts/main/sGetU64
  call $~lib/util/number/utoa64
  local.tee $8
  i32.store offset=40
  global.get $~lib/memory/__stack_pointer
  i32.const 2400
  i32.store
  global.get $~lib/memory/__stack_pointer
  i32.const 2400
  call $assembly/contracts/main/sGetU64
  call $~lib/util/number/utoa64
  local.tee $9
  i32.store offset=44
  global.get $~lib/memory/__stack_pointer
  i32.const 2464
  i32.store
  global.get $~lib/memory/__stack_pointer
  i32.const 2464
  call $assembly/contracts/main/sGetU64
  call $~lib/util/number/utoa64
  local.tee $10
  i32.store offset=48
  global.get $~lib/memory/__stack_pointer
  i32.const 2528
  i32.store
  global.get $~lib/memory/__stack_pointer
  i32.const 2528
  call $assembly/contracts/main/sGetU64
  call $~lib/util/number/utoa64
  local.tee $11
  i32.store offset=52
  global.get $~lib/memory/__stack_pointer
  i32.const 8336
  i32.store
  global.get $~lib/memory/__stack_pointer
  local.get $18
  i32.store offset=56
  i32.const 8336
  i32.const 1
  local.get $18
  call $~lib/staticarray/StaticArray<~lib/string/String>#__uset
  global.get $~lib/memory/__stack_pointer
  i32.const 8336
  i32.store
  global.get $~lib/memory/__stack_pointer
  local.get $20
  i32.store offset=56
  i32.const 8336
  i32.const 3
  local.get $20
  call $~lib/staticarray/StaticArray<~lib/string/String>#__uset
  global.get $~lib/memory/__stack_pointer
  i32.const 8336
  i32.store
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store offset=56
  i32.const 8336
  i32.const 5
  local.get $0
  call $~lib/staticarray/StaticArray<~lib/string/String>#__uset
  global.get $~lib/memory/__stack_pointer
  i32.const 8336
  i32.store
  global.get $~lib/memory/__stack_pointer
  local.get $2
  i32.store offset=56
  i32.const 8336
  i32.const 7
  local.get $2
  call $~lib/staticarray/StaticArray<~lib/string/String>#__uset
  global.get $~lib/memory/__stack_pointer
  i32.const 8336
  i32.store
  global.get $~lib/memory/__stack_pointer
  local.get $3
  i32.store offset=56
  i32.const 8336
  i32.const 9
  local.get $3
  call $~lib/staticarray/StaticArray<~lib/string/String>#__uset
  global.get $~lib/memory/__stack_pointer
  i32.const 8336
  i32.store
  global.get $~lib/memory/__stack_pointer
  local.get $4
  i32.store offset=56
  i32.const 8336
  i32.const 11
  local.get $4
  call $~lib/staticarray/StaticArray<~lib/string/String>#__uset
  global.get $~lib/memory/__stack_pointer
  i32.const 8336
  i32.store
  global.get $~lib/memory/__stack_pointer
  local.get $5
  i32.store offset=56
  i32.const 8336
  i32.const 13
  local.get $5
  call $~lib/staticarray/StaticArray<~lib/string/String>#__uset
  global.get $~lib/memory/__stack_pointer
  i32.const 8336
  i32.store
  global.get $~lib/memory/__stack_pointer
  local.get $6
  i32.store offset=56
  i32.const 8336
  i32.const 15
  local.get $6
  call $~lib/staticarray/StaticArray<~lib/string/String>#__uset
  global.get $~lib/memory/__stack_pointer
  i32.const 8336
  i32.store
  global.get $~lib/memory/__stack_pointer
  local.get $7
  i32.store offset=56
  i32.const 8336
  i32.const 17
  local.get $7
  call $~lib/staticarray/StaticArray<~lib/string/String>#__uset
  global.get $~lib/memory/__stack_pointer
  i32.const 8336
  i32.store
  global.get $~lib/memory/__stack_pointer
  local.get $8
  i32.store offset=56
  i32.const 8336
  i32.const 19
  local.get $8
  call $~lib/staticarray/StaticArray<~lib/string/String>#__uset
  global.get $~lib/memory/__stack_pointer
  i32.const 8336
  i32.store
  global.get $~lib/memory/__stack_pointer
  local.get $9
  i32.store offset=56
  i32.const 8336
  i32.const 21
  local.get $9
  call $~lib/staticarray/StaticArray<~lib/string/String>#__uset
  global.get $~lib/memory/__stack_pointer
  i32.const 8336
  i32.store
  global.get $~lib/memory/__stack_pointer
  local.get $10
  i32.store offset=56
  i32.const 8336
  i32.const 23
  local.get $10
  call $~lib/staticarray/StaticArray<~lib/string/String>#__uset
  global.get $~lib/memory/__stack_pointer
  i32.const 8336
  i32.store
  global.get $~lib/memory/__stack_pointer
  local.get $11
  i32.store offset=56
  i32.const 8336
  i32.const 25
  local.get $11
  call $~lib/staticarray/StaticArray<~lib/string/String>#__uset
  global.get $~lib/memory/__stack_pointer
  i32.const 8336
  i32.store
  global.get $~lib/memory/__stack_pointer
  i32.const 2592
  i32.store offset=56
  local.get $15
  i32.const 8336
  call $~lib/staticarray/StaticArray<~lib/string/String>#join
  local.tee $0
  i32.store offset=60
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store
  local.get $0
  call $assembly/contracts/main/stringToBytes
  local.set $0
  global.get $~lib/memory/__stack_pointer
  i32.const -64
  i32.sub
  global.set $~lib/memory/__stack_pointer
  local.get $0
 )
 (func $assembly/contracts/main/getUserPosition (param $0 i32) (result i32)
  (local $1 i64)
  (local $2 i64)
  (local $3 i32)
  (local $4 i32)
  (local $5 i32)
  (local $6 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 60
  i32.sub
  global.set $~lib/memory/__stack_pointer
  call $~stack_check
  global.get $~lib/memory/__stack_pointer
  i32.const 0
  i32.const 60
  memory.fill
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store
  global.get $~lib/memory/__stack_pointer
  local.get $0
  call $~lib/@massalabs/as-types/assembly/argument/Args#constructor
  local.tee $0
  i32.store offset=4
  global.get $~lib/memory/__stack_pointer
  local.set $3
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store
  global.get $~lib/memory/__stack_pointer
  local.get $0
  call $~lib/@massalabs/as-types/assembly/argument/Args#nextString
  local.tee $0
  i32.store offset=8
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store offset=12
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store offset=16
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.load offset=4
  local.tee $4
  i32.store
  local.get $4
  call $~lib/string/String.__not
  i32.eqz
  if
   global.get $~lib/memory/__stack_pointer
   local.get $0
   i32.store
   global.get $~lib/memory/__stack_pointer
   local.get $0
   i32.load offset=4
   local.tee $0
   i32.store offset=20
   local.get $0
   i32.eqz
   if
    i32.const 3152
    i32.const 3280
    i32.const 70
    i32.const 21
    call $~lib/builtins/abort
    unreachable
   end
   local.get $0
   i32.const 3280
   i32.const 70
   i32.const 7
   call $~lib/builtins/abort
   unreachable
  end
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store offset=24
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store
  local.get $3
  local.get $0
  i32.load
  local.tee $3
  i32.store offset=28
  global.get $~lib/memory/__stack_pointer
  local.get $3
  i32.store
  global.get $~lib/memory/__stack_pointer
  local.get $3
  call $assembly/contracts/main/userTierKey
  local.tee $4
  i32.store offset=32
  global.get $~lib/memory/__stack_pointer
  local.get $4
  i32.store
  local.get $4
  call $~lib/@massalabs/massa-as-sdk/assembly/std/storage/has<~lib/string/String>
  local.set $5
  i32.const 3616
  local.set $0
  global.get $~lib/memory/__stack_pointer
  i32.const 3616
  i32.store offset=36
  local.get $5
  if (result i64)
   global.get $~lib/memory/__stack_pointer
   local.get $4
   i32.store
   global.get $~lib/memory/__stack_pointer
   local.get $4
   call $~lib/@massalabs/massa-as-sdk/assembly/std/storage/get<~lib/string/String>
   local.tee $0
   i32.store offset=36
   global.get $~lib/memory/__stack_pointer
   local.get $0
   i32.store
   global.get $~lib/memory/__stack_pointer
   i32.const 4752
   i32.store offset=16
   local.get $0
   i32.const 4752
   call $~lib/string/String.__eq
   if (result i64)
    global.get $~lib/memory/__stack_pointer
    local.get $3
    i32.store offset=16
    local.get $3
    call $assembly/contracts/main/userPrincipalConservativeKey
    local.set $4
    global.get $~lib/memory/__stack_pointer
    local.get $4
    i32.store
    local.get $4
    call $assembly/contracts/main/sGetU64
    local.set $1
    global.get $~lib/memory/__stack_pointer
    local.get $3
    i32.store offset=16
    local.get $3
    call $assembly/contracts/main/userTicketsConservativeKey
    local.set $3
    global.get $~lib/memory/__stack_pointer
    local.get $3
    i32.store
    local.get $3
    call $assembly/contracts/main/sGetU64
   else
    global.get $~lib/memory/__stack_pointer
    local.get $0
    i32.store
    global.get $~lib/memory/__stack_pointer
    i32.const 5056
    i32.store offset=16
    local.get $0
    i32.const 5056
    call $~lib/string/String.__eq
    if (result i64)
     global.get $~lib/memory/__stack_pointer
     local.get $3
     i32.store offset=16
     local.get $3
     call $assembly/contracts/main/userPrincipalModerateKey
     local.set $4
     global.get $~lib/memory/__stack_pointer
     local.get $4
     i32.store
     local.get $4
     call $assembly/contracts/main/sGetU64
     local.set $1
     global.get $~lib/memory/__stack_pointer
     local.get $3
     i32.store offset=16
     local.get $3
     call $assembly/contracts/main/userTicketsModerateKey
     local.set $3
     global.get $~lib/memory/__stack_pointer
     local.get $3
     i32.store
     local.get $3
     call $assembly/contracts/main/sGetU64
    else
     global.get $~lib/memory/__stack_pointer
     local.get $0
     i32.store
     global.get $~lib/memory/__stack_pointer
     i32.const 5376
     i32.store offset=16
     local.get $0
     i32.const 5376
     call $~lib/string/String.__eq
     if (result i64)
      global.get $~lib/memory/__stack_pointer
      local.get $3
      i32.store offset=16
      local.get $3
      call $assembly/contracts/main/userPrincipalAggressiveKey
      local.set $4
      global.get $~lib/memory/__stack_pointer
      local.get $4
      i32.store
      local.get $4
      call $assembly/contracts/main/sGetU64
      local.set $1
      global.get $~lib/memory/__stack_pointer
      local.get $3
      i32.store offset=16
      local.get $3
      call $assembly/contracts/main/userTicketsAggressiveKey
      local.set $3
      global.get $~lib/memory/__stack_pointer
      local.get $3
      i32.store
      local.get $3
      call $assembly/contracts/main/sGetU64
     else
      i64.const 0
     end
    end
   end
  else
   i64.const 0
  end
  local.set $2
  global.get $~lib/memory/__stack_pointer
  local.set $4
  global.get $~lib/memory/__stack_pointer
  local.get $2
  call $~lib/util/number/utoa64
  local.tee $5
  i32.store offset=40
  global.get $~lib/memory/__stack_pointer
  local.get $1
  call $~lib/util/number/utoa64
  local.tee $6
  i32.store offset=44
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store offset=48
  global.get $~lib/memory/__stack_pointer
  i32.const 8784
  i32.const 8816
  local.get $1
  i64.const 0
  i64.ne
  select
  local.tee $3
  i32.store offset=52
  global.get $~lib/memory/__stack_pointer
  i32.const 8720
  i32.store
  global.get $~lib/memory/__stack_pointer
  local.get $5
  i32.store offset=16
  i32.const 8720
  i32.const 1
  local.get $5
  call $~lib/staticarray/StaticArray<~lib/string/String>#__uset
  global.get $~lib/memory/__stack_pointer
  i32.const 8720
  i32.store
  global.get $~lib/memory/__stack_pointer
  local.get $6
  i32.store offset=16
  i32.const 8720
  i32.const 3
  local.get $6
  call $~lib/staticarray/StaticArray<~lib/string/String>#__uset
  global.get $~lib/memory/__stack_pointer
  i32.const 8720
  i32.store
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store offset=16
  i32.const 8720
  i32.const 5
  local.get $0
  call $~lib/staticarray/StaticArray<~lib/string/String>#__uset
  global.get $~lib/memory/__stack_pointer
  i32.const 8720
  i32.store
  global.get $~lib/memory/__stack_pointer
  local.get $3
  i32.store offset=16
  i32.const 8720
  i32.const 7
  local.get $3
  call $~lib/staticarray/StaticArray<~lib/string/String>#__uset
  global.get $~lib/memory/__stack_pointer
  i32.const 8720
  i32.store
  global.get $~lib/memory/__stack_pointer
  i32.const 2592
  i32.store offset=16
  local.get $4
  i32.const 8720
  call $~lib/staticarray/StaticArray<~lib/string/String>#join
  local.tee $0
  i32.store offset=56
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store
  local.get $0
  call $assembly/contracts/main/stringToBytes
  local.set $0
  global.get $~lib/memory/__stack_pointer
  i32.const 60
  i32.add
  global.set $~lib/memory/__stack_pointer
  local.get $0
 )
 (func $assembly/contracts/main/getWinners (param $0 i32) (result i32)
  (local $1 i64)
  (local $2 i64)
  (local $3 i32)
  (local $4 i32)
  (local $5 i64)
  (local $6 i32)
  (local $7 i32)
  (local $8 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 116
  i32.sub
  global.set $~lib/memory/__stack_pointer
  call $~stack_check
  global.get $~lib/memory/__stack_pointer
  i32.const 0
  i32.const 116
  memory.fill
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store
  global.get $~lib/memory/__stack_pointer
  local.get $0
  call $~lib/@massalabs/as-types/assembly/argument/Args#constructor
  local.tee $0
  i32.store offset=4
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store
  global.get $~lib/memory/__stack_pointer
  local.get $0
  call $~lib/@massalabs/as-types/assembly/argument/Args#nextU64
  local.tee $3
  i32.store offset=8
  global.get $~lib/memory/__stack_pointer
  local.get $3
  i32.store offset=12
  global.get $~lib/memory/__stack_pointer
  local.get $3
  i32.store offset=16
  global.get $~lib/memory/__stack_pointer
  local.get $3
  i32.load offset=8
  local.tee $4
  i32.store
  block $folding-inner1
   block $folding-inner0
    local.get $4
    call $~lib/string/String.__not
    i32.eqz
    if
     global.get $~lib/memory/__stack_pointer
     local.get $3
     i32.store
     global.get $~lib/memory/__stack_pointer
     local.get $3
     i32.load offset=8
     local.tee $0
     i32.store offset=20
     local.get $0
     i32.eqz
     br_if $folding-inner0
     br $folding-inner1
    end
    global.get $~lib/memory/__stack_pointer
    local.get $3
    i32.store offset=24
    global.get $~lib/memory/__stack_pointer
    local.get $3
    i32.store
    local.get $3
    i64.load
    local.set $1
    global.get $~lib/memory/__stack_pointer
    local.get $0
    i32.store
    global.get $~lib/memory/__stack_pointer
    local.get $0
    call $~lib/@massalabs/as-types/assembly/argument/Args#nextU64
    local.tee $0
    i32.store offset=28
    global.get $~lib/memory/__stack_pointer
    local.get $0
    i32.store offset=32
    global.get $~lib/memory/__stack_pointer
    local.get $0
    i32.store offset=16
    global.get $~lib/memory/__stack_pointer
    local.get $0
    i32.load offset=8
    local.tee $3
    i32.store
    local.get $3
    call $~lib/string/String.__not
    i32.eqz
    if
     global.get $~lib/memory/__stack_pointer
     local.get $0
     i32.store
     global.get $~lib/memory/__stack_pointer
     local.get $0
     i32.load offset=8
     local.tee $0
     i32.store offset=36
     local.get $0
     i32.eqz
     br_if $folding-inner0
     br $folding-inner1
    end
    global.get $~lib/memory/__stack_pointer
    local.get $0
    i32.store offset=40
    global.get $~lib/memory/__stack_pointer
    local.get $0
    i32.store
    local.get $0
    i64.load
    local.set $5
    global.get $~lib/memory/__stack_pointer
    i32.const 2128
    i32.store
    i32.const 2128
    call $assembly/contracts/main/sGetU64
    local.tee $2
    local.get $1
    local.get $5
    i64.add
    local.tee $5
    local.get $2
    local.get $5
    i64.lt_u
    select
    local.set $2
    global.get $~lib/memory/__stack_pointer
    i32.const 0
    i32.const 2
    i32.const 10
    i32.const 8848
    call $~lib/rt/__newArray
    local.tee $0
    i32.store offset=44
    loop $for-loop|0
     local.get $1
     local.get $2
     i64.lt_u
     if
      global.get $~lib/memory/__stack_pointer
      local.set $3
      local.get $1
      i32.wrap_i64
      call $assembly/contracts/main/winnerKey
      local.set $4
      global.get $~lib/memory/__stack_pointer
      local.get $4
      i32.store
      local.get $3
      local.get $4
      call $~lib/@massalabs/massa-as-sdk/assembly/std/storage/get<~lib/string/String>
      local.tee $3
      i32.store offset=48
      global.get $~lib/memory/__stack_pointer
      local.get $3
      i32.store
      local.get $3
      call $~lib/string/String#get:length
      i32.const 0
      i32.gt_s
      if
       global.get $~lib/memory/__stack_pointer
       local.get $3
       i32.store
       global.get $~lib/memory/__stack_pointer
       i32.const 4016
       i32.store offset=16
       i32.const 1
       global.set $~argumentsLength
       global.get $~lib/memory/__stack_pointer
       local.get $3
       i32.const 4016
       call $~lib/string/String#split@varargs
       local.tee $4
       i32.store offset=52
       global.get $~lib/memory/__stack_pointer
       local.get $4
       i32.store
       local.get $4
       call $~lib/array/Array<~lib/@massalabs/massa-as-sdk/assembly/std/address/Address>#get:length
       i32.const 4
       i32.ge_s
       if
        global.get $~lib/memory/__stack_pointer
        local.get $4
        i32.store
        global.get $~lib/memory/__stack_pointer
        local.get $4
        i32.const 0
        call $~lib/array/Array<~lib/@massalabs/massa-as-sdk/assembly/std/address/Address>#__get
        local.tee $3
        i32.store offset=56
        global.get $~lib/memory/__stack_pointer
        local.get $4
        i32.store
        global.get $~lib/memory/__stack_pointer
        local.get $4
        i32.const 1
        call $~lib/array/Array<~lib/@massalabs/massa-as-sdk/assembly/std/address/Address>#__get
        local.tee $6
        i32.store offset=60
        global.get $~lib/memory/__stack_pointer
        local.get $4
        i32.store
        global.get $~lib/memory/__stack_pointer
        local.get $4
        i32.const 2
        call $~lib/array/Array<~lib/@massalabs/massa-as-sdk/assembly/std/address/Address>#__get
        local.tee $7
        i32.store offset=64
        global.get $~lib/memory/__stack_pointer
        local.get $4
        i32.store
        global.get $~lib/memory/__stack_pointer
        local.get $4
        i32.const 3
        call $~lib/array/Array<~lib/@massalabs/massa-as-sdk/assembly/std/address/Address>#__get
        local.tee $4
        i32.store offset=68
        global.get $~lib/memory/__stack_pointer
        local.set $8
        global.get $~lib/memory/__stack_pointer
        local.get $3
        i32.store offset=72
        global.get $~lib/memory/__stack_pointer
        local.get $6
        i32.store offset=76
        global.get $~lib/memory/__stack_pointer
        local.get $7
        i32.store offset=80
        global.get $~lib/memory/__stack_pointer
        local.get $4
        i32.store offset=84
        global.get $~lib/memory/__stack_pointer
        local.get $3
        i32.store offset=88
        global.get $~lib/memory/__stack_pointer
        i32.const 9312
        i32.store
        global.get $~lib/memory/__stack_pointer
        local.get $3
        i32.store offset=16
        i32.const 9312
        i32.const 1
        local.get $3
        call $~lib/staticarray/StaticArray<~lib/string/String>#__uset
        global.get $~lib/memory/__stack_pointer
        i32.const 9312
        i32.store
        global.get $~lib/memory/__stack_pointer
        local.get $6
        i32.store offset=16
        i32.const 9312
        i32.const 3
        local.get $6
        call $~lib/staticarray/StaticArray<~lib/string/String>#__uset
        global.get $~lib/memory/__stack_pointer
        i32.const 9312
        i32.store
        global.get $~lib/memory/__stack_pointer
        local.get $7
        i32.store offset=16
        i32.const 9312
        i32.const 5
        local.get $7
        call $~lib/staticarray/StaticArray<~lib/string/String>#__uset
        global.get $~lib/memory/__stack_pointer
        i32.const 9312
        i32.store
        global.get $~lib/memory/__stack_pointer
        local.get $4
        i32.store offset=16
        i32.const 9312
        i32.const 7
        local.get $4
        call $~lib/staticarray/StaticArray<~lib/string/String>#__uset
        global.get $~lib/memory/__stack_pointer
        i32.const 9312
        i32.store
        global.get $~lib/memory/__stack_pointer
        local.get $3
        i32.store offset=16
        i32.const 9312
        i32.const 9
        local.get $3
        call $~lib/staticarray/StaticArray<~lib/string/String>#__uset
        global.get $~lib/memory/__stack_pointer
        i32.const 9312
        i32.store
        global.get $~lib/memory/__stack_pointer
        i32.const 2592
        i32.store offset=16
        local.get $8
        i32.const 9312
        call $~lib/staticarray/StaticArray<~lib/string/String>#join
        local.tee $3
        i32.store offset=92
        global.get $~lib/memory/__stack_pointer
        local.get $0
        i32.store
        global.get $~lib/memory/__stack_pointer
        local.get $3
        i32.store offset=16
        local.get $0
        local.get $3
        call $~lib/array/Array<~lib/string/String>#push
       end
      end
      local.get $1
      i64.const 1
      i64.add
      local.set $1
      br $for-loop|0
     end
    end
    global.get $~lib/memory/__stack_pointer
    local.set $3
    global.get $~lib/memory/__stack_pointer
    i32.const 9376
    i32.store offset=96
    global.get $~lib/memory/__stack_pointer
    local.get $0
    i32.store offset=104
    global.get $~lib/memory/__stack_pointer
    i32.const 2624
    i32.store offset=108
    global.get $~lib/memory/__stack_pointer
    i32.const 4
    i32.sub
    global.set $~lib/memory/__stack_pointer
    call $~stack_check
    global.get $~lib/memory/__stack_pointer
    i32.const 0
    i32.store
    global.get $~lib/memory/__stack_pointer
    local.get $0
    i32.store
    local.get $0
    i32.load offset=4
    local.set $4
    global.get $~lib/memory/__stack_pointer
    local.get $0
    i32.store
    local.get $0
    i32.load offset=12
    local.set $0
    global.get $~lib/memory/__stack_pointer
    i32.const 2624
    i32.store
    local.get $4
    local.get $0
    i32.const 2624
    call $~lib/util/string/joinReferenceArray<~lib/string/String>
    local.set $0
    global.get $~lib/memory/__stack_pointer
    i32.const 4
    i32.add
    global.set $~lib/memory/__stack_pointer
    global.get $~lib/memory/__stack_pointer
    local.get $0
    i32.store offset=100
    i32.const 9376
    local.get $0
    call $~lib/string/String.__concat
    local.set $0
    global.get $~lib/memory/__stack_pointer
    local.get $0
    i32.store
    global.get $~lib/memory/__stack_pointer
    i32.const 9408
    i32.store offset=16
    local.get $3
    local.get $0
    i32.const 9408
    call $~lib/string/String.__concat
    local.tee $0
    i32.store offset=112
    global.get $~lib/memory/__stack_pointer
    local.get $0
    i32.store
    local.get $0
    call $assembly/contracts/main/stringToBytes
    local.set $0
    global.get $~lib/memory/__stack_pointer
    i32.const 116
    i32.add
    global.set $~lib/memory/__stack_pointer
    local.get $0
    return
   end
   i32.const 3152
   i32.const 3280
   i32.const 70
   i32.const 21
   call $~lib/builtins/abort
   unreachable
  end
  local.get $0
  i32.const 3280
  i32.const 70
  i32.const 7
  call $~lib/builtins/abort
  unreachable
 )
 (func $~lib/staticarray/StaticArray<u8>#constructor (param $0 i32) (result i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 4
  i32.sub
  global.set $~lib/memory/__stack_pointer
  call $~stack_check
  global.get $~lib/memory/__stack_pointer
  i32.const 0
  i32.store
  local.get $0
  i32.const 1073741820
  i32.gt_u
  if
   i32.const 1456
   i32.const 1504
   i32.const 51
   i32.const 60
   call $~lib/builtins/abort
   unreachable
  end
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.const 5
  call $~lib/rt/itcms/__new
  local.tee $0
  i32.store
  global.get $~lib/memory/__stack_pointer
  i32.const 4
  i32.add
  global.set $~lib/memory/__stack_pointer
  local.get $0
 )
 (func $~lib/rt/__newArray (param $0 i32) (param $1 i32) (param $2 i32) (param $3 i32) (result i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 4
  i32.sub
  global.set $~lib/memory/__stack_pointer
  call $~stack_check
  global.get $~lib/memory/__stack_pointer
  i32.const 0
  i32.store
  global.get $~lib/memory/__stack_pointer
  local.get $0
  local.get $1
  i32.shl
  local.tee $1
  i32.const 1
  local.get $3
  call $~lib/rt/__newBuffer
  local.tee $3
  i32.store
  i32.const 16
  local.get $2
  call $~lib/rt/itcms/__new
  local.tee $2
  local.get $3
  i32.store
  local.get $2
  local.get $3
  i32.const 0
  call $~lib/rt/itcms/__link
  local.get $2
  local.get $3
  i32.store offset=4
  local.get $2
  local.get $1
  i32.store offset=8
  local.get $2
  local.get $0
  i32.store offset=12
  global.get $~lib/memory/__stack_pointer
  i32.const 4
  i32.add
  global.set $~lib/memory/__stack_pointer
  local.get $2
 )
 (func $~lib/util/number/utoa64 (param $0 i64) (result i32)
  (local $1 i32)
  (local $2 i32)
  (local $3 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 4
  i32.sub
  global.set $~lib/memory/__stack_pointer
  call $~stack_check
  global.get $~lib/memory/__stack_pointer
  i32.const 0
  i32.store
  local.get $0
  i64.eqz
  if
   global.get $~lib/memory/__stack_pointer
   i32.const 4
   i32.add
   global.set $~lib/memory/__stack_pointer
   i32.const 3616
   return
  end
  local.get $0
  i64.const 4294967295
  i64.le_u
  if
   local.get $0
   i32.wrap_i64
   local.tee $1
   call $~lib/util/number/decimalCount32
   local.set $3
   global.get $~lib/memory/__stack_pointer
   local.get $3
   i32.const 1
   i32.shl
   i32.const 2
   call $~lib/rt/itcms/__new
   local.tee $2
   i32.store
   local.get $2
   local.get $1
   local.get $3
   call $~lib/util/number/utoa_dec_simple<u32>
  else
   global.get $~lib/memory/__stack_pointer
   local.get $0
   i64.const 100000000000
   i64.ge_u
   i32.const 10
   i32.add
   local.get $0
   i64.const 10000000000
   i64.ge_u
   i32.add
   local.get $0
   i64.const 100000000000000
   i64.ge_u
   i32.const 13
   i32.add
   local.get $0
   i64.const 10000000000000
   i64.ge_u
   i32.add
   local.get $0
   i64.const 1000000000000
   i64.lt_u
   select
   local.get $0
   i64.const 10000000000000000
   i64.ge_u
   i32.const 16
   i32.add
   local.get $0
   i64.const -8446744073709551616
   i64.ge_u
   i32.const 18
   i32.add
   local.get $0
   i64.const 1000000000000000000
   i64.ge_u
   i32.add
   local.get $0
   i64.const 100000000000000000
   i64.lt_u
   select
   local.get $0
   i64.const 1000000000000000
   i64.lt_u
   select
   local.tee $1
   i32.const 1
   i32.shl
   i32.const 2
   call $~lib/rt/itcms/__new
   local.tee $2
   i32.store
   loop $do-loop|0
    local.get $2
    local.get $1
    i32.const 1
    i32.sub
    local.tee $1
    i32.const 1
    i32.shl
    i32.add
    local.get $0
    i64.const 10
    i64.rem_u
    i32.wrap_i64
    i32.const 48
    i32.add
    i32.store16
    local.get $0
    i64.const 10
    i64.div_u
    local.tee $0
    i64.const 0
    i64.ne
    br_if $do-loop|0
   end
  end
  global.get $~lib/memory/__stack_pointer
  i32.const 4
  i32.add
  global.set $~lib/memory/__stack_pointer
  local.get $2
 )
 (func $~lib/string/String.UTF8.decodeUnsafe (param $0 i32) (param $1 i32) (result i32)
  (local $2 i32)
  (local $3 i32)
  (local $4 i32)
  (local $5 i32)
  (local $6 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 4
  i32.sub
  global.set $~lib/memory/__stack_pointer
  call $~stack_check
  global.get $~lib/memory/__stack_pointer
  i32.const 0
  i32.store
  local.get $0
  local.get $1
  i32.add
  local.tee $4
  local.get $0
  i32.lt_u
  if
   i32.const 0
   i32.const 3840
   i32.const 770
   i32.const 7
   call $~lib/builtins/abort
   unreachable
  end
  global.get $~lib/memory/__stack_pointer
  local.get $1
  i32.const 1
  i32.shl
  i32.const 2
  call $~lib/rt/itcms/__new
  local.tee $2
  i32.store
  local.get $2
  local.set $1
  loop $while-continue|0
   local.get $0
   local.get $4
   i32.lt_u
   if
    block $while-break|0
     local.get $0
     i32.load8_u
     local.set $5
     local.get $0
     i32.const 1
     i32.add
     local.set $0
     local.get $5
     i32.const 128
     i32.and
     if
      local.get $0
      local.get $4
      i32.eq
      br_if $while-break|0
      local.get $0
      i32.load8_u
      i32.const 63
      i32.and
      local.set $6
      local.get $0
      i32.const 1
      i32.add
      local.set $0
      local.get $5
      i32.const 224
      i32.and
      i32.const 192
      i32.eq
      if
       local.get $1
       local.get $5
       i32.const 31
       i32.and
       i32.const 6
       i32.shl
       local.get $6
       i32.or
       i32.store16
      else
       local.get $0
       local.get $4
       i32.eq
       br_if $while-break|0
       local.get $0
       i32.load8_u
       i32.const 63
       i32.and
       local.set $3
       local.get $0
       i32.const 1
       i32.add
       local.set $0
       local.get $5
       i32.const 240
       i32.and
       i32.const 224
       i32.eq
       if
        local.get $5
        i32.const 15
        i32.and
        i32.const 12
        i32.shl
        local.get $6
        i32.const 6
        i32.shl
        i32.or
        local.get $3
        i32.or
        local.set $3
       else
        local.get $0
        local.get $4
        i32.eq
        br_if $while-break|0
        local.get $0
        i32.load8_u
        i32.const 63
        i32.and
        local.get $5
        i32.const 7
        i32.and
        i32.const 18
        i32.shl
        local.get $6
        i32.const 12
        i32.shl
        i32.or
        local.get $3
        i32.const 6
        i32.shl
        i32.or
        i32.or
        local.set $3
        local.get $0
        i32.const 1
        i32.add
        local.set $0
       end
       local.get $3
       i32.const 65536
       i32.lt_u
       if
        local.get $1
        local.get $3
        i32.store16
       else
        local.get $1
        local.get $3
        i32.const 65536
        i32.sub
        local.tee $3
        i32.const 10
        i32.shr_u
        i32.const 55296
        i32.or
        local.get $3
        i32.const 1023
        i32.and
        i32.const 56320
        i32.or
        i32.const 16
        i32.shl
        i32.or
        i32.store
        local.get $1
        i32.const 2
        i32.add
        local.set $1
       end
      end
     else
      local.get $1
      local.get $5
      i32.store16
     end
     local.get $1
     i32.const 2
     i32.add
     local.set $1
     br $while-continue|0
    end
   end
  end
  local.get $2
  local.get $1
  local.get $2
  i32.sub
  call $~lib/rt/itcms/__renew
  local.set $0
  global.get $~lib/memory/__stack_pointer
  i32.const 4
  i32.add
  global.set $~lib/memory/__stack_pointer
  local.get $0
 )
 (func $export:assembly/contracts/main/constructor (param $0 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 4
  i32.sub
  global.set $~lib/memory/__stack_pointer
  call $~stack_check
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store
  local.get $0
  call $assembly/contracts/main/constructor
  global.get $~lib/memory/__stack_pointer
  i32.const 4
  i32.add
  global.set $~lib/memory/__stack_pointer
 )
 (func $export:assembly/contracts/main/withdraw (param $0 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 4
  i32.sub
  global.set $~lib/memory/__stack_pointer
  call $~stack_check
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store
  local.get $0
  call $assembly/contracts/main/withdraw
  global.get $~lib/memory/__stack_pointer
  i32.const 4
  i32.add
  global.set $~lib/memory/__stack_pointer
 )
 (func $export:assembly/contracts/main/getUserPrincipal (param $0 i32) (result i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 4
  i32.sub
  global.set $~lib/memory/__stack_pointer
  call $~stack_check
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store
  local.get $0
  call $assembly/contracts/main/getUserPrincipal
  local.set $0
  global.get $~lib/memory/__stack_pointer
  i32.const 4
  i32.add
  global.set $~lib/memory/__stack_pointer
  local.get $0
 )
 (func $export:assembly/contracts/main/getUserTickets (param $0 i32) (result i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 4
  i32.sub
  global.set $~lib/memory/__stack_pointer
  call $~stack_check
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store
  local.get $0
  call $assembly/contracts/main/getUserTickets
  local.set $0
  global.get $~lib/memory/__stack_pointer
  i32.const 4
  i32.add
  global.set $~lib/memory/__stack_pointer
  local.get $0
 )
 (func $export:assembly/contracts/main/getUserTier (param $0 i32) (result i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 4
  i32.sub
  global.set $~lib/memory/__stack_pointer
  call $~stack_check
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store
  local.get $0
  call $assembly/contracts/main/getUserTier
  local.set $0
  global.get $~lib/memory/__stack_pointer
  i32.const 4
  i32.add
  global.set $~lib/memory/__stack_pointer
  local.get $0
 )
 (func $export:assembly/contracts/main/getWinner (param $0 i32) (result i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 4
  i32.sub
  global.set $~lib/memory/__stack_pointer
  call $~stack_check
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store
  local.get $0
  call $assembly/contracts/main/getWinner
  local.set $0
  global.get $~lib/memory/__stack_pointer
  i32.const 4
  i32.add
  global.set $~lib/memory/__stack_pointer
  local.get $0
 )
 (func $export:assembly/contracts/main/getUserPosition (param $0 i32) (result i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 4
  i32.sub
  global.set $~lib/memory/__stack_pointer
  call $~stack_check
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store
  local.get $0
  call $assembly/contracts/main/getUserPosition
  local.set $0
  global.get $~lib/memory/__stack_pointer
  i32.const 4
  i32.add
  global.set $~lib/memory/__stack_pointer
  local.get $0
 )
 (func $export:assembly/contracts/main/getWinners (param $0 i32) (result i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 4
  i32.sub
  global.set $~lib/memory/__stack_pointer
  call $~stack_check
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store
  local.get $0
  call $assembly/contracts/main/getWinners
  local.set $0
  global.get $~lib/memory/__stack_pointer
  i32.const 4
  i32.add
  global.set $~lib/memory/__stack_pointer
  local.get $0
 )
 (func $byn$mgfn-shared$assembly/contracts/main/getConservativeTVL (param $0 i32) (result i32)
  (local $1 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 12
  i32.sub
  global.set $~lib/memory/__stack_pointer
  call $~stack_check
  global.get $~lib/memory/__stack_pointer
  i64.const 0
  i64.store
  global.get $~lib/memory/__stack_pointer
  i32.const 0
  i32.store offset=8
  i32.const 0
  global.set $~argumentsLength
  call $~lib/@massalabs/as-types/assembly/argument/Args#constructor@varargs
  local.set $1
  global.get $~lib/memory/__stack_pointer
  local.get $1
  i32.store offset=4
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store offset=8
  local.get $1
  local.get $0
  call $assembly/contracts/main/sGetU64
  call $"~lib/@massalabs/as-types/assembly/argument/Args#add<u64,void>"
  local.set $0
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store
  local.get $0
  call $~lib/@massalabs/as-types/assembly/argument/Args#serialize
  local.set $0
  global.get $~lib/memory/__stack_pointer
  i32.const 12
  i32.add
  global.set $~lib/memory/__stack_pointer
  local.get $0
 )
 (func $byn$mgfn-shared$assembly/contracts/main/getTVL (param $0 i32) (param $1 i32) (param $2 i32) (result i32)
  (local $3 i64)
  global.get $~lib/memory/__stack_pointer
  i32.const 8
  i32.sub
  global.set $~lib/memory/__stack_pointer
  call $~stack_check
  global.get $~lib/memory/__stack_pointer
  i64.const 0
  i64.store
  global.get $~lib/memory/__stack_pointer
  local.get $2
  i32.store
  local.get $2
  call $assembly/contracts/main/sGetU64
  local.set $3
  global.get $~lib/memory/__stack_pointer
  local.get $1
  i32.store
  local.get $1
  call $assembly/contracts/main/sGetU64
  local.get $3
  i64.add
  local.set $3
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store
  local.get $0
  call $assembly/contracts/main/sGetU64
  local.get $3
  i64.add
  local.set $3
  i32.const 0
  global.set $~argumentsLength
  call $~lib/@massalabs/as-types/assembly/argument/Args#constructor@varargs
  local.set $0
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store offset=4
  local.get $0
  local.get $3
  call $"~lib/@massalabs/as-types/assembly/argument/Args#add<u64,void>"
  local.set $0
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store
  local.get $0
  call $~lib/@massalabs/as-types/assembly/argument/Args#serialize
  local.set $0
  global.get $~lib/memory/__stack_pointer
  i32.const 8
  i32.add
  global.set $~lib/memory/__stack_pointer
  local.get $0
 )
 (func $byn$mgfn-shared$assembly/contracts/main/participantKey (param $0 i32) (param $1 i32) (result i32)
  (local $2 i32)
  (local $3 i32)
  (local $4 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 8
  i32.sub
  global.set $~lib/memory/__stack_pointer
  call $~stack_check
  global.get $~lib/memory/__stack_pointer
  i64.const 0
  i64.store
  global.get $~lib/memory/__stack_pointer
  local.get $1
  i32.store
  global.get $~lib/memory/__stack_pointer
  i32.const 4
  i32.sub
  global.set $~lib/memory/__stack_pointer
  call $~stack_check
  global.get $~lib/memory/__stack_pointer
  i32.const 0
  i32.store
  block $folding-inner0
   local.get $0
   i32.eqz
   if
    i32.const 3616
    local.set $0
    br $folding-inner0
   end
   i32.const 0
   local.get $0
   i32.sub
   local.get $0
   local.get $0
   i32.const 31
   i32.shr_u
   i32.const 1
   i32.shl
   local.tee $2
   select
   local.tee $4
   call $~lib/util/number/decimalCount32
   local.set $3
   global.get $~lib/memory/__stack_pointer
   local.get $3
   i32.const 1
   i32.shl
   local.get $2
   i32.add
   i32.const 2
   call $~lib/rt/itcms/__new
   local.tee $0
   i32.store
   local.get $0
   local.get $2
   i32.add
   local.get $4
   local.get $3
   call $~lib/util/number/utoa_dec_simple<u32>
   local.get $2
   if
    local.get $0
    i32.const 45
    i32.store16
   end
  end
  global.get $~lib/memory/__stack_pointer
  i32.const 4
  i32.add
  global.set $~lib/memory/__stack_pointer
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store offset=4
  local.get $1
  local.get $0
  call $~lib/string/String.__concat
  local.set $0
  global.get $~lib/memory/__stack_pointer
  i32.const 8
  i32.add
  global.set $~lib/memory/__stack_pointer
  local.get $0
 )
 (func $byn$mgfn-shared$assembly/contracts/main/seedScheduler (param $0 i32) (param $1 i32) (param $2 i32) (param $3 i32)
  (local $4 i64)
  (local $5 i64)
  global.get $~lib/memory/__stack_pointer
  i32.const 12
  i32.sub
  global.set $~lib/memory/__stack_pointer
  call $~stack_check
  global.get $~lib/memory/__stack_pointer
  i64.const 0
  i64.store
  global.get $~lib/memory/__stack_pointer
  i32.const 0
  i32.store offset=8
  call $~lib/@massalabs/massa-as-sdk/assembly/env/env/env.callCoins
  local.tee $4
  i64.eqz
  if
   local.get $3
   i32.const 2864
   local.get $2
   i32.const 3
   call $~lib/builtins/abort
   unreachable
  end
  global.get $~lib/memory/__stack_pointer
  local.get $1
  i32.store
  local.get $1
  call $assembly/contracts/main/sGetU64
  local.set $5
  global.get $~lib/memory/__stack_pointer
  local.get $1
  i32.store
  local.get $1
  local.get $4
  local.get $5
  i64.add
  call $assembly/contracts/main/sSetU64
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store offset=4
  local.get $4
  call $~lib/util/number/utoa64
  local.set $1
  global.get $~lib/memory/__stack_pointer
  local.get $1
  i32.store offset=8
  local.get $0
  local.get $1
  call $~lib/string/String#concat
  local.set $0
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store
  local.get $0
  call $~lib/@massalabs/massa-as-sdk/assembly/std/utils/events/generateEvent
  global.get $~lib/memory/__stack_pointer
  i32.const 12
  i32.add
  global.set $~lib/memory/__stack_pointer
 )
 (func $byn$mgfn-shared$assembly/contracts/main/userPrincipalConservativeKey (param $0 i32) (param $1 i32) (result i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 8
  i32.sub
  global.set $~lib/memory/__stack_pointer
  call $~stack_check
  global.get $~lib/memory/__stack_pointer
  i64.const 0
  i64.store
  global.get $~lib/memory/__stack_pointer
  local.get $1
  i32.store
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store offset=4
  local.get $1
  local.get $0
  call $~lib/string/String.__concat
  local.set $0
  global.get $~lib/memory/__stack_pointer
  i32.const 8
  i32.add
  global.set $~lib/memory/__stack_pointer
  local.get $0
 )
)
