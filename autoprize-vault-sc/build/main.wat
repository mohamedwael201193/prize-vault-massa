(module
 (type $0 (func (param i32) (result i32)))
 (type $1 (func (param i32)))
 (type $2 (func (param i32 i32) (result i32)))
 (type $3 (func (param i32 i32)))
 (type $4 (func))
 (type $5 (func (result i32)))
 (type $6 (func (param i32 i32 i32) (result i32)))
 (type $7 (func (param i32 i32 i32)))
 (type $8 (func (param i32 i64)))
 (type $9 (func (param i32 i32 i32 i32)))
 (type $10 (func (result i64)))
 (type $11 (func (param i32) (result f64)))
 (type $12 (func (param i32 i32 i64)))
 (type $13 (func (param i32 i32 i32 i32) (result i32)))
 (type $14 (func (param i64 i32 i64 i64) (result i64)))
 (type $15 (func (param i32 i32 i64 i32 i64 i32 i64) (result i32)))
 (type $16 (func (param i64 i32) (result i32)))
 (type $17 (func (param i64)))
 (type $18 (func (param i32) (result i64)))
 (type $19 (func (param i64) (result i32)))
 (import "env" "abort" (func $~lib/builtins/abort (param i32 i32 i32 i32)))
 (import "massa" "assembly_script_caller_has_write_access" (func $~lib/@massalabs/massa-as-sdk/assembly/env/env/env.callerHasWriteAccess (result i32)))
 (import "massa" "assembly_script_get_call_stack" (func $~lib/@massalabs/massa-as-sdk/assembly/env/env/env.callStack (result i32)))
 (import "massa" "assembly_script_set_data" (func $~lib/@massalabs/massa-as-sdk/assembly/env/env/env.set (param i32 i32)))
 (import "massa" "assembly_script_get_current_period" (func $~lib/@massalabs/massa-as-sdk/assembly/env/env/env.currentPeriod (result i64)))
 (import "massa" "assembly_script_get_current_thread" (func $~lib/@massalabs/massa-as-sdk/assembly/env/env/env.currentThread (result i32)))
 (import "massa" "assembly_script_get_deferred_call_quote" (func $~lib/@massalabs/massa-as-sdk/assembly/env/env/env.deferredCallQuote (param i64 i32 i64 i64) (result i64)))
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
 (global $~lib/rt/__rtti_base i32 (i32.const 10688))
 (global $~lib/memory/__stack_pointer (mut i32) (i32.const 43544))
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
 (data $13.1 (i32.const 1736) "\02\00\00\00\18\00\00\00t\00o\00t\00a\00l\00_\00s\00h\00a\00r\00e\00s")
 (data $14 (i32.const 1772) "<")
 (data $14.1 (i32.const 1784) "\02\00\00\00\1e\00\00\00t\00o\00t\00a\00l\00_\00p\00r\00i\00n\00c\00i\00p\00a\00l")
 (data $15 (i32.const 1836) ",")
 (data $15.1 (i32.const 1848) "\02\00\00\00\14\00\00\00p\00r\00i\00z\00e\00_\00p\00o\00o\00l")
 (data $16 (i32.const 1884) "<")
 (data $16.1 (i32.const 1896) "\02\00\00\00 \00\00\00n\00e\00x\00t\00_\00d\00r\00a\00w\00_\00p\00e\00r\00i\00o\00d")
 (data $17 (i32.const 1948) ",")
 (data $17.1 (i32.const 1960) "\02\00\00\00\18\00\00\00d\00r\00a\00w\00_\00p\00e\00r\00i\00o\00d\00s")
 (data $18 (i32.const 1996) ",")
 (data $18.1 (i32.const 2008) "\02\00\00\00\18\00\00\00t\00i\00c\00k\00_\00p\00e\00r\00i\00o\00d\00s")
 (data $19 (i32.const 2044) "<")
 (data $19.1 (i32.const 2056) "\02\00\00\00\"\00\00\00p\00a\00r\00t\00i\00c\00i\00p\00a\00n\00t\00_\00c\00o\00u\00n\00t")
 (data $20 (i32.const 2108) ",")
 (data $20.1 (i32.const 2120) "\02\00\00\00\1c\00\00\00s\00c\00h\00e\00d\00u\00l\00e\00r\00_\00s\00e\00e\00d")
 (data $21 (i32.const 2156) "<")
 (data $21.1 (i32.const 2168) "\02\00\00\00&\00\00\00m\00i\00n\00_\00p\00r\00i\00z\00e\00_\00t\00h\00r\00e\00s\00h\00o\00l\00d")
 (data $22 (i32.const 2220) ",")
 (data $22.1 (i32.const 2232) "\02\00\00\00\18\00\00\00w\00i\00n\00n\00e\00r\00_\00c\00o\00u\00n\00t")
 (data $23 (i32.const 2268) "<")
 (data $23.1 (i32.const 2280) "\02\00\00\00 \00\00\00l\00a\00s\00t\00_\00d\00r\00a\00w\00_\00p\00e\00r\00i\00o\00d")
 (data $24 (i32.const 2332) "<")
 (data $24.1 (i32.const 2344) "\02\00\00\00 \00\00\00c\00o\00n\00t\00r\00a\00c\00t\00_\00v\00e\00r\00s\00i\00o\00n")
 (data $25 (i32.const 2396) ",")
 (data $25.1 (i32.const 2408) "\02\00\00\00\1c\00\00\00p\00r\00o\00p\00o\00s\00a\00l\00_\00c\00o\00u\00n\00t")
 (data $26 (i32.const 2444) "<")
 (data $26.1 (i32.const 2456) "\02\00\00\00 \00\00\00g\00o\00v\00e\00r\00n\00a\00n\00c\00e\00_\00d\00e\00l\00a\00y")
 (data $27 (i32.const 2508) "\1c")
 (data $27.1 (i32.const 2520) "\02")
 (data $28 (i32.const 2540) "\1c")
 (data $28.1 (i32.const 2552) "\02\00\00\00\02\00\00\00,")
 (data $29 (i32.const 2572) ",")
 (data $29.1 (i32.const 2584) "\02\00\00\00\1a\00\00\00~\00l\00i\00b\00/\00a\00r\00r\00a\00y\00.\00t\00s")
 (data $30 (i32.const 2620) "\1c")
 (data $30.1 (i32.const 2632) "\0c\00\00\00\08\00\00\00\01")
 (data $31 (i32.const 2652) "|")
 (data $31.1 (i32.const 2664) "\02\00\00\00^\00\00\00E\00l\00e\00m\00e\00n\00t\00 \00t\00y\00p\00e\00 \00m\00u\00s\00t\00 \00b\00e\00 \00n\00u\00l\00l\00a\00b\00l\00e\00 \00i\00f\00 \00a\00r\00r\00a\00y\00 \00i\00s\00 \00h\00o\00l\00e\00y")
 (data $32 (i32.const 2780) "L")
 (data $32.1 (i32.const 2792) "\02\00\00\004\00\00\00a\00s\00s\00e\00m\00b\00l\00y\00/\00c\00o\00n\00t\00r\00a\00c\00t\00s\00/\00m\00a\00i\00n\00.\00t\00s")
 (data $33 (i32.const 2860) "\8c")
 (data $33.1 (i32.const 2872) "\02\00\00\00n\00\00\00c\00a\00n\00\'\00t\00 \00d\00e\00s\00e\00r\00i\00a\00l\00i\00z\00e\00 \00u\006\004\00 \00f\00r\00o\00m\00 \00g\00i\00v\00e\00n\00 \00a\00r\00g\00u\00m\00e\00n\00t\00:\00 \00o\00u\00t\00 \00o\00f\00 \00r\00a\00n\00g\00e")
 (data $34 (i32.const 3004) "\1c")
 (data $34.1 (i32.const 3016) "\02\00\00\00\04\00\00\00:\00 ")
 (data $35 (i32.const 3036) "\1c\00\00\00\03\00\00\00\00\00\00\00\0f\00\00\00\0c\00\00\00\00\00\00\00\d0\0b")
 (data $36 (i32.const 3068) "|")
 (data $36.1 (i32.const 3080) "\02\00\00\00^\00\00\00U\00n\00e\00x\00p\00e\00c\00t\00e\00d\00 \00\'\00n\00u\00l\00l\00\'\00 \00(\00n\00o\00t\00 \00a\00s\00s\00i\00g\00n\00e\00d\00 \00o\00r\00 \00f\00a\00i\00l\00e\00d\00 \00c\00a\00s\00t\00)")
 (data $37 (i32.const 3196) "l")
 (data $37.1 (i32.const 3208) "\02\00\00\00V\00\00\00~\00l\00i\00b\00/\00@\00m\00a\00s\00s\00a\00l\00a\00b\00s\00/\00a\00s\00-\00t\00y\00p\00e\00s\00/\00a\00s\00s\00e\00m\00b\00l\00y\00/\00r\00e\00s\00u\00l\00t\00.\00t\00s")
 (data $38 (i32.const 3308) "\1c\00\00\00\03\00\00\00\00\00\00\00\0f\00\00\00\0c\00\00\00\00\00\00\00\d0\0b")
 (data $39 (i32.const 3340) "|")
 (data $39.1 (i32.const 3352) "\02\00\00\00d\00\00\00t\00o\00S\00t\00r\00i\00n\00g\00(\00)\00 \00r\00a\00d\00i\00x\00 \00a\00r\00g\00u\00m\00e\00n\00t\00 \00m\00u\00s\00t\00 \00b\00e\00 \00b\00e\00t\00w\00e\00e\00n\00 \002\00 \00a\00n\00d\00 \003\006")
 (data $40 (i32.const 3468) "<")
 (data $40.1 (i32.const 3480) "\02\00\00\00&\00\00\00~\00l\00i\00b\00/\00u\00t\00i\00l\00/\00n\00u\00m\00b\00e\00r\00.\00t\00s")
 (data $41 (i32.const 3532) "\1c")
 (data $41.1 (i32.const 3544) "\02\00\00\00\02\00\00\000")
 (data $42 (i32.const 3564) "\\")
 (data $42.1 (i32.const 3576) "\02\00\00\00H\00\00\000\001\002\003\004\005\006\007\008\009\00a\00b\00c\00d\00e\00f\00g\00h\00i\00j\00k\00l\00m\00n\00o\00p\00q\00r\00s\00t\00u\00v\00w\00x\00y\00z")
 (data $43 (i32.const 3660) "\1c")
 (data $43.1 (i32.const 3672) "\05")
 (data $44 (i32.const 3692) "<")
 (data $44.1 (i32.const 3704) "\02\00\00\00$\00\00\00U\00n\00p\00a\00i\00r\00e\00d\00 \00s\00u\00r\00r\00o\00g\00a\00t\00e")
 (data $45 (i32.const 3756) ",")
 (data $45.1 (i32.const 3768) "\02\00\00\00\1c\00\00\00~\00l\00i\00b\00/\00s\00t\00r\00i\00n\00g\00.\00t\00s")
 (data $46 (i32.const 3804) "\1c")
 (data $46.1 (i32.const 3816) "\02\00\00\00\n\00\00\001\00.\000\00.\000")
 (data $47 (i32.const 3836) "\1c")
 (data $47.1 (i32.const 3848) "\02\00\00\00\08\00\00\00t\00i\00c\00k")
 (data $48 (i32.const 3868) "\1c")
 (data $48.1 (i32.const 3880) "\05")
 (data $49 (i32.const 3900) "<")
 (data $49.1 (i32.const 3912) "\02\00\00\00\1e\00\00\00t\00i\00c\00k\00_\00s\00c\00h\00e\00d\00u\00l\00e\00d\00:")
 (data $50 (i32.const 3964) "\1c")
 (data $50.1 (i32.const 3976) "\02\00\00\00\02\00\00\00:")
 (data $51 (i32.const 3996) ",\00\00\00\03\00\00\00\00\00\00\00\0f\00\00\00\10\00\00\00P\0f\00\00\00\00\00\00\90\0f")
 (data $52 (i32.const 4044) "<")
 (data $52.1 (i32.const 4056) "\02\00\00\00$\00\00\00i\00n\00i\00t\00:\00 \00d\00r\00a\00w\00P\00e\00r\00i\00o\00d\00s\00=")
 (data $53 (i32.const 4108) ",")
 (data $53.1 (i32.const 4120) "\02\00\00\00\1a\00\00\00 \00t\00i\00c\00k\00P\00e\00r\00i\00o\00d\00s\00=")
 (data $54 (i32.const 4156) ",\00\00\00\03\00\00\00\00\00\00\00\0f\00\00\00\10\00\00\00\e0\0f\00\00\00\00\00\00 \10")
 (data $55 (i32.const 4204) "\1c")
 (data $55.1 (i32.const 4216) "\02\00\00\00\08\00\00\00z\00e\00r\00o")
 (data $56 (i32.const 4236) ",")
 (data $56.1 (i32.const 4248) "\02\00\00\00\1c\00\00\00s\00e\00e\00d\00S\00c\00h\00e\00d\00u\00l\00e\00r\00:")
 (data $57 (i32.const 4284) "<")
 (data $57.1 (i32.const 4296) "\02\00\00\00\1e\00\00\00d\00e\00p\00o\00s\00i\00t\00_\00d\00r\00y\00_\00r\00u\00n")
 (data $58 (i32.const 4348) ",")
 (data $58.1 (i32.const 4360) "\02\00\00\00\18\00\00\00u\00s\00e\00r\00_\00s\00h\00a\00r\00e\00s\00:")
 (data $59 (i32.const 4396) "<")
 (data $59.1 (i32.const 4408) "\02\00\00\00\1e\00\00\00u\00s\00e\00r\00_\00p\00r\00i\00n\00c\00i\00p\00a\00l\00:")
 (data $60 (i32.const 4460) "\1c")
 (data $60.1 (i32.const 4472) "\02\00\00\00\n\00\00\00a\00d\00d\00r\00_")
 (data $61 (i32.const 4492) ",")
 (data $61.1 (i32.const 4504) "\02\00\00\00\10\00\00\00d\00e\00p\00o\00s\00i\00t\00:")
 (data $62 (i32.const 4540) ",\00\00\00\03\00\00\00\00\00\00\00\0f\00\00\00\10\00\00\00\a0\11\00\00\00\00\00\00\90\0f")
 (data $63 (i32.const 4588) "\1c")
 (data $63.1 (i32.const 4600) "\02\00\00\00\0c\00\00\00a\00m\00o\00u\00n\00t")
 (data $64 (i32.const 4620) "\1c\00\00\00\03\00\00\00\00\00\00\00\0f\00\00\00\0c\00\00\00\00\00\00\00\d0\0b")
 (data $65 (i32.const 4652) ",")
 (data $65.1 (i32.const 4664) "\02\00\00\00\14\00\00\00b\00a\00d\00_\00a\00m\00o\00u\00n\00t")
 (data $66 (i32.const 4700) "<")
 (data $66.1 (i32.const 4712) "\02\00\00\00,\00\00\00i\00n\00s\00u\00f\00f\00i\00c\00i\00e\00n\00t\00_\00p\00r\00i\00n\00c\00i\00p\00a\00l")
 (data $67 (i32.const 4764) ",")
 (data $67.1 (i32.const 4776) "\02\00\00\00\12\00\00\00w\00i\00t\00h\00d\00r\00a\00w\00:")
 (data $68 (i32.const 4812) ",\00\00\00\03\00\00\00\00\00\00\00\0f\00\00\00\10\00\00\00\b0\12\00\00\00\00\00\00\90\0f")
 (data $69 (i32.const 4860) "\\")
 (data $69.1 (i32.const 4872) "\02\00\00\00@\00\00\00d\00r\00a\00w\00_\00s\00k\00i\00p\00p\00e\00d\00:\00i\00n\00s\00u\00f\00f\00i\00c\00i\00e\00n\00t\00_\00p\00r\00i\00z\00e\00:")
 (data $70 (i32.const 4956) ",\00\00\00\03\00\00\00\00\00\00\00\0f\00\00\00\10\00\00\00\10\13\00\00\00\00\00\00\90\0f")
 (data $71 (i32.const 5004) "L")
 (data $71.1 (i32.const 5016) "\02\00\00\00:\00\00\00d\00r\00a\00w\00_\00s\00k\00i\00p\00p\00e\00d\00:\00n\00o\00_\00p\00a\00r\00t\00i\00c\00i\00p\00a\00n\00t\00s\00:")
 (data $72 (i32.const 5084) ",\00\00\00\03\00\00\00\00\00\00\00\0f\00\00\00\10\00\00\00\a0\13\00\00\00\00\00\00\90\0f")
 (data $73 (i32.const 5132) ",")
 (data $73.1 (i32.const 5144) "\02\00\00\00\1a\00\00\00d\00r\00a\00w\00_\00e\00n\00t\00r\00o\00p\00y\00:")
 (data $74 (i32.const 5180) "<\00\00\00\03\00\00\00\00\00\00\00\0f\00\00\00 \00\00\00 \14\00\00\00\00\00\00\90\0f\00\00\00\00\00\00\90\0f\00\00\00\00\00\00\90\0f")
 (data $75 (i32.const 5244) "\\")
 (data $75.1 (i32.const 5256) "\02\00\00\00>\00\00\00d\00r\00a\00w\00_\00f\00a\00i\00l\00e\00d\00:\00n\00o\00_\00w\00i\00n\00n\00e\00r\00_\00s\00e\00l\00e\00c\00t\00e\00d\00:")
 (data $76 (i32.const 5340) ",\00\00\00\03\00\00\00\00\00\00\00\0f\00\00\00\1c\00\00\00\00\00\00\00\90\0f\00\00\00\00\00\00\90\0f\00\00\00\00\00\00\90\0f")
 (data $77 (i32.const 5388) ",")
 (data $77.1 (i32.const 5400) "\02\00\00\00\0e\00\00\00w\00i\00n\00n\00e\00r\00_")
 (data $78 (i32.const 5436) "\1c")
 (data $78.1 (i32.const 5448) "\02\00\00\00\n\00\00\00d\00r\00a\00w\00:")
 (data $79 (i32.const 5468) "<\00\00\00\03\00\00\00\00\00\00\00\0f\00\00\00 \00\00\00P\15\00\00\00\00\00\00\90\0f\00\00\00\00\00\00\90\0f\00\00\00\00\00\00\90\0f")
 (data $80 (i32.const 5532) "<")
 (data $80.1 (i32.const 5544) "\02\00\00\00\1e\00\00\00d\00r\00a\00w\00_\00s\00c\00h\00e\00d\00u\00l\00e\00d\00:")
 (data $81 (i32.const 5596) ",")
 (data $81.1 (i32.const 5608) "\02\00\00\00\1a\00\00\00{\00\n\00 \00 \00 \00 \00\"\00t\00v\00l\00\"\00:\00\"")
 (data $82 (i32.const 5644) "<")
 (data $82.1 (i32.const 5656) "\02\00\00\00,\00\00\00\"\00,\00\n\00 \00 \00 \00 \00\"\00t\00o\00t\00a\00l\00S\00h\00a\00r\00e\00s\00\"\00:\00\"")
 (data $83 (i32.const 5708) "<")
 (data $83.1 (i32.const 5720) "\02\00\00\00(\00\00\00\"\00,\00\n\00 \00 \00 \00 \00\"\00p\00r\00i\00z\00e\00P\00o\00o\00l\00\"\00:\00\"")
 (data $84 (i32.const 5772) "L")
 (data $84.1 (i32.const 5784) "\02\00\00\00.\00\00\00\"\00,\00\n\00 \00 \00 \00 \00\"\00p\00a\00r\00t\00i\00c\00i\00p\00a\00n\00t\00s\00\"\00:\00\"")
 (data $85 (i32.const 5852) "L")
 (data $85.1 (i32.const 5864) "\02\00\00\002\00\00\00\"\00,\00\n\00 \00 \00 \00 \00\"\00n\00e\00x\00t\00D\00r\00a\00w\00P\00e\00r\00i\00o\00d\00\"\00:\00\"")
 (data $86 (i32.const 5932) "<")
 (data $86.1 (i32.const 5944) "\02\00\00\00,\00\00\00\"\00,\00\n\00 \00 \00 \00 \00\"\00d\00r\00a\00w\00P\00e\00r\00i\00o\00d\00s\00\"\00:\00\"")
 (data $87 (i32.const 5996) "<")
 (data $87.1 (i32.const 6008) "\02\00\00\00,\00\00\00\"\00,\00\n\00 \00 \00 \00 \00\"\00t\00i\00c\00k\00P\00e\00r\00i\00o\00d\00s\00\"\00:\00\"")
 (data $88 (i32.const 6060) "L")
 (data $88.1 (i32.const 6072) "\02\00\00\008\00\00\00\"\00,\00\n\00 \00 \00 \00 \00\"\00m\00i\00n\00P\00r\00i\00z\00e\00T\00h\00r\00e\00s\00h\00o\00l\00d\00\"\00:\00\"")
 (data $89 (i32.const 6140) "<")
 (data $89.1 (i32.const 6152) "\02\00\00\00,\00\00\00\"\00,\00\n\00 \00 \00 \00 \00\"\00w\00i\00n\00n\00e\00r\00C\00o\00u\00n\00t\00\"\00:\00\"")
 (data $90 (i32.const 6204) "L")
 (data $90.1 (i32.const 6216) "\02\00\00\002\00\00\00\"\00,\00\n\00 \00 \00 \00 \00\"\00l\00a\00s\00t\00D\00r\00a\00w\00P\00e\00r\00i\00o\00d\00\"\00:\00\"")
 (data $91 (i32.const 6284) "L")
 (data $91.1 (i32.const 6296) "\02\00\00\004\00\00\00\"\00,\00\n\00 \00 \00 \00 \00\"\00c\00o\00n\00t\00r\00a\00c\00t\00V\00e\00r\00s\00i\00o\00n\00\"\00:\00\"")
 (data $92 (i32.const 6364) "L")
 (data $92.1 (i32.const 6376) "\02\00\00\000\00\00\00\"\00,\00\n\00 \00 \00 \00 \00\"\00p\00r\00o\00p\00o\00s\00a\00l\00C\00o\00u\00n\00t\00\"\00:\00\"")
 (data $93 (i32.const 6444) "\1c")
 (data $93.1 (i32.const 6456) "\02\00\00\00\n\00\00\00\"\00\n\00 \00 \00}")
 (data $94 (i32.const 6476) "|\00\00\00\03\00\00\00\00\00\00\00\0f\00\00\00d\00\00\00\f0\15\00\00\00\00\00\00 \16\00\00\00\00\00\00`\16\00\00\00\00\00\00\a0\16\00\00\00\00\00\00\f0\16\00\00\00\00\00\00@\17\00\00\00\00\00\00\80\17\00\00\00\00\00\00\c0\17\00\00\00\00\00\00\10\18\00\00\00\00\00\00P\18\00\00\00\00\00\00\a0\18\00\00\00\00\00\00\f0\18\00\00\00\00\00\00@\19")
 (data $95 (i32.const 6604) "<")
 (data $95.1 (i32.const 6616) "\02\00\00\00$\00\00\00~\00l\00i\00b\00/\00t\00y\00p\00e\00d\00a\00r\00r\00a\00y\00.\00t\00s")
 (data $96 (i32.const 6668) "\8c")
 (data $96.1 (i32.const 6680) "\02\00\00\00n\00\00\00c\00a\00n\00\'\00t\00 \00d\00e\00s\00e\00r\00i\00a\00l\00i\00z\00e\00 \00u\003\002\00 \00f\00r\00o\00m\00 \00g\00i\00v\00e\00n\00 \00a\00r\00g\00u\00m\00e\00n\00t\00:\00 \00o\00u\00t\00 \00o\00f\00 \00r\00a\00n\00g\00e")
 (data $97 (i32.const 6812) "\8c")
 (data $97.1 (i32.const 6824) "\02\00\00\00t\00\00\00c\00a\00n\00\'\00t\00 \00d\00e\00s\00e\00r\00i\00a\00l\00i\00z\00e\00 \00s\00t\00r\00i\00n\00g\00 \00f\00r\00o\00m\00 \00g\00i\00v\00e\00n\00 \00a\00r\00g\00u\00m\00e\00n\00t\00:\00 \00o\00u\00t\00 \00o\00f\00 \00r\00a\00n\00g\00e")
 (data $98 (i32.const 6956) "\1c")
 (data $98.1 (i32.const 6968) "\02\00\00\00\08\00\00\00a\00d\00d\00r")
 (data $99 (i32.const 6988) "\1c\00\00\00\03\00\00\00\00\00\00\00\0f\00\00\00\0c\00\00\00\00\00\00\00\d0\0b")
 (data $100 (i32.const 7020) ",")
 (data $100.1 (i32.const 7032) "\02\00\00\00\16\00\00\00{\00\"\00s\00h\00a\00r\00e\00s\00\"\00:\00\"")
 (data $101 (i32.const 7068) "<")
 (data $101.1 (i32.const 7080) "\02\00\00\00\1e\00\00\00\"\00,\00\"\00p\00r\00i\00n\00c\00i\00p\00a\00l\00\"\00:\00\"")
 (data $102 (i32.const 7132) "<")
 (data $102.1 (i32.const 7144) "\02\00\00\00,\00\00\00\"\00,\00\"\00e\00f\00f\00e\00c\00t\00i\00v\00e\00T\00i\00c\00k\00e\00t\00s\00\"\00:\00\"")
 (data $103 (i32.const 7196) "\1c")
 (data $103.1 (i32.const 7208) "\02\00\00\00\04\00\00\00\"\00}")
 (data $104 (i32.const 7228) ",\00\00\00\03\00\00\00\00\00\00\00\0f\00\00\00\1c\00\00\00\80\1b\00\00\00\00\00\00\b0\1b\00\00\00\00\00\00\f0\1b\00\00\00\00\00\000\1c")
 (data $105 (i32.const 7276) ",")
 (data $105.1 (i32.const 7288) "\02\00\00\00\16\00\00\00s\00t\00a\00r\00t\00_\00i\00n\00d\00e\00x")
 (data $106 (i32.const 7324) "\1c\00\00\00\03\00\00\00\00\00\00\00\0f\00\00\00\0c\00\00\00\00\00\00\00\d0\0b")
 (data $107 (i32.const 7356) "\1c")
 (data $107.1 (i32.const 7368) "\02\00\00\00\n\00\00\00l\00i\00m\00i\00t")
 (data $108 (i32.const 7388) "\1c\00\00\00\03\00\00\00\00\00\00\00\0f\00\00\00\0c\00\00\00\00\00\00\00\d0\0b")
 (data $109 (i32.const 7420) "\1c")
 (data $109.1 (i32.const 7432) "\02\00\00\00\02\00\00\00[")
 (data $110 (i32.const 7452) ",")
 (data $110.1 (i32.const 7464) "\02\00\00\00\16\00\00\00{\00\"\00p\00e\00r\00i\00o\00d\00\"\00:\00\"")
 (data $111 (i32.const 7500) ",")
 (data $111.1 (i32.const 7512) "\02\00\00\00\18\00\00\00\"\00,\00\"\00w\00i\00n\00n\00e\00r\00\"\00:\00\"")
 (data $112 (i32.const 7548) ",")
 (data $112.1 (i32.const 7560) "\02\00\00\00\16\00\00\00\"\00,\00\"\00p\00r\00i\00z\00e\00\"\00:\00\"")
 (data $113 (i32.const 7596) ",")
 (data $113.1 (i32.const 7608) "\02\00\00\00\14\00\00\00\"\00,\00\"\00s\00e\00e\00d\00\"\00:\00\"")
 (data $114 (i32.const 7644) "<\00\00\00\03\00\00\00\00\00\00\00\0f\00\00\00$\00\00\000\1d\00\00\00\00\00\00`\1d\00\00\00\00\00\00\90\1d\00\00\00\00\00\00\c0\1d\00\00\00\00\00\000\1c")
 (data $115 (i32.const 7708) "\1c")
 (data $115.1 (i32.const 7720) "\02\00\00\00\02\00\00\00]")
 (data $116 (i32.const 7740) ",")
 (data $116.1 (i32.const 7752) "\02\00\00\00\1a\00\00\00p\00r\00o\00p\00o\00s\00a\00l\00_\00t\00y\00p\00e")
 (data $117 (i32.const 7788) "\1c\00\00\00\03\00\00\00\00\00\00\00\0f\00\00\00\0c\00\00\00\00\00\00\00\d0\0b")
 (data $118 (i32.const 7820) ",")
 (data $118.1 (i32.const 7832) "\02\00\00\00\12\00\00\00n\00e\00w\00_\00v\00a\00l\00u\00e")
 (data $119 (i32.const 7868) "\1c\00\00\00\03\00\00\00\00\00\00\00\0f\00\00\00\0c\00\00\00\00\00\00\00\d0\0b")
 (data $120 (i32.const 7900) ",")
 (data $120.1 (i32.const 7912) "\02\00\00\00\12\00\00\00n\00o\00_\00s\00h\00a\00r\00e\00s")
 (data $121 (i32.const 7948) "<")
 (data $121.1 (i32.const 7960) "\02\00\00\00&\00\00\00i\00n\00s\00u\00f\00f\00i\00c\00i\00e\00n\00t\00_\00s\00h\00a\00r\00e\00s")
 (data $122 (i32.const 8012) "\1c")
 (data $122.1 (i32.const 8024) "\02\00\00\00\08\00\00\00:\000\00:\000")
 (data $123 (i32.const 8044) "<\00\00\00\03\00\00\00\00\00\00\00\0f\00\00\00(\00\00\00\00\00\00\00\90\0f\00\00\00\00\00\00\90\0f\00\00\00\00\00\00\90\0f\00\00\00\00\00\00\90\0f\00\00\00\00\00\00`\1f")
 (data $124 (i32.const 8108) ",")
 (data $124.1 (i32.const 8120) "\02\00\00\00\12\00\00\00p\00r\00o\00p\00o\00s\00a\00l\00_")
 (data $125 (i32.const 8156) "<")
 (data $125.1 (i32.const 8168) "\02\00\00\00\"\00\00\00p\00r\00o\00p\00o\00s\00a\00l\00_\00c\00r\00e\00a\00t\00e\00d\00:")
 (data $126 (i32.const 8220) "<\00\00\00\03\00\00\00\00\00\00\00\0f\00\00\00 \00\00\00\f0\1f\00\00\00\00\00\00\90\0f\00\00\00\00\00\00\90\0f\00\00\00\00\00\00\90\0f")
 (data $127 (i32.const 8284) ",")
 (data $127.1 (i32.const 8296) "\02\00\00\00\16\00\00\00p\00r\00o\00p\00o\00s\00a\00l\00_\00i\00d")
 (data $128 (i32.const 8332) "\1c\00\00\00\03\00\00\00\00\00\00\00\0f\00\00\00\0c\00\00\00\00\00\00\00\d0\0b")
 (data $129 (i32.const 8364) "\8c")
 (data $129.1 (i32.const 8376) "\02\00\00\00p\00\00\00c\00a\00n\00\'\00t\00 \00d\00e\00s\00e\00r\00i\00a\00l\00i\00z\00e\00 \00b\00o\00o\00l\00 \00f\00r\00o\00m\00 \00g\00i\00v\00e\00n\00 \00a\00r\00g\00u\00m\00e\00n\00t\00:\00 \00o\00u\00t\00 \00o\00f\00 \00r\00a\00n\00g\00e")
 (data $130 (i32.const 8508) ",")
 (data $130.1 (i32.const 8520) "\02\00\00\00\0e\00\00\00s\00u\00p\00p\00o\00r\00t")
 (data $131 (i32.const 8556) "\1c\00\00\00\03\00\00\00\00\00\00\00\0f\00\00\00\0c\00\00\00\00\00\00\00\d0\0b")
 (data $132 (i32.const 8588) "<")
 (data $132.1 (i32.const 8600) "\02\00\00\00$\00\00\00p\00r\00o\00p\00o\00s\00a\00l\00_\00n\00o\00t\00_\00f\00o\00u\00n\00d")
 (data $133 (i32.const 8652) "<")
 (data $133.1 (i32.const 8664) "\02\00\00\00*\00\00\00i\00n\00v\00a\00l\00i\00d\00_\00p\00r\00o\00p\00o\00s\00a\00l\00_\00d\00a\00t\00a")
 (data $134 (i32.const 8716) ",")
 (data $134.1 (i32.const 8728) "\02\00\00\00\18\00\00\00v\00o\00t\00i\00n\00g\00_\00e\00n\00d\00e\00d")
 (data $135 (i32.const 8764) "\1c")
 (data $135.1 (i32.const 8776) "\02\00\00\00\n\00\00\00v\00o\00t\00e\00:")
 (data $136 (i32.const 8796) ",\00\00\00\03\00\00\00\00\00\00\00\0f\00\00\00\10\00\00\00P\"\00\00\00\00\00\00\90\0f")
 (data $137 (i32.const 8844) ",")
 (data $137.1 (i32.const 8856) "\02\00\00\00\1a\00\00\00a\00l\00r\00e\00a\00d\00y\00_\00v\00o\00t\00e\00d")
 (data $138 (i32.const 8892) "\1c")
 (data $138.1 (i32.const 8904) "\02\00\00\00\06\00\00\00y\00e\00s")
 (data $139 (i32.const 8924) "\1c")
 (data $139.1 (i32.const 8936) "\02\00\00\00\04\00\00\00n\00o")
 (data $140 (i32.const 8956) "L\00\00\00\03\00\00\00\00\00\00\00\0f\00\00\004\00\00\00\00\00\00\00\90\0f\00\00\00\00\00\00\90\0f\00\00\00\00\00\00\90\0f\00\00\00\00\00\00\90\0f\00\00\00\00\00\00\90\0f\00\00\00\00\00\00\90\0f")
 (data $141 (i32.const 9036) ",")
 (data $141.1 (i32.const 9048) "\02\00\00\00\14\00\00\00v\00o\00t\00e\00_\00c\00a\00s\00t\00:")
 (data $142 (i32.const 9084) "<\00\00\00\03\00\00\00\00\00\00\00\0f\00\00\00 \00\00\00`#\00\00\00\00\00\00\90\0f\00\00\00\00\00\00\90\0f\00\00\00\00\00\00\90\0f")
 (data $143 (i32.const 9148) "\1c\00\00\00\03\00\00\00\00\00\00\00\0f\00\00\00\0c\00\00\00\00\00\00\00\d0\0b")
 (data $144 (i32.const 9180) "<")
 (data $144.1 (i32.const 9192) "\02\00\00\00 \00\00\00v\00o\00t\00i\00n\00g\00_\00n\00o\00t\00_\00e\00n\00d\00e\00d")
 (data $145 (i32.const 9244) "<")
 (data $145.1 (i32.const 9256) "\02\00\00\00\"\00\00\00p\00r\00o\00p\00o\00s\00a\00l\00_\00r\00e\00j\00e\00c\00t\00e\00d")
 (data $146 (i32.const 9308) "<")
 (data $146.1 (i32.const 9320) "\02\00\00\00&\00\00\00i\00n\00s\00u\00f\00f\00i\00c\00i\00e\00n\00t\00_\00q\00u\00o\00r\00u\00m")
 (data $147 (i32.const 9372) ",")
 (data $147.1 (i32.const 9384) "\02\00\00\00\12\00\00\00m\00i\00n\00_\00p\00r\00i\00z\00e")
 (data $148 (i32.const 9420) "<")
 (data $148.1 (i32.const 9432) "\02\00\00\00$\00\00\00p\00r\00o\00p\00o\00s\00a\00l\00_\00e\00x\00e\00c\00u\00t\00e\00d\00:")
 (data $149 (i32.const 9484) ",")
 (data $149.1 (i32.const 9496) "\02\00\00\00\16\00\00\00:\00m\00i\00n\00_\00p\00r\00i\00z\00e\00:")
 (data $150 (i32.const 9532) ",\00\00\00\03\00\00\00\00\00\00\00\0f\00\00\00\10\00\00\00\e0$\00\00\00\00\00\00 %")
 (data $151 (i32.const 9580) ",")
 (data $151.1 (i32.const 9592) "\02\00\00\00\1c\00\00\00:\00d\00r\00a\00w\00_\00p\00e\00r\00i\00o\00d\00s\00:")
 (data $152 (i32.const 9628) ",\00\00\00\03\00\00\00\00\00\00\00\0f\00\00\00\10\00\00\00\e0$\00\00\00\00\00\00\80%")
 (data $153 (i32.const 9676) "L")
 (data $153.1 (i32.const 9688) "\02\00\00\002\00\00\00u\00n\00s\00u\00p\00p\00o\00r\00t\00e\00d\00_\00p\00r\00o\00p\00o\00s\00a\00l\00_\00t\00y\00p\00e")
 (data $154 (i32.const 9756) "\1c\00\00\00\03\00\00\00\00\00\00\00\0f\00\00\00\0c\00\00\00\00\00\00\00\d0\0b")
 (data $155 (i32.const 9788) "L")
 (data $155.1 (i32.const 9800) "\02\00\00\00<\00\00\00{\00\"\00e\00r\00r\00o\00r\00\"\00:\00\"\00p\00r\00o\00p\00o\00s\00a\00l\00_\00n\00o\00t\00_\00f\00o\00u\00n\00d\00\"\00}")
 (data $156 (i32.const 9868) "\\")
 (data $156.1 (i32.const 9880) "\02\00\00\00B\00\00\00{\00\"\00e\00r\00r\00o\00r\00\"\00:\00\"\00i\00n\00v\00a\00l\00i\00d\00_\00p\00r\00o\00p\00o\00s\00a\00l\00_\00d\00a\00t\00a\00\"\00}")
 (data $157 (i32.const 9964) ",")
 (data $157.1 (i32.const 9976) "\02\00\00\00\18\00\00\00{\00\n\00 \00 \00 \00 \00\"\00i\00d\00\"\00:\00\"")
 (data $158 (i32.const 10012) "<")
 (data $158.1 (i32.const 10024) "\02\00\00\00\1e\00\00\00\"\00,\00\n\00 \00 \00 \00 \00\"\00t\00y\00p\00e\00\"\00:\00\"")
 (data $159 (i32.const 10076) "<")
 (data $159.1 (i32.const 10088) "\02\00\00\00 \00\00\00\"\00,\00\n\00 \00 \00 \00 \00\"\00v\00a\00l\00u\00e\00\"\00:\00\"")
 (data $160 (i32.const 10140) "<")
 (data $160.1 (i32.const 10152) "\02\00\00\00&\00\00\00\"\00,\00\n\00 \00 \00 \00 \00\"\00p\00r\00o\00p\00o\00s\00e\00r\00\"\00:\00\"")
 (data $161 (i32.const 10204) "<")
 (data $161.1 (i32.const 10216) "\02\00\00\00,\00\00\00\"\00,\00\n\00 \00 \00 \00 \00\"\00s\00t\00a\00r\00t\00P\00e\00r\00i\00o\00d\00\"\00:\00\"")
 (data $162 (i32.const 10268) "<")
 (data $162.1 (i32.const 10280) "\02\00\00\00(\00\00\00\"\00,\00\n\00 \00 \00 \00 \00\"\00e\00n\00d\00P\00e\00r\00i\00o\00d\00\"\00:\00\"")
 (data $163 (i32.const 10332) "<")
 (data $163.1 (i32.const 10344) "\02\00\00\00&\00\00\00\"\00,\00\n\00 \00 \00 \00 \00\"\00y\00e\00s\00V\00o\00t\00e\00s\00\"\00:\00\"")
 (data $164 (i32.const 10396) "<")
 (data $164.1 (i32.const 10408) "\02\00\00\00$\00\00\00\"\00,\00\n\00 \00 \00 \00 \00\"\00n\00o\00V\00o\00t\00e\00s\00\"\00:\00\"")
 (data $165 (i32.const 10460) "\\\00\00\00\03\00\00\00\00\00\00\00\0f\00\00\00D\00\00\00\00\'\00\00\00\00\00\000\'\00\00\00\00\00\00p\'\00\00\00\00\00\00\b0\'\00\00\00\00\00\00\f0\'\00\00\00\00\00\000(\00\00\00\00\00\00p(\00\00\00\00\00\00\b0(\00\00\00\00\00\00@\19")
 (data $166 (i32.const 10556) "<")
 (data $166.1 (i32.const 10568) "\02\00\00\00*\00\00\00O\00b\00j\00e\00c\00t\00 \00a\00l\00r\00e\00a\00d\00y\00 \00p\00i\00n\00n\00e\00d")
 (data $167 (i32.const 10620) "<")
 (data $167.1 (i32.const 10632) "\02\00\00\00(\00\00\00O\00b\00j\00e\00c\00t\00 \00i\00s\00 \00n\00o\00t\00 \00p\00i\00n\00n\00e\00d")
 (data $168 (i32.const 10688) "\15\00\00\00 \00\00\00 \00\00\00 ")
 (data $168.1 (i32.const 10712) "d\00\00\00\02\01\00\00\00\00\00\00 \00\00\00\02A\00\00\02A\00\00\02\t")
 (data $168.2 (i32.const 10748) "B\00\00\00\04A\00\00 \00\00\00A")
 (table $0 2 2 funcref)
 (elem $0 (i32.const 1) $~lib/@massalabs/massa-as-sdk/assembly/std/utils/address/json2Address~anonymous|0)
 (export "seedScheduler" (func $assembly/contracts/main/seedScheduler))
 (export "deposit" (func $assembly/contracts/main/deposit))
 (export "tick" (func $assembly/contracts/main/tick))
 (export "getVaultStats" (func $assembly/contracts/main/getVaultStats))
 (export "__new" (func $~lib/rt/itcms/__new))
 (export "__pin" (func $~lib/rt/itcms/__pin))
 (export "__unpin" (func $~lib/rt/itcms/__unpin))
 (export "__collect" (func $~lib/rt/itcms/__collect))
 (export "__rtti_base" (global $~lib/rt/__rtti_base))
 (export "memory" (memory $0))
 (export "constructor" (func $export:assembly/contracts/main/constructor))
 (export "withdraw" (func $export:assembly/contracts/main/withdraw))
 (export "getUserPosition" (func $export:assembly/contracts/main/getUserPosition))
 (export "getWinners" (func $export:assembly/contracts/main/getWinners))
 (export "createProposal" (func $export:assembly/contracts/main/createProposal))
 (export "voteOnProposal" (func $export:assembly/contracts/main/voteOnProposal))
 (export "executeProposal" (func $export:assembly/contracts/main/executeProposal))
 (export "getProposal" (func $export:assembly/contracts/main/getProposal))
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
   i32.const 43544
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
   i32.const 10688
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
   i32.const 10692
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
  i32.const 1968
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
  i32.const 2288
  call $~lib/rt/itcms/__visit
  i32.const 2352
  call $~lib/rt/itcms/__visit
  i32.const 2416
  call $~lib/rt/itcms/__visit
  i32.const 2464
  call $~lib/rt/itcms/__visit
  i32.const 1152
  call $~lib/rt/itcms/__visit
  i32.const 1456
  call $~lib/rt/itcms/__visit
  i32.const 2672
  call $~lib/rt/itcms/__visit
  i32.const 1264
  call $~lib/rt/itcms/__visit
  i32.const 10576
  call $~lib/rt/itcms/__visit
  i32.const 10640
  call $~lib/rt/itcms/__visit
  i32.const 3712
  call $~lib/rt/itcms/__visit
  i32.const 3584
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
  i32.const 43552
  i32.const 0
  call $~lib/@massalabs/as-types/assembly/argument/Args#set:_offset
  i32.const 45120
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
    i32.const 43552
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
      i32.const 43552
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
  i32.const 43552
  i32.const 45124
  memory.size
  i64.extend_i32_s
  i64.const 16
  i64.shl
  call $~lib/rt/tlsf/addMemory
  i32.const 43552
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
      i32.const 43544
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
    i32.const 43544
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
     i32.const 43544
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
         i32.const 3712
         i32.const 3776
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
 (func $~lib/number/I32#toString (param $0 i32) (result i32)
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
  block $folding-inner0
   local.get $0
   i32.eqz
   if
    i32.const 3552
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
   local.tee $1
   select
   local.tee $3
   call $~lib/util/number/decimalCount32
   local.set $2
   global.get $~lib/memory/__stack_pointer
   local.get $2
   i32.const 1
   i32.shl
   local.get $1
   i32.add
   i32.const 2
   call $~lib/rt/itcms/__new
   local.tee $0
   i32.store
   local.get $0
   local.get $1
   i32.add
   local.get $3
   local.get $2
   call $~lib/util/number/utoa_dec_simple<u32>
   local.get $1
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
  local.get $0
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
    i32.const 10576
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
   i32.const 10640
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
  block $folding-inner2
   block $folding-inner1
    block $invalid
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
                block $~lib/arraybuffer/ArrayBufferView
                 block $~lib/string/String
                  block $~lib/arraybuffer/ArrayBuffer
                   block $~lib/object/Object
                    local.get $0
                    i32.const 8
                    i32.sub
                    i32.load
                    br_table $~lib/object/Object $~lib/arraybuffer/ArrayBuffer $~lib/string/String $~lib/arraybuffer/ArrayBufferView $folding-inner2 $~lib/staticarray/StaticArray<u8> $folding-inner1 $~lib/@massalabs/massa-as-sdk/assembly/std/address/Address $~lib/@massalabs/as-types/assembly/serializable/Serializable $~lib/array/Array<~lib/@massalabs/massa-as-sdk/assembly/std/address/Address> $~lib/array/Array<~lib/string/String> $folding-inner1 $~lib/function/Function<%28~lib/string/String%2Ci32%2C~lib/array/Array<~lib/string/String>%29=>~lib/@massalabs/massa-as-sdk/assembly/std/address/Address> $~lib/@massalabs/as-types/assembly/result/Result<u64> $folding-inner1 $~lib/staticarray/StaticArray<~lib/string/String> $~lib/@massalabs/massa-as-sdk/assembly/std/context/Slot $~lib/typedarray/Uint8Array $~lib/@massalabs/as-types/assembly/result/Result<~lib/string/String> $folding-inner2 $folding-inner2 $invalid
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
     br $folding-inner2
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
   return
  end
  local.get $0
  i32.load offset=4
  local.tee $0
  if
   local.get $0
   call $~lib/rt/itcms/__visit
  end
 )
 (func $~start
  (local $0 i32)
  i32.const 1104
  call $~lib/rt/itcms/initLazy
  global.set $~lib/rt/itcms/toSpace
  memory.size
  i32.const 16
  i32.shl
  i32.const 43544
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
  global.set $~lib/@massalabs/as-types/assembly/argument/NoArg
 )
 (func $~stack_check
  global.get $~lib/memory/__stack_pointer
  i32.const 10776
  i32.lt_s
  if
   i32.const 43568
   i32.const 43616
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
    i32.const 2528
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
    i32.const 2592
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
       call $~lib/rt/__newArray
       local.tee $0
       i32.store offset=20
       global.get $~lib/memory/__stack_pointer
       local.get $0
       i32.store offset=8
       local.get $0
       i32.load offset=4
       i32.const 2528
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
        i32.const 2528
        i32.store offset=28
        local.get $6
        i32.const 2528
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
      i32.const 2528
      i32.store offset=28
      local.get $6
      i32.const 2528
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
    i32.const 2640
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
  i32.const 2560
  i32.store offset=4
  i32.const 1
  global.set $~argumentsLength
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.const 2560
  call $~lib/string/String#split@varargs
  local.tee $0
  i32.store offset=12
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store
  global.get $~lib/memory/__stack_pointer
  i32.const 2640
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
   i32.const 2592
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
   i32.const 2672
   i32.const 2592
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
    i32.const 2880
    i32.store
    i64.const 0
    i32.const 2880
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
    i32.const 2528
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
 (func $~lib/util/string/joinReferenceArray<~lib/string/String> (param $0 i32) (param $1 i32) (result i32)
  (local $2 i32)
  (local $3 i32)
  (local $4 i32)
  (local $5 i32)
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
   local.tee $3
   i32.const 0
   i32.lt_s
   if
    i32.const 2528
    local.set $0
    br $folding-inner0
   end
   local.get $3
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
     i32.const 2528
     local.set $0
    end
    br $folding-inner0
   end
   i32.const 2528
   local.set $1
   global.get $~lib/memory/__stack_pointer
   i32.const 2528
   i32.store offset=8
   global.get $~lib/memory/__stack_pointer
   i32.const 2528
   i32.store offset=4
   i32.const 2528
   call $~lib/string/String#get:length
   local.set $5
   loop $for-loop|0
    local.get $3
    local.get $4
    i32.gt_s
    if
     global.get $~lib/memory/__stack_pointer
     local.get $0
     local.get $4
     i32.const 2
     i32.shl
     i32.add
     i32.load
     local.tee $2
     i32.store
     global.get $~lib/memory/__stack_pointer
     local.get $2
     i32.store offset=4
     local.get $2
     call $~lib/string/String.__ne
     if
      global.get $~lib/memory/__stack_pointer
      local.get $1
      i32.store offset=4
      global.get $~lib/memory/__stack_pointer
      local.get $2
      i32.store offset=16
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
     if
      global.get $~lib/memory/__stack_pointer
      local.get $1
      i32.store offset=4
      global.get $~lib/memory/__stack_pointer
      i32.const 2528
      i32.store offset=12
      global.get $~lib/memory/__stack_pointer
      local.get $1
      i32.const 2528
      call $~lib/string/String.__concat
      local.tee $1
      i32.store offset=8
     end
     local.get $4
     i32.const 1
     i32.add
     local.set $4
     br $for-loop|0
    end
   end
   global.get $~lib/memory/__stack_pointer
   local.get $0
   local.get $3
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
  i32.const 2528
  i32.store
  local.get $0
  local.get $1
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
  local.get $2
  i32.const 20
  i32.sub
  i32.load offset=16
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
  block $__inlined_func$~lib/@massalabs/as-types/assembly/serialization/strings/stringToBytes$92 (result i32)
   local.get $0
   call $~lib/string/String#get:length
   i32.eqz
   if
    i32.const 0
    i32.const 5
    i32.const 3680
    call $~lib/rt/__newBuffer
    br $__inlined_func$~lib/@massalabs/as-types/assembly/serialization/strings/stringToBytes$92
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
  (local $2 i32)
  (local $3 i32)
  (local $4 i64)
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
  local.set $2
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
  local.tee $3
  i32.store
  global.get $~lib/memory/__stack_pointer
  local.get $3
  i32.store offset=4
  local.get $3
  i64.const 0
  call $~lib/@massalabs/as-types/assembly/result/Result<u64>#set:value
  global.get $~lib/memory/__stack_pointer
  local.get $3
  i32.store offset=4
  local.get $3
  i32.const 0
  call $~lib/@massalabs/massa-as-sdk/assembly/std/context/Slot#set:thread
  global.get $~lib/memory/__stack_pointer
  local.get $3
  i32.store offset=4
  local.get $3
  local.get $0
  call $~lib/@massalabs/as-types/assembly/result/Result<u64>#set:value
  global.get $~lib/memory/__stack_pointer
  local.get $3
  i32.store offset=4
  local.get $3
  local.get $1
  call $~lib/@massalabs/massa-as-sdk/assembly/std/context/Slot#set:thread
  global.get $~lib/memory/__stack_pointer
  i32.const 8
  i32.add
  global.set $~lib/memory/__stack_pointer
  local.get $2
  local.get $3
  i32.store
  global.get $~lib/memory/__stack_pointer
  local.get $3
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
  local.get $3
  i32.store
  local.get $3
  i64.load
  local.set $4
  global.get $~lib/memory/__stack_pointer
  local.get $3
  i32.store
  local.get $4
  local.get $3
  i32.load8_u offset=8
  i64.const 2000000
  i64.const 0
  call $~lib/@massalabs/massa-as-sdk/assembly/env/env/env.deferredCallQuote
  drop
  global.get $~lib/memory/__stack_pointer
  i32.const 4
  i32.add
  global.set $~lib/memory/__stack_pointer
  global.get $~lib/memory/__stack_pointer
  local.set $2
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
  i32.const 3856
  i32.store offset=8
  global.get $~lib/memory/__stack_pointer
  local.get $3
  i32.store offset=12
  i32.const 0
  i32.const 5
  i32.const 3888
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
  i32.const 3856
  i32.store offset=4
  global.get $~lib/memory/__stack_pointer
  local.get $3
  i32.store offset=12
  local.get $3
  i64.load
  local.set $4
  global.get $~lib/memory/__stack_pointer
  local.get $3
  i32.store offset=12
  local.get $3
  i32.load8_u offset=8
  local.set $3
  global.get $~lib/memory/__stack_pointer
  local.get $1
  i32.store offset=8
  local.get $5
  i32.const 3856
  local.get $4
  local.get $3
  i64.const 2000000
  local.get $1
  i64.const 0
  call $~lib/@massalabs/massa-as-sdk/assembly/env/env/env.deferredCallRegister
  local.set $1
  global.get $~lib/memory/__stack_pointer
  i32.const 16
  i32.add
  global.set $~lib/memory/__stack_pointer
  local.get $2
  local.get $1
  i32.store offset=24
  global.get $~lib/memory/__stack_pointer
  local.get $0
  call $~lib/util/number/utoa64
  local.tee $2
  i32.store offset=28
  global.get $~lib/memory/__stack_pointer
  local.get $1
  i32.store offset=32
  global.get $~lib/memory/__stack_pointer
  i32.const 4016
  i32.store offset=8
  global.get $~lib/memory/__stack_pointer
  local.get $2
  i32.store offset=12
  i32.const 4016
  i32.const 1
  local.get $2
  call $~lib/staticarray/StaticArray<~lib/string/String>#__uset
  global.get $~lib/memory/__stack_pointer
  i32.const 4016
  i32.store offset=8
  global.get $~lib/memory/__stack_pointer
  local.get $1
  i32.store offset=12
  i32.const 4016
  i32.const 3
  local.get $1
  call $~lib/staticarray/StaticArray<~lib/string/String>#__uset
  global.get $~lib/memory/__stack_pointer
  i32.const 4016
  i32.store offset=8
  global.get $~lib/memory/__stack_pointer
  i32.const 2528
  i32.store offset=12
  i32.const 4016
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
   i32.const 2800
   i32.const 80
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
  i32.const 1968
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
     i32.const 1968
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
     i32.const 3056
     i32.store
     global.get $~lib/memory/__stack_pointer
     i32.const 1968
     i32.store offset=4
     i32.const 3056
     i32.const 0
     i32.const 1968
     call $~lib/staticarray/StaticArray<~lib/string/String>#__uset
     i32.const 3056
     local.set $0
     global.get $~lib/memory/__stack_pointer
     i32.const 3056
     i32.store
     global.get $~lib/memory/__stack_pointer
     local.get $4
     i32.store offset=4
     i32.const 3056
     i32.const 2
     local.get $4
     call $~lib/staticarray/StaticArray<~lib/string/String>#__uset
     global.get $~lib/memory/__stack_pointer
     i32.const 3056
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
    i32.const 2016
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
     i32.const 2016
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
     i32.const 3328
     i32.store
     global.get $~lib/memory/__stack_pointer
     i32.const 2016
     i32.store offset=4
     i32.const 3328
     i32.const 0
     i32.const 2016
     call $~lib/staticarray/StaticArray<~lib/string/String>#__uset
     i32.const 3328
     local.set $0
     global.get $~lib/memory/__stack_pointer
     i32.const 3328
     i32.store
     global.get $~lib/memory/__stack_pointer
     local.get $4
     i32.store offset=4
     i32.const 3328
     i32.const 2
     local.get $4
     call $~lib/staticarray/StaticArray<~lib/string/String>#__uset
     global.get $~lib/memory/__stack_pointer
     i32.const 3328
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
    i32.const 1968
    i32.store
    i32.const 1968
    local.get $1
    call $assembly/contracts/main/sSetU64
    global.get $~lib/memory/__stack_pointer
    i32.const 2016
    i32.store
    i32.const 2016
    local.get $2
    call $assembly/contracts/main/sSetU64
    global.get $~lib/memory/__stack_pointer
    i32.const 1744
    i32.store
    i32.const 1744
    i64.const 0
    call $assembly/contracts/main/sSetU64
    global.get $~lib/memory/__stack_pointer
    i32.const 1792
    i32.store
    i32.const 1792
    i64.const 0
    call $assembly/contracts/main/sSetU64
    global.get $~lib/memory/__stack_pointer
    i32.const 1856
    i32.store
    i32.const 1856
    i64.const 0
    call $assembly/contracts/main/sSetU64
    global.get $~lib/memory/__stack_pointer
    i32.const 2176
    i32.store
    i32.const 2176
    i64.const 100000000
    call $assembly/contracts/main/sSetU64
    global.get $~lib/memory/__stack_pointer
    i32.const 2240
    i32.store
    i32.const 2240
    i64.const 0
    call $assembly/contracts/main/sSetU64
    global.get $~lib/memory/__stack_pointer
    i32.const 2416
    i32.store
    i32.const 2416
    i64.const 0
    call $assembly/contracts/main/sSetU64
    global.get $~lib/memory/__stack_pointer
    i32.const 2464
    i32.store
    i32.const 2464
    i64.const 100800
    call $assembly/contracts/main/sSetU64
    global.get $~lib/memory/__stack_pointer
    i32.const 2352
    i32.store
    global.get $~lib/memory/__stack_pointer
    i32.const 3824
    i32.store offset=4
    i32.const 2352
    i32.const 3824
    call $~lib/@massalabs/massa-as-sdk/assembly/std/storage/set<~lib/string/String>
    global.get $~lib/memory/__stack_pointer
    i32.const 2064
    i32.store
    i32.const 2064
    i64.const 0
    call $assembly/contracts/main/sSetU64
    call $~lib/@massalabs/massa-as-sdk/assembly/env/env/env.currentPeriod
    local.set $3
    global.get $~lib/memory/__stack_pointer
    i32.const 1904
    i32.store
    i32.const 1904
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
    i32.const 4176
    i32.store offset=4
    global.get $~lib/memory/__stack_pointer
    local.get $0
    i32.store offset=84
    i32.const 4176
    i32.const 1
    local.get $0
    call $~lib/staticarray/StaticArray<~lib/string/String>#__uset
    global.get $~lib/memory/__stack_pointer
    i32.const 4176
    i32.store offset=4
    global.get $~lib/memory/__stack_pointer
    local.get $4
    i32.store offset=84
    i32.const 4176
    i32.const 3
    local.get $4
    call $~lib/staticarray/StaticArray<~lib/string/String>#__uset
    global.get $~lib/memory/__stack_pointer
    i32.const 4176
    i32.store offset=4
    global.get $~lib/memory/__stack_pointer
    i32.const 2528
    i32.store offset=84
    i32.const 4176
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
   i32.const 3088
   i32.const 3216
   i32.const 52
   i32.const 32
   call $~lib/builtins/abort
   unreachable
  end
  global.get $~lib/memory/__stack_pointer
  i32.const 2528
  i32.store offset=4
  local.get $0
  call $~lib/staticarray/StaticArray<~lib/string/String>#join
  i32.const 3216
  i32.const 52
  i32.const 7
  call $~lib/builtins/abort
  unreachable
 )
 (func $assembly/contracts/main/sHas (param $0 i32) (result i32)
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
  global.get $~lib/memory/__stack_pointer
  i32.const 4
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
    i32.const 2528
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
     block $__inlined_func$~lib/util/string/isSpace$111 (result i32)
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
      br_if $__inlined_func$~lib/util/string/isSpace$111
      drop
      i32.const 1
      local.get $0
      i32.const -8192
      i32.add
      i32.const 10
      i32.le_u
      br_if $__inlined_func$~lib/util/string/isSpace$111
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
      br_if $__inlined_func$~lib/util/string/isSpace$111
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
 (func $~lib/string/parseInt (param $0 i32) (result f64)
  (local $1 f64)
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
  local.set $1
  global.get $~lib/memory/__stack_pointer
  i32.const 4
  i32.add
  global.set $~lib/memory/__stack_pointer
  local.get $1
 )
 (func $assembly/contracts/main/sGetU64 (param $0 i32) (result i64)
  (local $1 i64)
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
  call $assembly/contracts/main/sHas
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
   local.get $0
   call $~lib/string/parseInt
   i64.trunc_sat_f64_u
  else
   i64.const 0
  end
  local.set $1
  global.get $~lib/memory/__stack_pointer
  i32.const 8
  i32.add
  global.set $~lib/memory/__stack_pointer
  local.get $1
 )
 (func $assembly/contracts/main/seedScheduler
  (local $0 i32)
  (local $1 i64)
  (local $2 i64)
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
  local.tee $1
  i64.eqz
  if
   i32.const 4224
   i32.const 2800
   i32.const 110
   i32.const 3
   call $~lib/builtins/abort
   unreachable
  end
  global.get $~lib/memory/__stack_pointer
  i32.const 2128
  i32.store
  i32.const 2128
  call $assembly/contracts/main/sGetU64
  local.set $2
  global.get $~lib/memory/__stack_pointer
  i32.const 2128
  i32.store
  i32.const 2128
  local.get $1
  local.get $2
  i64.add
  call $assembly/contracts/main/sSetU64
  global.get $~lib/memory/__stack_pointer
  i32.const 4256
  i32.store offset=4
  local.get $1
  call $~lib/util/number/utoa64
  local.set $0
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store offset=8
  i32.const 4256
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
 (func $assembly/contracts/main/userSharesKey (param $0 i32) (result i32)
  local.get $0
  i32.const 4368
  call $byn$mgfn-shared$assembly/contracts/main/userSharesKey
 )
 (func $assembly/contracts/main/userPrincipalKey (param $0 i32) (result i32)
  local.get $0
  i32.const 4416
  call $byn$mgfn-shared$assembly/contracts/main/userSharesKey
 )
 (func $assembly/contracts/main/participantKey (param $0 i32) (result i32)
  local.get $0
  i32.const 4480
  call $byn$mgfn-shared$assembly/contracts/main/participantKey
 )
 (func $assembly/contracts/main/deposit
  (local $0 i32)
  (local $1 i64)
  (local $2 i64)
  (local $3 i64)
  (local $4 i32)
  (local $5 i32)
  (local $6 i32)
  (local $7 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 32
  i32.sub
  global.set $~lib/memory/__stack_pointer
  call $~stack_check
  global.get $~lib/memory/__stack_pointer
  i32.const 0
  i32.const 32
  memory.fill
  call $~lib/@massalabs/massa-as-sdk/assembly/env/env/env.callCoins
  local.tee $1
  i64.eqz
  if
   global.get $~lib/memory/__stack_pointer
   i32.const 4304
   i32.store
   i32.const 4304
   call $~lib/@massalabs/massa-as-sdk/assembly/std/utils/events/generateEvent
   global.get $~lib/memory/__stack_pointer
   i32.const 32
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
  local.tee $4
  i32.store offset=4
  global.get $~lib/memory/__stack_pointer
  local.get $4
  i32.store
  global.get $~lib/memory/__stack_pointer
  local.get $4
  call $assembly/contracts/main/userSharesKey
  local.tee $5
  i32.store offset=8
  global.get $~lib/memory/__stack_pointer
  local.get $4
  i32.store
  global.get $~lib/memory/__stack_pointer
  local.get $4
  call $assembly/contracts/main/userPrincipalKey
  local.tee $6
  i32.store offset=12
  global.get $~lib/memory/__stack_pointer
  local.get $5
  i32.store
  local.get $5
  call $assembly/contracts/main/sGetU64
  local.set $2
  global.get $~lib/memory/__stack_pointer
  local.get $6
  i32.store
  local.get $6
  call $assembly/contracts/main/sGetU64
  local.set $3
  local.get $2
  i64.eqz
  if
   global.get $~lib/memory/__stack_pointer
   i32.const 2064
   i32.store
   i32.const 2064
   call $assembly/contracts/main/sGetU64
   i32.wrap_i64
   local.tee $0
   call $assembly/contracts/main/participantKey
   local.set $7
   global.get $~lib/memory/__stack_pointer
   local.get $7
   i32.store
   global.get $~lib/memory/__stack_pointer
   local.get $4
   i32.store offset=16
   local.get $7
   local.get $4
   call $~lib/@massalabs/massa-as-sdk/assembly/std/storage/set<~lib/string/String>
   global.get $~lib/memory/__stack_pointer
   i32.const 2064
   i32.store
   i32.const 2064
   local.get $0
   i32.const 1
   i32.add
   i64.extend_i32_s
   call $assembly/contracts/main/sSetU64
  end
  global.get $~lib/memory/__stack_pointer
  local.get $5
  i32.store
  local.get $5
  local.get $1
  local.get $2
  i64.add
  call $assembly/contracts/main/sSetU64
  global.get $~lib/memory/__stack_pointer
  local.get $6
  i32.store
  local.get $6
  local.get $1
  local.get $3
  i64.add
  call $assembly/contracts/main/sSetU64
  global.get $~lib/memory/__stack_pointer
  i32.const 1744
  i32.store
  global.get $~lib/memory/__stack_pointer
  i32.const 1744
  i32.store offset=16
  i32.const 1744
  i32.const 1744
  call $assembly/contracts/main/sGetU64
  local.get $1
  i64.add
  call $assembly/contracts/main/sSetU64
  global.get $~lib/memory/__stack_pointer
  i32.const 1792
  i32.store
  global.get $~lib/memory/__stack_pointer
  i32.const 1792
  i32.store offset=16
  i32.const 1792
  i32.const 1792
  call $assembly/contracts/main/sGetU64
  local.get $1
  i64.add
  call $assembly/contracts/main/sSetU64
  global.get $~lib/memory/__stack_pointer
  local.get $4
  i32.store offset=20
  global.get $~lib/memory/__stack_pointer
  local.get $1
  call $~lib/util/number/utoa64
  local.tee $0
  i32.store offset=24
  global.get $~lib/memory/__stack_pointer
  i32.const 4560
  i32.store offset=16
  global.get $~lib/memory/__stack_pointer
  local.get $4
  i32.store offset=28
  i32.const 4560
  i32.const 1
  local.get $4
  call $~lib/staticarray/StaticArray<~lib/string/String>#__uset
  global.get $~lib/memory/__stack_pointer
  i32.const 4560
  i32.store offset=16
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store offset=28
  i32.const 4560
  i32.const 3
  local.get $0
  call $~lib/staticarray/StaticArray<~lib/string/String>#__uset
  global.get $~lib/memory/__stack_pointer
  i32.const 4560
  i32.store offset=16
  global.get $~lib/memory/__stack_pointer
  i32.const 2528
  i32.store offset=28
  i32.const 4560
  call $~lib/staticarray/StaticArray<~lib/string/String>#join
  local.set $0
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store
  local.get $0
  call $~lib/@massalabs/massa-as-sdk/assembly/std/utils/events/generateEvent
  global.get $~lib/memory/__stack_pointer
  i32.const 32
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
  (local $2 i64)
  (local $3 i64)
  (local $4 i32)
  (local $5 i32)
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
  i32.const 4608
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
  local.tee $4
  i32.store
  local.get $4
  call $~lib/string/String.__not
  i32.eqz
  if
   global.get $~lib/memory/__stack_pointer
   i32.const 4608
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
   local.set $4
   local.get $0
   i32.eqz
   if
    i32.const 3088
    i32.const 3216
    i32.const 52
    i32.const 32
    call $~lib/builtins/abort
    unreachable
   end
   local.get $4
   local.get $0
   i32.store offset=36
   global.get $~lib/memory/__stack_pointer
   i32.const 4640
   i32.store
   global.get $~lib/memory/__stack_pointer
   i32.const 4608
   i32.store offset=24
   i32.const 4640
   i32.const 0
   i32.const 4608
   call $~lib/staticarray/StaticArray<~lib/string/String>#__uset
   global.get $~lib/memory/__stack_pointer
   i32.const 4640
   i32.store
   global.get $~lib/memory/__stack_pointer
   local.get $0
   i32.store offset=24
   i32.const 4640
   i32.const 2
   local.get $0
   call $~lib/staticarray/StaticArray<~lib/string/String>#__uset
   global.get $~lib/memory/__stack_pointer
   i32.const 4640
   i32.store
   global.get $~lib/memory/__stack_pointer
   i32.const 2528
   i32.store offset=24
   i32.const 4640
   call $~lib/staticarray/StaticArray<~lib/string/String>#join
   i32.const 3216
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
  local.set $4
  global.get $~lib/memory/__stack_pointer
  local.get $4
  i32.store
  local.get $0
  local.get $4
  call $~lib/@massalabs/massa-as-sdk/assembly/std/address/Address#toString
  local.tee $4
  i32.store offset=44
  global.get $~lib/memory/__stack_pointer
  local.get $4
  i32.store
  global.get $~lib/memory/__stack_pointer
  local.get $4
  call $assembly/contracts/main/userSharesKey
  local.tee $0
  i32.store offset=48
  global.get $~lib/memory/__stack_pointer
  local.get $4
  i32.store
  global.get $~lib/memory/__stack_pointer
  local.get $4
  call $assembly/contracts/main/userPrincipalKey
  local.tee $5
  i32.store offset=52
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store
  local.get $0
  call $assembly/contracts/main/sGetU64
  local.set $2
  global.get $~lib/memory/__stack_pointer
  local.get $5
  i32.store
  local.get $5
  call $assembly/contracts/main/sGetU64
  local.set $3
  local.get $1
  i64.const 0
  i64.ne
  local.get $1
  local.get $2
  i64.le_u
  i32.and
  i32.eqz
  if
   i32.const 4672
   i32.const 2800
   i32.const 158
   i32.const 3
   call $~lib/builtins/abort
   unreachable
  end
  local.get $1
  local.get $3
  i64.gt_u
  if
   i32.const 4720
   i32.const 2800
   i32.const 159
   i32.const 3
   call $~lib/builtins/abort
   unreachable
  end
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store
  local.get $0
  local.get $2
  local.get $1
  i64.sub
  call $assembly/contracts/main/sSetU64
  global.get $~lib/memory/__stack_pointer
  local.get $5
  i32.store
  local.get $5
  local.get $3
  local.get $1
  i64.sub
  call $assembly/contracts/main/sSetU64
  global.get $~lib/memory/__stack_pointer
  i32.const 1744
  i32.store
  global.get $~lib/memory/__stack_pointer
  i32.const 1744
  i32.store offset=24
  i32.const 1744
  i32.const 1744
  call $assembly/contracts/main/sGetU64
  local.get $1
  i64.sub
  call $assembly/contracts/main/sSetU64
  global.get $~lib/memory/__stack_pointer
  i32.const 1792
  i32.store
  global.get $~lib/memory/__stack_pointer
  i32.const 1792
  i32.store offset=24
  i32.const 1792
  i32.const 1792
  call $assembly/contracts/main/sGetU64
  local.get $1
  i64.sub
  call $assembly/contracts/main/sSetU64
  global.get $~lib/memory/__stack_pointer
  local.get $4
  i32.store offset=24
  local.get $4
  call $~lib/@massalabs/massa-as-sdk/assembly/std/address/Address#constructor
  local.set $0
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store
  local.get $0
  local.get $1
  call $~lib/@massalabs/massa-as-sdk/assembly/std/coins/transfer/transferCoins
  global.get $~lib/memory/__stack_pointer
  local.get $4
  i32.store offset=56
  global.get $~lib/memory/__stack_pointer
  local.get $1
  call $~lib/util/number/utoa64
  local.tee $0
  i32.store offset=60
  global.get $~lib/memory/__stack_pointer
  i32.const 4832
  i32.store offset=24
  global.get $~lib/memory/__stack_pointer
  local.get $4
  i32.store offset=64
  i32.const 4832
  i32.const 1
  local.get $4
  call $~lib/staticarray/StaticArray<~lib/string/String>#__uset
  global.get $~lib/memory/__stack_pointer
  i32.const 4832
  i32.store offset=24
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store offset=64
  i32.const 4832
  i32.const 3
  local.get $0
  call $~lib/staticarray/StaticArray<~lib/string/String>#__uset
  global.get $~lib/memory/__stack_pointer
  i32.const 4832
  i32.store offset=24
  global.get $~lib/memory/__stack_pointer
  i32.const 2528
  i32.store offset=64
  i32.const 4832
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
 )
 (func $assembly/contracts/main/winnerKey (param $0 i32) (result i32)
  local.get $0
  i32.const 5408
  call $byn$mgfn-shared$assembly/contracts/main/participantKey
 )
 (func $assembly/contracts/main/enhancedRunDraw
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
  (local $11 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 88
  i32.sub
  global.set $~lib/memory/__stack_pointer
  call $~stack_check
  global.get $~lib/memory/__stack_pointer
  i32.const 0
  i32.const 88
  memory.fill
  global.get $~lib/memory/__stack_pointer
  i32.const 1856
  i32.store
  i32.const 1856
  call $assembly/contracts/main/sGetU64
  local.set $10
  global.get $~lib/memory/__stack_pointer
  i32.const 1744
  i32.store
  i32.const 1744
  call $assembly/contracts/main/sGetU64
  local.set $7
  global.get $~lib/memory/__stack_pointer
  i32.const 2064
  i32.store
  i32.const 2064
  call $assembly/contracts/main/sGetU64
  i32.wrap_i64
  local.set $3
  global.get $~lib/memory/__stack_pointer
  i32.const 2176
  i32.store
  i32.const 2176
  call $assembly/contracts/main/sGetU64
  local.set $5
  call $~lib/@massalabs/massa-as-sdk/assembly/env/env/env.currentPeriod
  local.set $9
  block $folding-inner0
   local.get $5
   local.get $10
   i64.gt_u
   if
    global.get $~lib/memory/__stack_pointer
    local.get $10
    call $~lib/util/number/utoa64
    local.tee $1
    i32.store offset=4
    global.get $~lib/memory/__stack_pointer
    local.get $5
    call $~lib/util/number/utoa64
    local.tee $0
    i32.store offset=8
    global.get $~lib/memory/__stack_pointer
    i32.const 4976
    i32.store offset=12
    global.get $~lib/memory/__stack_pointer
    local.get $1
    i32.store offset=16
    i32.const 4976
    i32.const 1
    local.get $1
    call $~lib/staticarray/StaticArray<~lib/string/String>#__uset
    global.get $~lib/memory/__stack_pointer
    i32.const 4976
    i32.store offset=12
    global.get $~lib/memory/__stack_pointer
    local.get $0
    i32.store offset=16
    i32.const 4976
    i32.const 3
    local.get $0
    call $~lib/staticarray/StaticArray<~lib/string/String>#__uset
    global.get $~lib/memory/__stack_pointer
    i32.const 4976
    i32.store offset=12
    global.get $~lib/memory/__stack_pointer
    i32.const 2528
    i32.store offset=16
    i32.const 4976
    call $~lib/staticarray/StaticArray<~lib/string/String>#join
    local.set $1
    br $folding-inner0
   end
   local.get $3
   i32.eqz
   local.get $7
   i64.eqz
   i32.or
   if
    global.get $~lib/memory/__stack_pointer
    local.get $3
    call $~lib/number/I32#toString
    local.tee $1
    i32.store offset=20
    global.get $~lib/memory/__stack_pointer
    local.get $7
    call $~lib/util/number/utoa64
    local.tee $0
    i32.store offset=24
    global.get $~lib/memory/__stack_pointer
    i32.const 5104
    i32.store offset=12
    global.get $~lib/memory/__stack_pointer
    local.get $1
    i32.store offset=16
    i32.const 5104
    i32.const 1
    local.get $1
    call $~lib/staticarray/StaticArray<~lib/string/String>#__uset
    global.get $~lib/memory/__stack_pointer
    i32.const 5104
    i32.store offset=12
    global.get $~lib/memory/__stack_pointer
    local.get $0
    i32.store offset=16
    i32.const 5104
    i32.const 3
    local.get $0
    call $~lib/staticarray/StaticArray<~lib/string/String>#__uset
    global.get $~lib/memory/__stack_pointer
    i32.const 5104
    i32.store offset=12
    global.get $~lib/memory/__stack_pointer
    i32.const 2528
    i32.store offset=16
    i32.const 5104
    call $~lib/staticarray/StaticArray<~lib/string/String>#join
    local.set $1
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
   i32.const 1744
   i32.store
   i32.const 1744
   call $assembly/contracts/main/sGetU64
   local.set $5
   global.get $~lib/memory/__stack_pointer
   i32.const 1856
   i32.store
   local.get $5
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
   i64.xor
   i32.const 1856
   call $assembly/contracts/main/sGetU64
   i64.const 8
   i64.shl
   i64.xor
   local.set $6
   global.get $~lib/memory/__stack_pointer
   i32.const 4
   i32.add
   global.set $~lib/memory/__stack_pointer
   local.get $6
   local.get $7
   i64.rem_u
   local.set $5
   global.get $~lib/memory/__stack_pointer
   local.get $9
   call $~lib/util/number/utoa64
   local.tee $2
   i32.store offset=28
   global.get $~lib/memory/__stack_pointer
   local.get $6
   call $~lib/util/number/utoa64
   local.tee $1
   i32.store offset=32
   global.get $~lib/memory/__stack_pointer
   local.get $5
   call $~lib/util/number/utoa64
   local.tee $0
   i32.store offset=36
   global.get $~lib/memory/__stack_pointer
   local.get $7
   call $~lib/util/number/utoa64
   local.tee $4
   i32.store offset=40
   global.get $~lib/memory/__stack_pointer
   i32.const 5200
   i32.store offset=12
   global.get $~lib/memory/__stack_pointer
   local.get $2
   i32.store offset=16
   i32.const 5200
   i32.const 1
   local.get $2
   call $~lib/staticarray/StaticArray<~lib/string/String>#__uset
   global.get $~lib/memory/__stack_pointer
   i32.const 5200
   i32.store offset=12
   global.get $~lib/memory/__stack_pointer
   local.get $1
   i32.store offset=16
   i32.const 5200
   i32.const 3
   local.get $1
   call $~lib/staticarray/StaticArray<~lib/string/String>#__uset
   global.get $~lib/memory/__stack_pointer
   i32.const 5200
   i32.store offset=12
   global.get $~lib/memory/__stack_pointer
   local.get $0
   i32.store offset=16
   i32.const 5200
   i32.const 5
   local.get $0
   call $~lib/staticarray/StaticArray<~lib/string/String>#__uset
   global.get $~lib/memory/__stack_pointer
   i32.const 5200
   i32.store offset=12
   global.get $~lib/memory/__stack_pointer
   local.get $4
   i32.store offset=16
   i32.const 5200
   i32.const 7
   local.get $4
   call $~lib/staticarray/StaticArray<~lib/string/String>#__uset
   global.get $~lib/memory/__stack_pointer
   i32.const 5200
   i32.store offset=12
   global.get $~lib/memory/__stack_pointer
   i32.const 2528
   i32.store offset=16
   i32.const 5200
   call $~lib/staticarray/StaticArray<~lib/string/String>#join
   local.set $0
   global.get $~lib/memory/__stack_pointer
   local.get $0
   i32.store
   local.get $0
   call $~lib/@massalabs/massa-as-sdk/assembly/std/utils/events/generateEvent
   i32.const 2528
   local.set $1
   global.get $~lib/memory/__stack_pointer
   i32.const 2528
   i32.store offset=44
   loop $for-loop|0
    local.get $3
    local.get $11
    i32.gt_s
    if
     block $for-break0
      global.get $~lib/memory/__stack_pointer
      local.set $2
      local.get $11
      call $assembly/contracts/main/participantKey
      local.set $0
      global.get $~lib/memory/__stack_pointer
      local.get $0
      i32.store
      local.get $2
      local.get $0
      call $~lib/@massalabs/massa-as-sdk/assembly/std/storage/get<~lib/string/String>
      local.tee $0
      i32.store offset=48
      global.get $~lib/memory/__stack_pointer
      local.get $0
      i32.store offset=12
      local.get $0
      call $assembly/contracts/main/userSharesKey
      local.set $2
      global.get $~lib/memory/__stack_pointer
      local.get $2
      i32.store
      local.get $2
      call $assembly/contracts/main/sGetU64
      local.get $8
      i64.add
      local.tee $8
      local.get $5
      i64.gt_u
      if
       global.get $~lib/memory/__stack_pointer
       local.get $0
       local.tee $1
       i32.store offset=44
       br $for-break0
      end
      local.get $11
      i32.const 1
      i32.add
      local.set $11
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
    global.get $~lib/memory/__stack_pointer
    i32.const 5264
    i32.store offset=12
    local.get $5
    call $~lib/util/number/utoa64
    local.set $0
    global.get $~lib/memory/__stack_pointer
    local.get $0
    i32.store offset=16
    i32.const 5264
    local.get $0
    call $~lib/string/String#concat
    local.set $1
    br $folding-inner0
   end
   global.get $~lib/memory/__stack_pointer
   i32.const 2240
   i32.store
   i32.const 2240
   call $assembly/contracts/main/sGetU64
   local.set $5
   global.get $~lib/memory/__stack_pointer
   local.set $4
   global.get $~lib/memory/__stack_pointer
   local.get $9
   call $~lib/util/number/utoa64
   local.tee $3
   i32.store offset=52
   global.get $~lib/memory/__stack_pointer
   local.get $1
   i32.store offset=56
   global.get $~lib/memory/__stack_pointer
   local.get $10
   call $~lib/util/number/utoa64
   local.tee $2
   i32.store offset=60
   global.get $~lib/memory/__stack_pointer
   local.get $6
   call $~lib/util/number/utoa64
   local.tee $0
   i32.store offset=64
   global.get $~lib/memory/__stack_pointer
   i32.const 5360
   i32.store
   global.get $~lib/memory/__stack_pointer
   local.get $3
   i32.store offset=12
   i32.const 5360
   i32.const 0
   local.get $3
   call $~lib/staticarray/StaticArray<~lib/string/String>#__uset
   global.get $~lib/memory/__stack_pointer
   i32.const 5360
   i32.store
   global.get $~lib/memory/__stack_pointer
   local.get $1
   i32.store offset=12
   i32.const 5360
   i32.const 2
   local.get $1
   call $~lib/staticarray/StaticArray<~lib/string/String>#__uset
   global.get $~lib/memory/__stack_pointer
   i32.const 5360
   i32.store
   global.get $~lib/memory/__stack_pointer
   local.get $2
   i32.store offset=12
   i32.const 5360
   i32.const 4
   local.get $2
   call $~lib/staticarray/StaticArray<~lib/string/String>#__uset
   global.get $~lib/memory/__stack_pointer
   i32.const 5360
   i32.store
   global.get $~lib/memory/__stack_pointer
   local.get $0
   i32.store offset=12
   i32.const 5360
   i32.const 6
   local.get $0
   call $~lib/staticarray/StaticArray<~lib/string/String>#__uset
   global.get $~lib/memory/__stack_pointer
   i32.const 5360
   i32.store
   global.get $~lib/memory/__stack_pointer
   i32.const 2528
   i32.store offset=12
   local.get $4
   i32.const 5360
   call $~lib/staticarray/StaticArray<~lib/string/String>#join
   local.tee $2
   i32.store offset=68
   local.get $5
   i32.wrap_i64
   call $assembly/contracts/main/winnerKey
   local.set $0
   global.get $~lib/memory/__stack_pointer
   local.get $0
   i32.store
   global.get $~lib/memory/__stack_pointer
   local.get $2
   i32.store offset=12
   local.get $0
   local.get $2
   call $~lib/@massalabs/massa-as-sdk/assembly/std/storage/set<~lib/string/String>
   global.get $~lib/memory/__stack_pointer
   i32.const 2240
   i32.store
   i32.const 2240
   local.get $5
   i64.const 1
   i64.add
   call $assembly/contracts/main/sSetU64
   global.get $~lib/memory/__stack_pointer
   i32.const 2288
   i32.store
   i32.const 2288
   local.get $9
   call $assembly/contracts/main/sSetU64
   global.get $~lib/memory/__stack_pointer
   local.get $1
   i32.store offset=12
   local.get $1
   call $~lib/@massalabs/massa-as-sdk/assembly/std/address/Address#constructor
   local.set $0
   global.get $~lib/memory/__stack_pointer
   local.get $0
   i32.store
   local.get $0
   local.get $10
   call $~lib/@massalabs/massa-as-sdk/assembly/std/coins/transfer/transferCoins
   global.get $~lib/memory/__stack_pointer
   i32.const 1856
   i32.store
   i32.const 1856
   i64.const 0
   call $assembly/contracts/main/sSetU64
   global.get $~lib/memory/__stack_pointer
   local.get $9
   call $~lib/util/number/utoa64
   local.tee $3
   i32.store offset=72
   global.get $~lib/memory/__stack_pointer
   local.get $1
   i32.store offset=76
   global.get $~lib/memory/__stack_pointer
   local.get $10
   call $~lib/util/number/utoa64
   local.tee $2
   i32.store offset=80
   global.get $~lib/memory/__stack_pointer
   local.get $6
   call $~lib/util/number/utoa64
   local.tee $0
   i32.store offset=84
   global.get $~lib/memory/__stack_pointer
   i32.const 5488
   i32.store offset=12
   global.get $~lib/memory/__stack_pointer
   local.get $3
   i32.store offset=16
   i32.const 5488
   i32.const 1
   local.get $3
   call $~lib/staticarray/StaticArray<~lib/string/String>#__uset
   global.get $~lib/memory/__stack_pointer
   i32.const 5488
   i32.store offset=12
   global.get $~lib/memory/__stack_pointer
   local.get $1
   i32.store offset=16
   i32.const 5488
   i32.const 3
   local.get $1
   call $~lib/staticarray/StaticArray<~lib/string/String>#__uset
   global.get $~lib/memory/__stack_pointer
   i32.const 5488
   i32.store offset=12
   global.get $~lib/memory/__stack_pointer
   local.get $2
   i32.store offset=16
   i32.const 5488
   i32.const 5
   local.get $2
   call $~lib/staticarray/StaticArray<~lib/string/String>#__uset
   global.get $~lib/memory/__stack_pointer
   i32.const 5488
   i32.store offset=12
   global.get $~lib/memory/__stack_pointer
   local.get $0
   i32.store offset=16
   i32.const 5488
   i32.const 7
   local.get $0
   call $~lib/staticarray/StaticArray<~lib/string/String>#__uset
   global.get $~lib/memory/__stack_pointer
   i32.const 5488
   i32.store offset=12
   global.get $~lib/memory/__stack_pointer
   i32.const 2528
   i32.store offset=16
   i32.const 5488
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
  global.get $~lib/memory/__stack_pointer
  local.get $1
  i32.store
  local.get $1
  call $~lib/@massalabs/massa-as-sdk/assembly/std/utils/events/generateEvent
  global.get $~lib/memory/__stack_pointer
  i32.const 88
  i32.add
  global.set $~lib/memory/__stack_pointer
 )
 (func $assembly/contracts/main/tick
  (local $0 i32)
  (local $1 i64)
  (local $2 i64)
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
  i32.const 1904
  i32.store
  i32.const 1904
  call $assembly/contracts/main/sGetU64
  local.get $1
  i64.le_u
  if
   call $assembly/contracts/main/enhancedRunDraw
   global.get $~lib/memory/__stack_pointer
   i32.const 1968
   i32.store
   i32.const 1968
   call $assembly/contracts/main/sGetU64
   local.set $2
   global.get $~lib/memory/__stack_pointer
   i32.const 1904
   i32.store
   i32.const 1904
   local.get $1
   local.get $2
   i64.add
   local.tee $2
   call $assembly/contracts/main/sSetU64
   global.get $~lib/memory/__stack_pointer
   i32.const 5552
   i32.store offset=4
   local.get $2
   call $~lib/util/number/utoa64
   local.set $0
   global.get $~lib/memory/__stack_pointer
   local.get $0
   i32.store offset=8
   i32.const 5552
   local.get $0
   call $~lib/string/String#concat
   local.set $0
   global.get $~lib/memory/__stack_pointer
   local.get $0
   i32.store
   local.get $0
   call $~lib/@massalabs/massa-as-sdk/assembly/std/utils/events/generateEvent
  end
  global.get $~lib/memory/__stack_pointer
  i32.const 2016
  i32.store
  i32.const 2016
  call $assembly/contracts/main/sGetU64
  local.get $1
  i64.add
  call $assembly/contracts/main/scheduleTick
  global.get $~lib/memory/__stack_pointer
  i32.const 12
  i32.add
  global.set $~lib/memory/__stack_pointer
 )
 (func $~lib/string/String.UTF8.encode@varargs (param $0 i32) (result i32)
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
  local.get $0
 )
 (func $~lib/typedarray/Uint8Array#get:length (param $0 i32) (result i32)
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
  i32.load offset=8
  local.set $0
  global.get $~lib/memory/__stack_pointer
  i32.const 4
  i32.add
  global.set $~lib/memory/__stack_pointer
  local.get $0
 )
 (func $assembly/contracts/main/arrayBufferToStaticArrayU8 (param $0 i32) (result i32)
  (local $1 i32)
  (local $2 i32)
  (local $3 i32)
  (local $4 i32)
  (local $5 i32)
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
  local.set $5
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
   block $1of2
    block $outOfRange
     global.get $~argumentsLength
     i32.const 1
     i32.sub
     br_table $1of2 $1of2 $2of2 $outOfRange
    end
    unreachable
   end
   i32.const -1
   local.set $1
  end
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store
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
  local.tee $3
  i32.store
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store offset=4
  local.get $0
  call $~lib/staticarray/StaticArray<u8>#get:length
  local.set $2
  local.get $1
  local.tee $0
  i32.const 0
  i32.lt_s
  if
   local.get $0
   i32.const -1
   i32.eq
   if (result i32)
    local.get $2
   else
    i32.const 1456
    i32.const 6624
    i32.const 1869
    i32.const 7
    call $~lib/builtins/abort
    unreachable
   end
   local.set $0
  else
   local.get $0
   local.get $2
   i32.gt_s
   if
    i32.const 1456
    i32.const 6624
    i32.const 1874
    i32.const 7
    call $~lib/builtins/abort
    unreachable
   end
  end
  global.get $~lib/memory/__stack_pointer
  i32.const 12
  i32.const 17
  call $~lib/rt/itcms/__new
  local.tee $1
  i32.store offset=8
  local.get $1
  local.get $3
  i32.store
  local.get $1
  local.get $3
  i32.const 0
  call $~lib/rt/itcms/__link
  local.get $1
  local.get $0
  i32.store offset=8
  local.get $1
  local.get $3
  i32.store offset=4
  global.get $~lib/memory/__stack_pointer
  i32.const 12
  i32.add
  global.set $~lib/memory/__stack_pointer
  global.get $~lib/memory/__stack_pointer
  i32.const 4
  i32.add
  global.set $~lib/memory/__stack_pointer
  local.get $5
  local.get $1
  i32.store offset=4
  global.get $~lib/memory/__stack_pointer
  local.get $1
  i32.store
  global.get $~lib/memory/__stack_pointer
  local.get $1
  call $~lib/typedarray/Uint8Array#get:length
  call $~lib/staticarray/StaticArray<u8>#constructor
  local.tee $0
  i32.store offset=8
  loop $for-loop|0
   global.get $~lib/memory/__stack_pointer
   local.get $1
   i32.store
   local.get $1
   call $~lib/typedarray/Uint8Array#get:length
   local.get $4
   i32.gt_s
   if
    global.get $~lib/memory/__stack_pointer
    local.get $0
    i32.store
    global.get $~lib/memory/__stack_pointer
    local.get $1
    i32.store offset=12
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
    i32.load offset=4
    local.get $4
    i32.add
    i32.load8_u
    local.set $2
    global.get $~lib/memory/__stack_pointer
    i32.const 4
    i32.add
    global.set $~lib/memory/__stack_pointer
    local.get $0
    local.get $4
    i32.add
    local.get $2
    i32.store8
    local.get $4
    i32.const 1
    i32.add
    local.set $4
    br $for-loop|0
   end
  end
  global.get $~lib/memory/__stack_pointer
  i32.const 16
  i32.add
  global.set $~lib/memory/__stack_pointer
  local.get $0
 )
 (func $assembly/contracts/main/getVaultStats (result i32)
  (local $0 i32)
  (local $1 i32)
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
  (local $12 i32)
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
  local.set $8
  global.get $~lib/memory/__stack_pointer
  i32.const 1792
  i32.store
  global.get $~lib/memory/__stack_pointer
  i32.const 1792
  call $assembly/contracts/main/sGetU64
  call $~lib/util/number/utoa64
  local.tee $9
  i32.store offset=4
  global.get $~lib/memory/__stack_pointer
  i32.const 1744
  i32.store
  global.get $~lib/memory/__stack_pointer
  i32.const 1744
  call $assembly/contracts/main/sGetU64
  call $~lib/util/number/utoa64
  local.tee $10
  i32.store offset=8
  global.get $~lib/memory/__stack_pointer
  i32.const 1856
  i32.store
  global.get $~lib/memory/__stack_pointer
  i32.const 1856
  call $assembly/contracts/main/sGetU64
  call $~lib/util/number/utoa64
  local.tee $0
  i32.store offset=12
  global.get $~lib/memory/__stack_pointer
  i32.const 2064
  i32.store
  global.get $~lib/memory/__stack_pointer
  i32.const 2064
  call $assembly/contracts/main/sGetU64
  call $~lib/util/number/utoa64
  local.tee $1
  i32.store offset=16
  global.get $~lib/memory/__stack_pointer
  i32.const 1904
  i32.store
  global.get $~lib/memory/__stack_pointer
  i32.const 1904
  call $assembly/contracts/main/sGetU64
  call $~lib/util/number/utoa64
  local.tee $2
  i32.store offset=20
  global.get $~lib/memory/__stack_pointer
  i32.const 1968
  i32.store
  global.get $~lib/memory/__stack_pointer
  i32.const 1968
  call $assembly/contracts/main/sGetU64
  call $~lib/util/number/utoa64
  local.tee $3
  i32.store offset=24
  global.get $~lib/memory/__stack_pointer
  i32.const 2016
  i32.store
  global.get $~lib/memory/__stack_pointer
  i32.const 2016
  call $assembly/contracts/main/sGetU64
  call $~lib/util/number/utoa64
  local.tee $4
  i32.store offset=28
  global.get $~lib/memory/__stack_pointer
  i32.const 2176
  i32.store
  global.get $~lib/memory/__stack_pointer
  i32.const 2176
  call $assembly/contracts/main/sGetU64
  call $~lib/util/number/utoa64
  local.tee $5
  i32.store offset=32
  global.get $~lib/memory/__stack_pointer
  i32.const 2240
  i32.store
  global.get $~lib/memory/__stack_pointer
  i32.const 2240
  call $assembly/contracts/main/sGetU64
  call $~lib/util/number/utoa64
  local.tee $6
  i32.store offset=36
  global.get $~lib/memory/__stack_pointer
  i32.const 2288
  i32.store
  global.get $~lib/memory/__stack_pointer
  i32.const 2288
  call $assembly/contracts/main/sGetU64
  call $~lib/util/number/utoa64
  local.tee $7
  i32.store offset=40
  global.get $~lib/memory/__stack_pointer
  local.set $11
  global.get $~lib/memory/__stack_pointer
  i32.const 2352
  i32.store
  global.get $~lib/memory/__stack_pointer
  i32.const 2352
  call $~lib/@massalabs/massa-as-sdk/assembly/std/storage/get<~lib/string/String>
  local.tee $12
  i32.store offset=44
  local.get $11
  local.get $12
  i32.const 3824
  local.get $12
  select
  local.tee $11
  i32.store offset=48
  global.get $~lib/memory/__stack_pointer
  i32.const 2416
  i32.store
  global.get $~lib/memory/__stack_pointer
  i32.const 2416
  call $assembly/contracts/main/sGetU64
  call $~lib/util/number/utoa64
  local.tee $12
  i32.store offset=52
  global.get $~lib/memory/__stack_pointer
  i32.const 6496
  i32.store
  global.get $~lib/memory/__stack_pointer
  local.get $9
  i32.store offset=56
  i32.const 6496
  i32.const 1
  local.get $9
  call $~lib/staticarray/StaticArray<~lib/string/String>#__uset
  global.get $~lib/memory/__stack_pointer
  i32.const 6496
  i32.store
  global.get $~lib/memory/__stack_pointer
  local.get $10
  i32.store offset=56
  i32.const 6496
  i32.const 3
  local.get $10
  call $~lib/staticarray/StaticArray<~lib/string/String>#__uset
  global.get $~lib/memory/__stack_pointer
  i32.const 6496
  i32.store
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store offset=56
  i32.const 6496
  i32.const 5
  local.get $0
  call $~lib/staticarray/StaticArray<~lib/string/String>#__uset
  global.get $~lib/memory/__stack_pointer
  i32.const 6496
  i32.store
  global.get $~lib/memory/__stack_pointer
  local.get $1
  i32.store offset=56
  i32.const 6496
  i32.const 7
  local.get $1
  call $~lib/staticarray/StaticArray<~lib/string/String>#__uset
  global.get $~lib/memory/__stack_pointer
  i32.const 6496
  i32.store
  global.get $~lib/memory/__stack_pointer
  local.get $2
  i32.store offset=56
  i32.const 6496
  i32.const 9
  local.get $2
  call $~lib/staticarray/StaticArray<~lib/string/String>#__uset
  global.get $~lib/memory/__stack_pointer
  i32.const 6496
  i32.store
  global.get $~lib/memory/__stack_pointer
  local.get $3
  i32.store offset=56
  i32.const 6496
  i32.const 11
  local.get $3
  call $~lib/staticarray/StaticArray<~lib/string/String>#__uset
  global.get $~lib/memory/__stack_pointer
  i32.const 6496
  i32.store
  global.get $~lib/memory/__stack_pointer
  local.get $4
  i32.store offset=56
  i32.const 6496
  i32.const 13
  local.get $4
  call $~lib/staticarray/StaticArray<~lib/string/String>#__uset
  global.get $~lib/memory/__stack_pointer
  i32.const 6496
  i32.store
  global.get $~lib/memory/__stack_pointer
  local.get $5
  i32.store offset=56
  i32.const 6496
  i32.const 15
  local.get $5
  call $~lib/staticarray/StaticArray<~lib/string/String>#__uset
  global.get $~lib/memory/__stack_pointer
  i32.const 6496
  i32.store
  global.get $~lib/memory/__stack_pointer
  local.get $6
  i32.store offset=56
  i32.const 6496
  i32.const 17
  local.get $6
  call $~lib/staticarray/StaticArray<~lib/string/String>#__uset
  global.get $~lib/memory/__stack_pointer
  i32.const 6496
  i32.store
  global.get $~lib/memory/__stack_pointer
  local.get $7
  i32.store offset=56
  i32.const 6496
  i32.const 19
  local.get $7
  call $~lib/staticarray/StaticArray<~lib/string/String>#__uset
  global.get $~lib/memory/__stack_pointer
  i32.const 6496
  i32.store
  global.get $~lib/memory/__stack_pointer
  local.get $11
  i32.store offset=56
  i32.const 6496
  i32.const 21
  local.get $11
  call $~lib/staticarray/StaticArray<~lib/string/String>#__uset
  global.get $~lib/memory/__stack_pointer
  i32.const 6496
  i32.store
  global.get $~lib/memory/__stack_pointer
  local.get $12
  i32.store offset=56
  i32.const 6496
  i32.const 23
  local.get $12
  call $~lib/staticarray/StaticArray<~lib/string/String>#__uset
  global.get $~lib/memory/__stack_pointer
  i32.const 6496
  i32.store
  global.get $~lib/memory/__stack_pointer
  i32.const 2528
  i32.store offset=56
  local.get $8
  i32.const 6496
  call $~lib/staticarray/StaticArray<~lib/string/String>#join
  local.tee $0
  i32.store offset=60
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store offset=56
  i32.const 1
  global.set $~argumentsLength
  local.get $0
  call $~lib/string/String.UTF8.encode@varargs
  local.set $0
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store
  local.get $0
  call $assembly/contracts/main/arrayBufferToStaticArrayU8
  local.set $0
  global.get $~lib/memory/__stack_pointer
  i32.const -64
  i32.sub
  global.set $~lib/memory/__stack_pointer
  local.get $0
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
    i32.const 6688
    i32.store
    i32.const 0
    i32.const 6688
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
      i32.const 2528
      i32.store
      global.get $~lib/memory/__stack_pointer
      i32.const 6832
      i32.store offset=16
      i32.const 2528
      i32.const 6832
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
    i32.const 3088
    i32.const 3216
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
  i32.const 3216
  i32.const 70
  i32.const 7
  call $~lib/builtins/abort
  unreachable
 )
 (func $assembly/contracts/main/getUserPosition (param $0 i32) (result i32)
  (local $1 i32)
  (local $2 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 72
  i32.sub
  global.set $~lib/memory/__stack_pointer
  call $~stack_check
  global.get $~lib/memory/__stack_pointer
  i32.const 0
  i32.const 72
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
  i32.const 6976
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
   i32.const 6976
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
    i32.const 3088
    i32.const 3216
    i32.const 52
    i32.const 32
    call $~lib/builtins/abort
    unreachable
   end
   local.get $1
   local.get $0
   i32.store offset=36
   global.get $~lib/memory/__stack_pointer
   i32.const 7008
   i32.store
   global.get $~lib/memory/__stack_pointer
   i32.const 6976
   i32.store offset=24
   i32.const 7008
   i32.const 0
   i32.const 6976
   call $~lib/staticarray/StaticArray<~lib/string/String>#__uset
   global.get $~lib/memory/__stack_pointer
   i32.const 7008
   i32.store
   global.get $~lib/memory/__stack_pointer
   local.get $0
   i32.store offset=24
   i32.const 7008
   i32.const 2
   local.get $0
   call $~lib/staticarray/StaticArray<~lib/string/String>#__uset
   global.get $~lib/memory/__stack_pointer
   i32.const 7008
   i32.store
   global.get $~lib/memory/__stack_pointer
   i32.const 2528
   i32.store offset=24
   i32.const 7008
   call $~lib/staticarray/StaticArray<~lib/string/String>#join
   i32.const 3216
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
  call $assembly/contracts/main/userSharesKey
  local.set $2
  global.get $~lib/memory/__stack_pointer
  local.get $2
  i32.store
  local.get $1
  local.get $2
  call $assembly/contracts/main/sGetU64
  call $~lib/util/number/utoa64
  local.tee $1
  i32.store offset=48
  global.get $~lib/memory/__stack_pointer
  local.set $2
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store offset=24
  local.get $0
  call $assembly/contracts/main/userPrincipalKey
  local.set $0
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store
  local.get $2
  local.get $0
  call $assembly/contracts/main/sGetU64
  call $~lib/util/number/utoa64
  local.tee $0
  i32.store offset=52
  global.get $~lib/memory/__stack_pointer
  local.set $2
  global.get $~lib/memory/__stack_pointer
  local.get $1
  i32.store offset=56
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store offset=60
  global.get $~lib/memory/__stack_pointer
  local.get $1
  i32.store offset=64
  global.get $~lib/memory/__stack_pointer
  i32.const 7248
  i32.store
  global.get $~lib/memory/__stack_pointer
  local.get $1
  i32.store offset=24
  i32.const 7248
  i32.const 1
  local.get $1
  call $~lib/staticarray/StaticArray<~lib/string/String>#__uset
  global.get $~lib/memory/__stack_pointer
  i32.const 7248
  i32.store
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store offset=24
  i32.const 7248
  i32.const 3
  local.get $0
  call $~lib/staticarray/StaticArray<~lib/string/String>#__uset
  global.get $~lib/memory/__stack_pointer
  i32.const 7248
  i32.store
  global.get $~lib/memory/__stack_pointer
  local.get $1
  i32.store offset=24
  i32.const 7248
  i32.const 5
  local.get $1
  call $~lib/staticarray/StaticArray<~lib/string/String>#__uset
  global.get $~lib/memory/__stack_pointer
  i32.const 7248
  i32.store
  global.get $~lib/memory/__stack_pointer
  i32.const 2528
  i32.store offset=24
  local.get $2
  i32.const 7248
  call $~lib/staticarray/StaticArray<~lib/string/String>#join
  local.tee $0
  i32.store offset=68
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store offset=24
  i32.const 1
  global.set $~argumentsLength
  local.get $0
  call $~lib/string/String.UTF8.encode@varargs
  local.set $0
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store
  local.get $0
  call $assembly/contracts/main/arrayBufferToStaticArrayU8
  local.set $0
  global.get $~lib/memory/__stack_pointer
  i32.const 72
  i32.add
  global.set $~lib/memory/__stack_pointer
  local.get $0
 )
 (func $assembly/contracts/main/getWinners (param $0 i32) (result i32)
  (local $1 i32)
  (local $2 i32)
  (local $3 i64)
  (local $4 i64)
  (local $5 i64)
  (local $6 i32)
  (local $7 i32)
  (local $8 i32)
  (local $9 i32)
  (local $10 i32)
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
  local.tee $2
  i32.store offset=8
  global.get $~lib/memory/__stack_pointer
  i32.const 7296
  i32.store offset=12
  global.get $~lib/memory/__stack_pointer
  local.get $2
  i32.store offset=16
  global.get $~lib/memory/__stack_pointer
  local.get $2
  i32.store offset=20
  global.get $~lib/memory/__stack_pointer
  local.get $2
  i32.store offset=24
  global.get $~lib/memory/__stack_pointer
  local.get $2
  i32.load offset=8
  local.tee $6
  i32.store
  block $folding-inner1
   block $folding-inner0
    local.get $6
    call $~lib/string/String.__not
    i32.eqz
    if
     global.get $~lib/memory/__stack_pointer
     i32.const 7296
     i32.store offset=28
     global.get $~lib/memory/__stack_pointer
     local.get $2
     i32.store
     global.get $~lib/memory/__stack_pointer
     local.get $2
     i32.load offset=8
     local.tee $1
     i32.store offset=32
     local.get $1
     i32.eqz
     br_if $folding-inner0
     global.get $~lib/memory/__stack_pointer
     local.get $1
     i32.store offset=36
     global.get $~lib/memory/__stack_pointer
     i32.const 7344
     i32.store
     global.get $~lib/memory/__stack_pointer
     i32.const 7296
     i32.store offset=24
     i32.const 7344
     i32.const 0
     i32.const 7296
     call $~lib/staticarray/StaticArray<~lib/string/String>#__uset
     i32.const 7344
     local.set $0
     global.get $~lib/memory/__stack_pointer
     i32.const 7344
     i32.store
     global.get $~lib/memory/__stack_pointer
     local.get $1
     i32.store offset=24
     i32.const 7344
     i32.const 2
     local.get $1
     call $~lib/staticarray/StaticArray<~lib/string/String>#__uset
     global.get $~lib/memory/__stack_pointer
     i32.const 7344
     i32.store
     br $folding-inner1
    end
    global.get $~lib/memory/__stack_pointer
    local.get $2
    i32.store offset=40
    global.get $~lib/memory/__stack_pointer
    local.get $2
    i32.store
    local.get $2
    i64.load
    local.set $3
    global.get $~lib/memory/__stack_pointer
    local.get $0
    i32.store
    global.get $~lib/memory/__stack_pointer
    local.get $0
    call $~lib/@massalabs/as-types/assembly/argument/Args#nextU64
    local.tee $0
    i32.store offset=44
    global.get $~lib/memory/__stack_pointer
    i32.const 7376
    i32.store offset=48
    global.get $~lib/memory/__stack_pointer
    local.get $0
    i32.store offset=52
    global.get $~lib/memory/__stack_pointer
    local.get $0
    i32.store offset=56
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
     i32.const 7376
     i32.store offset=60
     global.get $~lib/memory/__stack_pointer
     local.get $0
     i32.store
     global.get $~lib/memory/__stack_pointer
     local.get $0
     i32.load offset=8
     local.tee $1
     i32.store offset=64
     local.get $1
     i32.eqz
     br_if $folding-inner0
     global.get $~lib/memory/__stack_pointer
     local.get $1
     i32.store offset=68
     global.get $~lib/memory/__stack_pointer
     i32.const 7408
     i32.store
     global.get $~lib/memory/__stack_pointer
     i32.const 7376
     i32.store offset=24
     i32.const 7408
     i32.const 0
     i32.const 7376
     call $~lib/staticarray/StaticArray<~lib/string/String>#__uset
     i32.const 7408
     local.set $0
     global.get $~lib/memory/__stack_pointer
     i32.const 7408
     i32.store
     global.get $~lib/memory/__stack_pointer
     local.get $1
     i32.store offset=24
     i32.const 7408
     i32.const 2
     local.get $1
     call $~lib/staticarray/StaticArray<~lib/string/String>#__uset
     global.get $~lib/memory/__stack_pointer
     i32.const 7408
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
    local.set $4
    global.get $~lib/memory/__stack_pointer
    i32.const 2240
    i32.store
    i32.const 2240
    call $assembly/contracts/main/sGetU64
    local.set $5
    i32.const 7440
    local.set $0
    global.get $~lib/memory/__stack_pointer
    i32.const 7440
    i32.store offset=76
    local.get $3
    i32.wrap_i64
    local.set $2
    loop $for-loop|0
     local.get $2
     local.get $5
     i32.wrap_i64
     i32.lt_s
     local.get $1
     i64.extend_i32_s
     local.get $4
     i64.lt_u
     i32.and
     if
      local.get $1
      i32.const 0
      i32.gt_s
      if
       global.get $~lib/memory/__stack_pointer
       local.get $0
       i32.store
       global.get $~lib/memory/__stack_pointer
       i32.const 2560
       i32.store offset=24
       global.get $~lib/memory/__stack_pointer
       local.get $0
       i32.const 2560
       call $~lib/string/String.__concat
       local.tee $0
       i32.store offset=76
      end
      global.get $~lib/memory/__stack_pointer
      local.set $6
      global.get $~lib/memory/__stack_pointer
      local.set $7
      local.get $2
      call $assembly/contracts/main/winnerKey
      local.set $8
      global.get $~lib/memory/__stack_pointer
      local.get $8
      i32.store
      local.get $7
      local.get $8
      call $~lib/@massalabs/massa-as-sdk/assembly/std/storage/get<~lib/string/String>
      local.tee $7
      i32.store offset=80
      local.get $6
      local.get $7
      i32.const 2528
      local.get $7
      select
      local.tee $6
      i32.store offset=84
      global.get $~lib/memory/__stack_pointer
      local.get $6
      i32.store
      global.get $~lib/memory/__stack_pointer
      i32.const 3984
      i32.store offset=24
      i32.const 1
      global.set $~argumentsLength
      global.get $~lib/memory/__stack_pointer
      local.get $6
      i32.const 3984
      call $~lib/string/String#split@varargs
      local.tee $8
      i32.store offset=88
      global.get $~lib/memory/__stack_pointer
      local.get $8
      i32.store
      local.get $8
      call $~lib/array/Array<~lib/@massalabs/massa-as-sdk/assembly/std/address/Address>#get:length
      i32.const 4
      i32.ge_s
      if
       global.get $~lib/memory/__stack_pointer
       local.get $0
       i32.store
       global.get $~lib/memory/__stack_pointer
       local.set $9
       global.get $~lib/memory/__stack_pointer
       local.get $8
       i32.store offset=92
       global.get $~lib/memory/__stack_pointer
       local.get $8
       i32.const 0
       call $~lib/array/Array<~lib/@massalabs/massa-as-sdk/assembly/std/address/Address>#__get
       local.tee $6
       i32.store offset=96
       global.get $~lib/memory/__stack_pointer
       local.get $8
       i32.store offset=92
       global.get $~lib/memory/__stack_pointer
       local.get $8
       i32.const 1
       call $~lib/array/Array<~lib/@massalabs/massa-as-sdk/assembly/std/address/Address>#__get
       local.tee $7
       i32.store offset=100
       global.get $~lib/memory/__stack_pointer
       local.get $8
       i32.store offset=92
       global.get $~lib/memory/__stack_pointer
       local.get $8
       i32.const 2
       call $~lib/array/Array<~lib/@massalabs/massa-as-sdk/assembly/std/address/Address>#__get
       local.tee $10
       i32.store offset=104
       global.get $~lib/memory/__stack_pointer
       local.get $8
       i32.store offset=92
       global.get $~lib/memory/__stack_pointer
       local.get $8
       i32.const 3
       call $~lib/array/Array<~lib/@massalabs/massa-as-sdk/assembly/std/address/Address>#__get
       local.tee $8
       i32.store offset=108
       global.get $~lib/memory/__stack_pointer
       i32.const 7664
       i32.store offset=92
       global.get $~lib/memory/__stack_pointer
       local.get $6
       i32.store offset=112
       i32.const 7664
       i32.const 1
       local.get $6
       call $~lib/staticarray/StaticArray<~lib/string/String>#__uset
       global.get $~lib/memory/__stack_pointer
       i32.const 7664
       i32.store offset=92
       global.get $~lib/memory/__stack_pointer
       local.get $7
       i32.store offset=112
       i32.const 7664
       i32.const 3
       local.get $7
       call $~lib/staticarray/StaticArray<~lib/string/String>#__uset
       global.get $~lib/memory/__stack_pointer
       i32.const 7664
       i32.store offset=92
       global.get $~lib/memory/__stack_pointer
       local.get $10
       i32.store offset=112
       i32.const 7664
       i32.const 5
       local.get $10
       call $~lib/staticarray/StaticArray<~lib/string/String>#__uset
       global.get $~lib/memory/__stack_pointer
       i32.const 7664
       i32.store offset=92
       global.get $~lib/memory/__stack_pointer
       local.get $8
       i32.store offset=112
       i32.const 7664
       i32.const 7
       local.get $8
       call $~lib/staticarray/StaticArray<~lib/string/String>#__uset
       global.get $~lib/memory/__stack_pointer
       i32.const 7664
       i32.store offset=92
       global.get $~lib/memory/__stack_pointer
       i32.const 2528
       i32.store offset=112
       i32.const 7664
       call $~lib/staticarray/StaticArray<~lib/string/String>#join
       local.set $6
       global.get $~lib/memory/__stack_pointer
       local.get $6
       i32.store offset=24
       local.get $9
       local.get $0
       local.get $6
       call $~lib/string/String.__concat
       local.tee $0
       i32.store offset=76
       local.get $1
       i32.const 1
       i32.add
       local.set $1
      end
      local.get $2
      i32.const 1
      i32.add
      local.set $2
      br $for-loop|0
     end
    end
    global.get $~lib/memory/__stack_pointer
    local.get $0
    i32.store
    global.get $~lib/memory/__stack_pointer
    i32.const 7728
    i32.store offset=24
    global.get $~lib/memory/__stack_pointer
    local.get $0
    i32.const 7728
    call $~lib/string/String.__concat
    local.tee $0
    i32.store offset=76
    global.get $~lib/memory/__stack_pointer
    local.get $0
    i32.store offset=24
    i32.const 1
    global.set $~argumentsLength
    local.get $0
    call $~lib/string/String.UTF8.encode@varargs
    local.set $0
    global.get $~lib/memory/__stack_pointer
    local.get $0
    i32.store
    local.get $0
    call $assembly/contracts/main/arrayBufferToStaticArrayU8
    local.set $0
    global.get $~lib/memory/__stack_pointer
    i32.const 116
    i32.add
    global.set $~lib/memory/__stack_pointer
    local.get $0
    return
   end
   i32.const 3088
   i32.const 3216
   i32.const 52
   i32.const 32
   call $~lib/builtins/abort
   unreachable
  end
  global.get $~lib/memory/__stack_pointer
  i32.const 2528
  i32.store offset=24
  local.get $0
  call $~lib/staticarray/StaticArray<~lib/string/String>#join
  i32.const 3216
  i32.const 52
  i32.const 7
  call $~lib/builtins/abort
  unreachable
 )
 (func $assembly/contracts/main/proposalKey (param $0 i32) (result i32)
  local.get $0
  i32.const 8128
  call $byn$mgfn-shared$assembly/contracts/main/participantKey
 )
 (func $assembly/contracts/main/createProposal (param $0 i32)
  (local $1 i64)
  (local $2 i64)
  (local $3 i32)
  (local $4 i32)
  (local $5 i32)
  (local $6 i64)
  (local $7 i64)
  (local $8 i32)
  (local $9 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 128
  i32.sub
  global.set $~lib/memory/__stack_pointer
  call $~stack_check
  global.get $~lib/memory/__stack_pointer
  i32.const 0
  i32.const 128
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
  local.tee $4
  i32.store offset=8
  global.get $~lib/memory/__stack_pointer
  i32.const 7760
  i32.store offset=12
  global.get $~lib/memory/__stack_pointer
  local.get $4
  i32.store offset=16
  global.get $~lib/memory/__stack_pointer
  local.get $4
  i32.store offset=20
  global.get $~lib/memory/__stack_pointer
  local.get $4
  i32.store offset=24
  global.get $~lib/memory/__stack_pointer
  local.get $4
  i32.load offset=4
  local.tee $5
  i32.store
  block $folding-inner1
   block $folding-inner0
    local.get $5
    call $~lib/string/String.__not
    i32.eqz
    if
     global.get $~lib/memory/__stack_pointer
     i32.const 7760
     i32.store offset=28
     global.get $~lib/memory/__stack_pointer
     local.get $4
     i32.store
     global.get $~lib/memory/__stack_pointer
     local.get $4
     i32.load offset=4
     local.tee $3
     i32.store offset=32
     local.get $3
     i32.eqz
     br_if $folding-inner0
     global.get $~lib/memory/__stack_pointer
     local.get $3
     i32.store offset=36
     global.get $~lib/memory/__stack_pointer
     i32.const 7808
     i32.store
     global.get $~lib/memory/__stack_pointer
     i32.const 7760
     i32.store offset=24
     i32.const 7808
     i32.const 0
     i32.const 7760
     call $~lib/staticarray/StaticArray<~lib/string/String>#__uset
     i32.const 7808
     local.set $0
     global.get $~lib/memory/__stack_pointer
     i32.const 7808
     i32.store
     global.get $~lib/memory/__stack_pointer
     local.get $3
     i32.store offset=24
     i32.const 7808
     i32.const 2
     local.get $3
     call $~lib/staticarray/StaticArray<~lib/string/String>#__uset
     global.get $~lib/memory/__stack_pointer
     i32.const 7808
     i32.store
     br $folding-inner1
    end
    global.get $~lib/memory/__stack_pointer
    local.get $4
    i32.store offset=40
    global.get $~lib/memory/__stack_pointer
    local.get $4
    i32.store
    local.get $3
    local.get $4
    i32.load
    local.tee $4
    i32.store offset=44
    global.get $~lib/memory/__stack_pointer
    local.get $0
    i32.store
    global.get $~lib/memory/__stack_pointer
    local.get $0
    call $~lib/@massalabs/as-types/assembly/argument/Args#nextU64
    local.tee $0
    i32.store offset=48
    global.get $~lib/memory/__stack_pointer
    i32.const 7840
    i32.store offset=52
    global.get $~lib/memory/__stack_pointer
    local.get $0
    i32.store offset=56
    global.get $~lib/memory/__stack_pointer
    local.get $0
    i32.store offset=60
    global.get $~lib/memory/__stack_pointer
    local.get $0
    i32.store offset=24
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
     i32.const 7840
     i32.store offset=64
     global.get $~lib/memory/__stack_pointer
     local.get $0
     i32.store
     global.get $~lib/memory/__stack_pointer
     local.get $0
     i32.load offset=8
     local.tee $3
     i32.store offset=68
     local.get $3
     i32.eqz
     br_if $folding-inner0
     global.get $~lib/memory/__stack_pointer
     local.get $3
     i32.store offset=72
     global.get $~lib/memory/__stack_pointer
     i32.const 7888
     i32.store
     global.get $~lib/memory/__stack_pointer
     i32.const 7840
     i32.store offset=24
     i32.const 7888
     i32.const 0
     i32.const 7840
     call $~lib/staticarray/StaticArray<~lib/string/String>#__uset
     i32.const 7888
     local.set $0
     global.get $~lib/memory/__stack_pointer
     i32.const 7888
     i32.store
     global.get $~lib/memory/__stack_pointer
     local.get $3
     i32.store offset=24
     i32.const 7888
     i32.const 2
     local.get $3
     call $~lib/staticarray/StaticArray<~lib/string/String>#__uset
     global.get $~lib/memory/__stack_pointer
     i32.const 7888
     i32.store
     br $folding-inner1
    end
    global.get $~lib/memory/__stack_pointer
    local.get $0
    i32.store offset=76
    global.get $~lib/memory/__stack_pointer
    local.get $0
    i32.store
    local.get $0
    i64.load
    local.set $1
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
    local.tee $5
    i32.store offset=80
    global.get $~lib/memory/__stack_pointer
    local.get $5
    i32.store offset=24
    local.get $5
    call $assembly/contracts/main/userSharesKey
    local.set $0
    global.get $~lib/memory/__stack_pointer
    local.get $0
    i32.store
    local.get $0
    call $assembly/contracts/main/sGetU64
    local.set $2
    global.get $~lib/memory/__stack_pointer
    i32.const 1744
    i32.store
    i32.const 1744
    call $assembly/contracts/main/sGetU64
    local.set $6
    local.get $2
    i64.eqz
    if
     i32.const 7920
     i32.const 2800
     i32.const 364
     i32.const 3
     call $~lib/builtins/abort
     unreachable
    end
    local.get $6
    i64.const 100
    i64.div_u
    local.get $2
    i64.gt_u
    if
     i32.const 7968
     i32.const 2800
     i32.const 365
     i32.const 3
     call $~lib/builtins/abort
     unreachable
    end
    global.get $~lib/memory/__stack_pointer
    i32.const 2416
    i32.store
    i32.const 2416
    call $assembly/contracts/main/sGetU64
    local.set $6
    call $~lib/@massalabs/massa-as-sdk/assembly/env/env/env.currentPeriod
    local.set $2
    global.get $~lib/memory/__stack_pointer
    i32.const 2464
    i32.store
    i32.const 2464
    call $assembly/contracts/main/sGetU64
    local.get $2
    i64.add
    local.set $7
    global.get $~lib/memory/__stack_pointer
    local.set $8
    global.get $~lib/memory/__stack_pointer
    local.get $4
    i32.store offset=84
    global.get $~lib/memory/__stack_pointer
    local.get $1
    call $~lib/util/number/utoa64
    local.tee $0
    i32.store offset=88
    global.get $~lib/memory/__stack_pointer
    local.get $5
    i32.store offset=92
    global.get $~lib/memory/__stack_pointer
    local.get $2
    call $~lib/util/number/utoa64
    local.tee $3
    i32.store offset=96
    global.get $~lib/memory/__stack_pointer
    local.get $7
    call $~lib/util/number/utoa64
    local.tee $9
    i32.store offset=100
    global.get $~lib/memory/__stack_pointer
    i32.const 8064
    i32.store
    global.get $~lib/memory/__stack_pointer
    local.get $4
    i32.store offset=24
    i32.const 8064
    i32.const 0
    local.get $4
    call $~lib/staticarray/StaticArray<~lib/string/String>#__uset
    global.get $~lib/memory/__stack_pointer
    i32.const 8064
    i32.store
    global.get $~lib/memory/__stack_pointer
    local.get $0
    i32.store offset=24
    i32.const 8064
    i32.const 2
    local.get $0
    call $~lib/staticarray/StaticArray<~lib/string/String>#__uset
    global.get $~lib/memory/__stack_pointer
    i32.const 8064
    i32.store
    global.get $~lib/memory/__stack_pointer
    local.get $5
    i32.store offset=24
    i32.const 8064
    i32.const 4
    local.get $5
    call $~lib/staticarray/StaticArray<~lib/string/String>#__uset
    global.get $~lib/memory/__stack_pointer
    i32.const 8064
    i32.store
    global.get $~lib/memory/__stack_pointer
    local.get $3
    i32.store offset=24
    i32.const 8064
    i32.const 6
    local.get $3
    call $~lib/staticarray/StaticArray<~lib/string/String>#__uset
    global.get $~lib/memory/__stack_pointer
    i32.const 8064
    i32.store
    global.get $~lib/memory/__stack_pointer
    local.get $9
    i32.store offset=24
    i32.const 8064
    i32.const 8
    local.get $9
    call $~lib/staticarray/StaticArray<~lib/string/String>#__uset
    global.get $~lib/memory/__stack_pointer
    i32.const 8064
    i32.store
    global.get $~lib/memory/__stack_pointer
    i32.const 2528
    i32.store offset=24
    local.get $8
    i32.const 8064
    call $~lib/staticarray/StaticArray<~lib/string/String>#join
    local.tee $0
    i32.store offset=104
    local.get $6
    i32.wrap_i64
    call $assembly/contracts/main/proposalKey
    local.set $3
    global.get $~lib/memory/__stack_pointer
    local.get $3
    i32.store
    global.get $~lib/memory/__stack_pointer
    local.get $0
    i32.store offset=24
    local.get $3
    local.get $0
    call $~lib/@massalabs/massa-as-sdk/assembly/std/storage/set<~lib/string/String>
    global.get $~lib/memory/__stack_pointer
    i32.const 2416
    i32.store
    i32.const 2416
    local.get $6
    i64.const 1
    i64.add
    call $assembly/contracts/main/sSetU64
    global.get $~lib/memory/__stack_pointer
    local.get $6
    call $~lib/util/number/utoa64
    local.tee $0
    i32.store offset=108
    global.get $~lib/memory/__stack_pointer
    local.get $4
    i32.store offset=112
    global.get $~lib/memory/__stack_pointer
    local.get $1
    call $~lib/util/number/utoa64
    local.tee $3
    i32.store offset=116
    global.get $~lib/memory/__stack_pointer
    local.get $5
    i32.store offset=120
    global.get $~lib/memory/__stack_pointer
    i32.const 8240
    i32.store offset=24
    global.get $~lib/memory/__stack_pointer
    local.get $0
    i32.store offset=124
    i32.const 8240
    i32.const 1
    local.get $0
    call $~lib/staticarray/StaticArray<~lib/string/String>#__uset
    global.get $~lib/memory/__stack_pointer
    i32.const 8240
    i32.store offset=24
    global.get $~lib/memory/__stack_pointer
    local.get $4
    i32.store offset=124
    i32.const 8240
    i32.const 3
    local.get $4
    call $~lib/staticarray/StaticArray<~lib/string/String>#__uset
    global.get $~lib/memory/__stack_pointer
    i32.const 8240
    i32.store offset=24
    global.get $~lib/memory/__stack_pointer
    local.get $3
    i32.store offset=124
    i32.const 8240
    i32.const 5
    local.get $3
    call $~lib/staticarray/StaticArray<~lib/string/String>#__uset
    global.get $~lib/memory/__stack_pointer
    i32.const 8240
    i32.store offset=24
    global.get $~lib/memory/__stack_pointer
    local.get $5
    i32.store offset=124
    i32.const 8240
    i32.const 7
    local.get $5
    call $~lib/staticarray/StaticArray<~lib/string/String>#__uset
    global.get $~lib/memory/__stack_pointer
    i32.const 8240
    i32.store offset=24
    global.get $~lib/memory/__stack_pointer
    i32.const 2528
    i32.store offset=124
    i32.const 8240
    call $~lib/staticarray/StaticArray<~lib/string/String>#join
    local.set $0
    global.get $~lib/memory/__stack_pointer
    local.get $0
    i32.store
    local.get $0
    call $~lib/@massalabs/massa-as-sdk/assembly/std/utils/events/generateEvent
    global.get $~lib/memory/__stack_pointer
    i32.const 128
    i32.add
    global.set $~lib/memory/__stack_pointer
    return
   end
   i32.const 3088
   i32.const 3216
   i32.const 52
   i32.const 32
   call $~lib/builtins/abort
   unreachable
  end
  global.get $~lib/memory/__stack_pointer
  i32.const 2528
  i32.store offset=24
  local.get $0
  call $~lib/staticarray/StaticArray<~lib/string/String>#join
  i32.const 3216
  i32.const 52
  i32.const 7
  call $~lib/builtins/abort
  unreachable
 )
 (func $~lib/@massalabs/as-types/assembly/result/Result<bool>#constructor (param $0 i32) (param $1 i32) (result i32)
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
  i32.const 20
  call $~lib/rt/itcms/__new
  local.tee $2
  i32.store
  global.get $~lib/memory/__stack_pointer
  local.get $2
  i32.store offset=4
  local.get $2
  local.get $0
  i32.store8
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
 (func $~lib/@massalabs/as-types/assembly/argument/Args#nextBool (param $0 i32) (result i32)
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
  local.get $0
  i32.store
  block $folding-inner0 (result i32)
   local.get $0
   i32.load
   i32.const 1
   i32.add
   local.set $2
   global.get $~lib/memory/__stack_pointer
   local.get $0
   i32.store offset=4
   global.get $~lib/memory/__stack_pointer
   local.get $0
   i32.load offset=4
   local.tee $1
   i32.store
   local.get $1
   call $~lib/staticarray/StaticArray<u8>#get:length
   local.get $2
   i32.lt_s
   if
    global.get $~lib/memory/__stack_pointer
    i32.const 8384
    i32.store
    i32.const 0
    i32.const 8384
    call $~lib/@massalabs/as-types/assembly/result/Result<bool>#constructor
    br $folding-inner0
   end
   global.get $~lib/memory/__stack_pointer
   local.get $0
   i32.store offset=4
   global.get $~lib/memory/__stack_pointer
   local.get $0
   i32.load offset=4
   local.tee $1
   i32.store
   global.get $~lib/memory/__stack_pointer
   local.get $0
   i32.store offset=4
   global.get $~lib/memory/__stack_pointer
   local.get $0
   i32.store offset=8
   local.get $0
   local.get $0
   i32.load
   local.tee $0
   i32.const 1
   i32.add
   call $~lib/@massalabs/as-types/assembly/argument/Args#set:_offset
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
   call $~lib/staticarray/StaticArray<u8>#get:length
   local.get $0
   i32.le_u
   if
    i32.const 1152
    i32.const 1504
    i32.const 78
    i32.const 41
    call $~lib/builtins/abort
    unreachable
   end
   local.get $0
   local.get $1
   i32.add
   i32.load8_u
   local.set $0
   global.get $~lib/memory/__stack_pointer
   i32.const 4
   i32.add
   global.set $~lib/memory/__stack_pointer
   local.get $0
   i32.eqz
   i32.eqz
   i32.const 0
   call $~lib/@massalabs/as-types/assembly/result/Result<bool>#constructor
  end
  local.set $0
  global.get $~lib/memory/__stack_pointer
  i32.const 12
  i32.add
  global.set $~lib/memory/__stack_pointer
  local.get $0
 )
 (func $assembly/contracts/main/voteOnProposal (param $0 i32)
  (local $1 i64)
  (local $2 i64)
  (local $3 i64)
  (local $4 i64)
  (local $5 i32)
  (local $6 i32)
  (local $7 i32)
  (local $8 i32)
  (local $9 i32)
  (local $10 i32)
  (local $11 i32)
  (local $12 i32)
  (local $13 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 152
  i32.sub
  global.set $~lib/memory/__stack_pointer
  call $~stack_check
  global.get $~lib/memory/__stack_pointer
  i32.const 0
  i32.const 152
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
  local.tee $5
  i32.store offset=8
  global.get $~lib/memory/__stack_pointer
  i32.const 8304
  i32.store offset=12
  global.get $~lib/memory/__stack_pointer
  local.get $5
  i32.store offset=16
  global.get $~lib/memory/__stack_pointer
  local.get $5
  i32.store offset=20
  global.get $~lib/memory/__stack_pointer
  local.get $5
  i32.store offset=24
  global.get $~lib/memory/__stack_pointer
  local.get $5
  i32.load offset=8
  local.tee $6
  i32.store
  block $folding-inner0
   local.get $6
   call $~lib/string/String.__not
   i32.eqz
   if
    global.get $~lib/memory/__stack_pointer
    i32.const 8304
    i32.store offset=28
    global.get $~lib/memory/__stack_pointer
    local.get $5
    i32.store
    global.get $~lib/memory/__stack_pointer
    local.get $5
    i32.load offset=8
    local.tee $0
    i32.store offset=32
    local.get $0
    i32.eqz
    br_if $folding-inner0
    global.get $~lib/memory/__stack_pointer
    local.get $0
    i32.store offset=36
    global.get $~lib/memory/__stack_pointer
    i32.const 8352
    i32.store
    global.get $~lib/memory/__stack_pointer
    i32.const 8304
    i32.store offset=24
    i32.const 8352
    i32.const 0
    i32.const 8304
    call $~lib/staticarray/StaticArray<~lib/string/String>#__uset
    global.get $~lib/memory/__stack_pointer
    i32.const 8352
    i32.store
    global.get $~lib/memory/__stack_pointer
    local.get $0
    i32.store offset=24
    i32.const 8352
    i32.const 2
    local.get $0
    call $~lib/staticarray/StaticArray<~lib/string/String>#__uset
    global.get $~lib/memory/__stack_pointer
    i32.const 8352
    i32.store
    global.get $~lib/memory/__stack_pointer
    i32.const 2528
    i32.store offset=24
    i32.const 8352
    call $~lib/staticarray/StaticArray<~lib/string/String>#join
    i32.const 3216
    i32.const 52
    i32.const 7
    call $~lib/builtins/abort
    unreachable
   end
   global.get $~lib/memory/__stack_pointer
   local.get $5
   i32.store offset=40
   global.get $~lib/memory/__stack_pointer
   local.get $5
   i32.store
   local.get $5
   i64.load
   local.set $2
   global.get $~lib/memory/__stack_pointer
   local.get $0
   i32.store
   global.get $~lib/memory/__stack_pointer
   local.get $0
   call $~lib/@massalabs/as-types/assembly/argument/Args#nextBool
   local.tee $0
   i32.store offset=44
   global.get $~lib/memory/__stack_pointer
   i32.const 8528
   i32.store offset=48
   global.get $~lib/memory/__stack_pointer
   local.get $0
   i32.store offset=52
   global.get $~lib/memory/__stack_pointer
   local.get $0
   i32.store offset=56
   global.get $~lib/memory/__stack_pointer
   local.get $0
   i32.store offset=24
   global.get $~lib/memory/__stack_pointer
   local.get $0
   i32.load offset=4
   local.tee $5
   i32.store
   local.get $5
   call $~lib/string/String.__not
   i32.eqz
   if
    global.get $~lib/memory/__stack_pointer
    i32.const 8528
    i32.store offset=60
    global.get $~lib/memory/__stack_pointer
    local.get $0
    i32.store
    global.get $~lib/memory/__stack_pointer
    local.get $0
    i32.load offset=4
    local.tee $0
    i32.store offset=64
    local.get $0
    i32.eqz
    br_if $folding-inner0
    global.get $~lib/memory/__stack_pointer
    local.get $0
    i32.store offset=68
    global.get $~lib/memory/__stack_pointer
    i32.const 8576
    i32.store
    global.get $~lib/memory/__stack_pointer
    i32.const 8528
    i32.store offset=24
    i32.const 8576
    i32.const 0
    i32.const 8528
    call $~lib/staticarray/StaticArray<~lib/string/String>#__uset
    global.get $~lib/memory/__stack_pointer
    i32.const 8576
    i32.store
    global.get $~lib/memory/__stack_pointer
    local.get $0
    i32.store offset=24
    i32.const 8576
    i32.const 2
    local.get $0
    call $~lib/staticarray/StaticArray<~lib/string/String>#__uset
    global.get $~lib/memory/__stack_pointer
    i32.const 8576
    i32.store
    global.get $~lib/memory/__stack_pointer
    i32.const 2528
    i32.store offset=24
    i32.const 8576
    call $~lib/staticarray/StaticArray<~lib/string/String>#join
    i32.const 3216
    i32.const 52
    i32.const 7
    call $~lib/builtins/abort
    unreachable
   end
   global.get $~lib/memory/__stack_pointer
   local.get $0
   i32.store offset=72
   global.get $~lib/memory/__stack_pointer
   local.get $0
   i32.store
   local.get $0
   i32.load8_u
   local.set $6
   global.get $~lib/memory/__stack_pointer
   local.set $0
   call $~lib/@massalabs/massa-as-sdk/assembly/std/context/caller
   local.set $5
   global.get $~lib/memory/__stack_pointer
   local.get $5
   i32.store
   local.get $0
   local.get $5
   call $~lib/@massalabs/massa-as-sdk/assembly/std/address/Address#toString
   local.tee $7
   i32.store offset=76
   global.get $~lib/memory/__stack_pointer
   local.get $7
   i32.store offset=24
   local.get $7
   call $assembly/contracts/main/userSharesKey
   local.set $0
   global.get $~lib/memory/__stack_pointer
   local.get $0
   i32.store
   local.get $0
   call $assembly/contracts/main/sGetU64
   local.tee $3
   i64.eqz
   if
    i32.const 7920
    i32.const 2800
    i32.const 386
    i32.const 3
    call $~lib/builtins/abort
    unreachable
   end
   global.get $~lib/memory/__stack_pointer
   local.set $0
   local.get $2
   i32.wrap_i64
   call $assembly/contracts/main/proposalKey
   local.set $5
   global.get $~lib/memory/__stack_pointer
   local.get $5
   i32.store
   local.get $0
   local.get $5
   call $~lib/@massalabs/massa-as-sdk/assembly/std/storage/get<~lib/string/String>
   local.tee $0
   i32.store offset=80
   global.get $~lib/memory/__stack_pointer
   local.get $0
   i32.store
   local.get $0
   call $~lib/string/String.__ne
   i32.eqz
   if
    i32.const 8608
    i32.const 2800
    i32.const 389
    i32.const 3
    call $~lib/builtins/abort
    unreachable
   end
   global.get $~lib/memory/__stack_pointer
   local.get $0
   i32.store
   global.get $~lib/memory/__stack_pointer
   i32.const 3984
   i32.store offset=24
   i32.const 1
   global.set $~argumentsLength
   global.get $~lib/memory/__stack_pointer
   local.get $0
   i32.const 3984
   call $~lib/string/String#split@varargs
   local.tee $0
   i32.store offset=84
   global.get $~lib/memory/__stack_pointer
   local.get $0
   i32.store
   local.get $0
   call $~lib/array/Array<~lib/@massalabs/massa-as-sdk/assembly/std/address/Address>#get:length
   i32.const 7
   i32.lt_s
   if
    i32.const 8672
    i32.const 2800
    i32.const 392
    i32.const 3
    call $~lib/builtins/abort
    unreachable
   end
   global.get $~lib/memory/__stack_pointer
   local.get $0
   i32.store offset=24
   local.get $0
   i32.const 4
   call $~lib/array/Array<~lib/@massalabs/massa-as-sdk/assembly/std/address/Address>#__get
   local.set $5
   global.get $~lib/memory/__stack_pointer
   local.get $5
   i32.store
   local.get $5
   call $~lib/string/parseInt
   i64.trunc_sat_f64_u
   local.set $1
   call $~lib/@massalabs/massa-as-sdk/assembly/env/env/env.currentPeriod
   local.get $1
   i64.gt_u
   if
    i32.const 8736
    i32.const 2800
    i32.const 396
    i32.const 3
    call $~lib/builtins/abort
    unreachable
   end
   global.get $~lib/memory/__stack_pointer
   local.set $5
   global.get $~lib/memory/__stack_pointer
   local.get $2
   call $~lib/util/number/utoa64
   local.tee $8
   i32.store offset=88
   global.get $~lib/memory/__stack_pointer
   local.get $7
   i32.store offset=92
   global.get $~lib/memory/__stack_pointer
   i32.const 8816
   i32.store
   global.get $~lib/memory/__stack_pointer
   local.get $8
   i32.store offset=24
   i32.const 8816
   i32.const 1
   local.get $8
   call $~lib/staticarray/StaticArray<~lib/string/String>#__uset
   global.get $~lib/memory/__stack_pointer
   i32.const 8816
   i32.store
   global.get $~lib/memory/__stack_pointer
   local.get $7
   i32.store offset=24
   i32.const 8816
   i32.const 3
   local.get $7
   call $~lib/staticarray/StaticArray<~lib/string/String>#__uset
   global.get $~lib/memory/__stack_pointer
   i32.const 8816
   i32.store
   global.get $~lib/memory/__stack_pointer
   i32.const 2528
   i32.store offset=24
   local.get $5
   i32.const 8816
   call $~lib/staticarray/StaticArray<~lib/string/String>#join
   local.tee $5
   i32.store offset=96
   global.get $~lib/memory/__stack_pointer
   local.get $5
   i32.store
   local.get $5
   call $assembly/contracts/main/sHas
   if
    i32.const 8864
    i32.const 2800
    i32.const 400
    i32.const 3
    call $~lib/builtins/abort
    unreachable
   end
   global.get $~lib/memory/__stack_pointer
   local.get $5
   i32.store
   global.get $~lib/memory/__stack_pointer
   i32.const 8912
   i32.const 8944
   local.get $6
   select
   local.tee $8
   i32.store offset=24
   local.get $5
   local.get $8
   call $~lib/@massalabs/massa-as-sdk/assembly/std/storage/set<~lib/string/String>
   global.get $~lib/memory/__stack_pointer
   local.get $0
   i32.store offset=24
   local.get $0
   i32.const 5
   call $~lib/array/Array<~lib/@massalabs/massa-as-sdk/assembly/std/address/Address>#__get
   local.set $5
   global.get $~lib/memory/__stack_pointer
   local.get $5
   i32.store
   local.get $5
   call $~lib/string/parseInt
   i64.trunc_sat_f64_u
   local.set $1
   global.get $~lib/memory/__stack_pointer
   local.get $0
   i32.store offset=24
   local.get $0
   i32.const 6
   call $~lib/array/Array<~lib/@massalabs/massa-as-sdk/assembly/std/address/Address>#__get
   local.set $5
   global.get $~lib/memory/__stack_pointer
   local.get $5
   i32.store
   local.get $5
   call $~lib/string/parseInt
   i64.trunc_sat_f64_u
   local.set $4
   local.get $6
   if
    local.get $1
    local.get $3
    i64.add
    local.set $1
   else
    local.get $3
    local.get $4
    i64.add
    local.set $4
   end
   global.get $~lib/memory/__stack_pointer
   local.set $5
   global.get $~lib/memory/__stack_pointer
   local.get $0
   i32.store
   global.get $~lib/memory/__stack_pointer
   local.get $0
   i32.const 0
   call $~lib/array/Array<~lib/@massalabs/massa-as-sdk/assembly/std/address/Address>#__get
   local.tee $8
   i32.store offset=100
   global.get $~lib/memory/__stack_pointer
   local.get $0
   i32.store
   global.get $~lib/memory/__stack_pointer
   local.get $0
   i32.const 1
   call $~lib/array/Array<~lib/@massalabs/massa-as-sdk/assembly/std/address/Address>#__get
   local.tee $9
   i32.store offset=104
   global.get $~lib/memory/__stack_pointer
   local.get $0
   i32.store
   global.get $~lib/memory/__stack_pointer
   local.get $0
   i32.const 2
   call $~lib/array/Array<~lib/@massalabs/massa-as-sdk/assembly/std/address/Address>#__get
   local.tee $11
   i32.store offset=108
   global.get $~lib/memory/__stack_pointer
   local.get $0
   i32.store
   global.get $~lib/memory/__stack_pointer
   local.get $0
   i32.const 3
   call $~lib/array/Array<~lib/@massalabs/massa-as-sdk/assembly/std/address/Address>#__get
   local.tee $12
   i32.store offset=112
   global.get $~lib/memory/__stack_pointer
   local.get $0
   i32.store
   global.get $~lib/memory/__stack_pointer
   local.get $0
   i32.const 4
   call $~lib/array/Array<~lib/@massalabs/massa-as-sdk/assembly/std/address/Address>#__get
   local.tee $10
   i32.store offset=116
   global.get $~lib/memory/__stack_pointer
   local.get $1
   call $~lib/util/number/utoa64
   local.tee $13
   i32.store offset=120
   global.get $~lib/memory/__stack_pointer
   local.get $4
   call $~lib/util/number/utoa64
   local.tee $0
   i32.store offset=124
   global.get $~lib/memory/__stack_pointer
   i32.const 8976
   i32.store
   global.get $~lib/memory/__stack_pointer
   local.get $8
   i32.store offset=24
   i32.const 8976
   i32.const 0
   local.get $8
   call $~lib/staticarray/StaticArray<~lib/string/String>#__uset
   global.get $~lib/memory/__stack_pointer
   i32.const 8976
   i32.store
   global.get $~lib/memory/__stack_pointer
   local.get $9
   i32.store offset=24
   i32.const 8976
   i32.const 2
   local.get $9
   call $~lib/staticarray/StaticArray<~lib/string/String>#__uset
   global.get $~lib/memory/__stack_pointer
   i32.const 8976
   i32.store
   global.get $~lib/memory/__stack_pointer
   local.get $11
   i32.store offset=24
   i32.const 8976
   i32.const 4
   local.get $11
   call $~lib/staticarray/StaticArray<~lib/string/String>#__uset
   global.get $~lib/memory/__stack_pointer
   i32.const 8976
   i32.store
   global.get $~lib/memory/__stack_pointer
   local.get $12
   i32.store offset=24
   i32.const 8976
   i32.const 6
   local.get $12
   call $~lib/staticarray/StaticArray<~lib/string/String>#__uset
   global.get $~lib/memory/__stack_pointer
   i32.const 8976
   i32.store
   global.get $~lib/memory/__stack_pointer
   local.get $10
   i32.store offset=24
   i32.const 8976
   i32.const 8
   local.get $10
   call $~lib/staticarray/StaticArray<~lib/string/String>#__uset
   global.get $~lib/memory/__stack_pointer
   i32.const 8976
   i32.store
   global.get $~lib/memory/__stack_pointer
   local.get $13
   i32.store offset=24
   i32.const 8976
   i32.const 10
   local.get $13
   call $~lib/staticarray/StaticArray<~lib/string/String>#__uset
   global.get $~lib/memory/__stack_pointer
   i32.const 8976
   i32.store
   global.get $~lib/memory/__stack_pointer
   local.get $0
   i32.store offset=24
   i32.const 8976
   i32.const 12
   local.get $0
   call $~lib/staticarray/StaticArray<~lib/string/String>#__uset
   global.get $~lib/memory/__stack_pointer
   i32.const 8976
   i32.store
   global.get $~lib/memory/__stack_pointer
   i32.const 2528
   i32.store offset=24
   local.get $5
   i32.const 8976
   call $~lib/staticarray/StaticArray<~lib/string/String>#join
   local.tee $0
   i32.store offset=128
   local.get $2
   i32.wrap_i64
   call $assembly/contracts/main/proposalKey
   local.set $5
   global.get $~lib/memory/__stack_pointer
   local.get $5
   i32.store
   global.get $~lib/memory/__stack_pointer
   local.get $0
   i32.store offset=24
   local.get $5
   local.get $0
   call $~lib/@massalabs/massa-as-sdk/assembly/std/storage/set<~lib/string/String>
   global.get $~lib/memory/__stack_pointer
   local.get $2
   call $~lib/util/number/utoa64
   local.tee $0
   i32.store offset=132
   global.get $~lib/memory/__stack_pointer
   local.get $7
   i32.store offset=136
   global.get $~lib/memory/__stack_pointer
   i32.const 8912
   i32.const 8944
   local.get $6
   select
   local.tee $5
   i32.store offset=140
   global.get $~lib/memory/__stack_pointer
   local.get $3
   call $~lib/util/number/utoa64
   local.tee $6
   i32.store offset=144
   global.get $~lib/memory/__stack_pointer
   i32.const 9104
   i32.store offset=24
   global.get $~lib/memory/__stack_pointer
   local.get $0
   i32.store offset=148
   i32.const 9104
   i32.const 1
   local.get $0
   call $~lib/staticarray/StaticArray<~lib/string/String>#__uset
   global.get $~lib/memory/__stack_pointer
   i32.const 9104
   i32.store offset=24
   global.get $~lib/memory/__stack_pointer
   local.get $7
   i32.store offset=148
   i32.const 9104
   i32.const 3
   local.get $7
   call $~lib/staticarray/StaticArray<~lib/string/String>#__uset
   global.get $~lib/memory/__stack_pointer
   i32.const 9104
   i32.store offset=24
   global.get $~lib/memory/__stack_pointer
   local.get $5
   i32.store offset=148
   i32.const 9104
   i32.const 5
   local.get $5
   call $~lib/staticarray/StaticArray<~lib/string/String>#__uset
   global.get $~lib/memory/__stack_pointer
   i32.const 9104
   i32.store offset=24
   global.get $~lib/memory/__stack_pointer
   local.get $6
   i32.store offset=148
   i32.const 9104
   i32.const 7
   local.get $6
   call $~lib/staticarray/StaticArray<~lib/string/String>#__uset
   global.get $~lib/memory/__stack_pointer
   i32.const 9104
   i32.store offset=24
   global.get $~lib/memory/__stack_pointer
   i32.const 2528
   i32.store offset=148
   i32.const 9104
   call $~lib/staticarray/StaticArray<~lib/string/String>#join
   local.set $0
   global.get $~lib/memory/__stack_pointer
   local.get $0
   i32.store
   local.get $0
   call $~lib/@massalabs/massa-as-sdk/assembly/std/utils/events/generateEvent
   global.get $~lib/memory/__stack_pointer
   i32.const 152
   i32.add
   global.set $~lib/memory/__stack_pointer
   return
  end
  i32.const 3088
  i32.const 3216
  i32.const 52
  i32.const 32
  call $~lib/builtins/abort
  unreachable
 )
 (func $assembly/contracts/main/executeProposal (param $0 i32)
  (local $1 i64)
  (local $2 i64)
  (local $3 i64)
  (local $4 i64)
  (local $5 i64)
  (local $6 i32)
  (local $7 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 76
  i32.sub
  global.set $~lib/memory/__stack_pointer
  call $~stack_check
  global.get $~lib/memory/__stack_pointer
  i32.const 0
  i32.const 76
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
  i32.const 8304
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
  local.tee $6
  i32.store
  local.get $6
  call $~lib/string/String.__not
  i32.eqz
  if
   global.get $~lib/memory/__stack_pointer
   i32.const 8304
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
   local.set $6
   local.get $0
   i32.eqz
   if
    i32.const 3088
    i32.const 3216
    i32.const 52
    i32.const 32
    call $~lib/builtins/abort
    unreachable
   end
   local.get $6
   local.get $0
   i32.store offset=36
   global.get $~lib/memory/__stack_pointer
   i32.const 9168
   i32.store
   global.get $~lib/memory/__stack_pointer
   i32.const 8304
   i32.store offset=24
   i32.const 9168
   i32.const 0
   i32.const 8304
   call $~lib/staticarray/StaticArray<~lib/string/String>#__uset
   global.get $~lib/memory/__stack_pointer
   i32.const 9168
   i32.store
   global.get $~lib/memory/__stack_pointer
   local.get $0
   i32.store offset=24
   i32.const 9168
   i32.const 2
   local.get $0
   call $~lib/staticarray/StaticArray<~lib/string/String>#__uset
   global.get $~lib/memory/__stack_pointer
   i32.const 9168
   i32.store
   global.get $~lib/memory/__stack_pointer
   i32.const 2528
   i32.store offset=24
   i32.const 9168
   call $~lib/staticarray/StaticArray<~lib/string/String>#join
   i32.const 3216
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
  local.set $6
  local.get $0
  i64.load
  local.tee $2
  i32.wrap_i64
  call $assembly/contracts/main/proposalKey
  local.set $0
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store
  local.get $6
  local.get $0
  call $~lib/@massalabs/massa-as-sdk/assembly/std/storage/get<~lib/string/String>
  local.tee $0
  i32.store offset=44
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store
  local.get $0
  call $~lib/string/String.__ne
  i32.eqz
  if
   i32.const 8608
   i32.const 2800
   i32.const 427
   i32.const 3
   call $~lib/builtins/abort
   unreachable
  end
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store
  global.get $~lib/memory/__stack_pointer
  i32.const 3984
  i32.store offset=24
  i32.const 1
  global.set $~argumentsLength
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.const 3984
  call $~lib/string/String#split@varargs
  local.tee $0
  i32.store offset=48
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store
  local.get $0
  call $~lib/array/Array<~lib/@massalabs/massa-as-sdk/assembly/std/address/Address>#get:length
  i32.const 7
  i32.lt_s
  if
   i32.const 8672
   i32.const 2800
   i32.const 430
   i32.const 3
   call $~lib/builtins/abort
   unreachable
  end
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.const 0
  call $~lib/array/Array<~lib/@massalabs/massa-as-sdk/assembly/std/address/Address>#__get
  local.tee $6
  i32.store offset=52
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store offset=24
  local.get $0
  i32.const 1
  call $~lib/array/Array<~lib/@massalabs/massa-as-sdk/assembly/std/address/Address>#__get
  local.set $7
  global.get $~lib/memory/__stack_pointer
  local.get $7
  i32.store
  local.get $7
  call $~lib/string/parseInt
  i64.trunc_sat_f64_u
  local.set $1
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store offset=24
  local.get $0
  i32.const 4
  call $~lib/array/Array<~lib/@massalabs/massa-as-sdk/assembly/std/address/Address>#__get
  local.set $7
  global.get $~lib/memory/__stack_pointer
  local.get $7
  i32.store
  local.get $7
  call $~lib/string/parseInt
  i64.trunc_sat_f64_u
  local.set $4
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store offset=24
  local.get $0
  i32.const 5
  call $~lib/array/Array<~lib/@massalabs/massa-as-sdk/assembly/std/address/Address>#__get
  local.set $7
  global.get $~lib/memory/__stack_pointer
  local.get $7
  i32.store
  local.get $7
  call $~lib/string/parseInt
  i64.trunc_sat_f64_u
  local.set $3
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store offset=24
  local.get $0
  i32.const 6
  call $~lib/array/Array<~lib/@massalabs/massa-as-sdk/assembly/std/address/Address>#__get
  local.set $0
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store
  local.get $0
  call $~lib/string/parseInt
  i64.trunc_sat_f64_u
  local.set $5
  call $~lib/@massalabs/massa-as-sdk/assembly/env/env/env.currentPeriod
  local.get $4
  i64.le_u
  if
   i32.const 9200
   i32.const 2800
   i32.const 439
   i32.const 3
   call $~lib/builtins/abort
   unreachable
  end
  local.get $3
  local.get $5
  i64.le_u
  if
   i32.const 9264
   i32.const 2800
   i32.const 440
   i32.const 3
   call $~lib/builtins/abort
   unreachable
  end
  global.get $~lib/memory/__stack_pointer
  i32.const 1744
  i32.store
  i32.const 1744
  call $assembly/contracts/main/sGetU64
  i64.const 1
  i64.shr_u
  local.get $3
  i64.gt_u
  if
   i32.const 9328
   i32.const 2800
   i32.const 443
   i32.const 3
   call $~lib/builtins/abort
   unreachable
  end
  global.get $~lib/memory/__stack_pointer
  local.get $6
  i32.store
  global.get $~lib/memory/__stack_pointer
  i32.const 9392
  i32.store offset=24
  local.get $6
  i32.const 9392
  call $~lib/string/String.__eq
  if
   global.get $~lib/memory/__stack_pointer
   i32.const 2176
   i32.store
   i32.const 2176
   local.get $1
   call $assembly/contracts/main/sSetU64
   global.get $~lib/memory/__stack_pointer
   local.get $2
   call $~lib/util/number/utoa64
   local.tee $0
   i32.store offset=56
   global.get $~lib/memory/__stack_pointer
   local.get $1
   call $~lib/util/number/utoa64
   local.tee $6
   i32.store offset=60
   global.get $~lib/memory/__stack_pointer
   i32.const 9552
   i32.store offset=24
   global.get $~lib/memory/__stack_pointer
   local.get $0
   i32.store offset=64
   i32.const 9552
   i32.const 1
   local.get $0
   call $~lib/staticarray/StaticArray<~lib/string/String>#__uset
   global.get $~lib/memory/__stack_pointer
   i32.const 9552
   i32.store offset=24
   global.get $~lib/memory/__stack_pointer
   local.get $6
   i32.store offset=64
   i32.const 9552
   i32.const 3
   local.get $6
   call $~lib/staticarray/StaticArray<~lib/string/String>#__uset
   global.get $~lib/memory/__stack_pointer
   i32.const 9552
   i32.store offset=24
   global.get $~lib/memory/__stack_pointer
   i32.const 2528
   i32.store offset=64
   i32.const 9552
   call $~lib/staticarray/StaticArray<~lib/string/String>#join
   local.set $0
   global.get $~lib/memory/__stack_pointer
   local.get $0
   i32.store
   local.get $0
   call $~lib/@massalabs/massa-as-sdk/assembly/std/utils/events/generateEvent
  else
   global.get $~lib/memory/__stack_pointer
   local.get $6
   i32.store
   global.get $~lib/memory/__stack_pointer
   i32.const 1968
   i32.store offset=24
   local.get $6
   i32.const 1968
   call $~lib/string/String.__eq
   if
    global.get $~lib/memory/__stack_pointer
    i32.const 1968
    i32.store
    i32.const 1968
    local.get $1
    call $assembly/contracts/main/sSetU64
    global.get $~lib/memory/__stack_pointer
    local.get $2
    call $~lib/util/number/utoa64
    local.tee $0
    i32.store offset=68
    global.get $~lib/memory/__stack_pointer
    local.get $1
    call $~lib/util/number/utoa64
    local.tee $6
    i32.store offset=72
    global.get $~lib/memory/__stack_pointer
    i32.const 9648
    i32.store offset=24
    global.get $~lib/memory/__stack_pointer
    local.get $0
    i32.store offset=64
    i32.const 9648
    i32.const 1
    local.get $0
    call $~lib/staticarray/StaticArray<~lib/string/String>#__uset
    global.get $~lib/memory/__stack_pointer
    i32.const 9648
    i32.store offset=24
    global.get $~lib/memory/__stack_pointer
    local.get $6
    i32.store offset=64
    i32.const 9648
    i32.const 3
    local.get $6
    call $~lib/staticarray/StaticArray<~lib/string/String>#__uset
    global.get $~lib/memory/__stack_pointer
    i32.const 9648
    i32.store offset=24
    global.get $~lib/memory/__stack_pointer
    i32.const 2528
    i32.store offset=64
    i32.const 9648
    call $~lib/staticarray/StaticArray<~lib/string/String>#join
    local.set $0
    global.get $~lib/memory/__stack_pointer
    local.get $0
    i32.store
    local.get $0
    call $~lib/@massalabs/massa-as-sdk/assembly/std/utils/events/generateEvent
   else
    i32.const 9696
    i32.const 2800
    i32.const 453
    i32.const 5
    call $~lib/builtins/abort
    unreachable
   end
  end
  global.get $~lib/memory/__stack_pointer
  i32.const 76
  i32.add
  global.set $~lib/memory/__stack_pointer
 )
 (func $assembly/contracts/main/getProposal (param $0 i32) (result i32)
  (local $1 i32)
  (local $2 i32)
  (local $3 i32)
  (local $4 i64)
  (local $5 i32)
  (local $6 i32)
  (local $7 i32)
  (local $8 i32)
  (local $9 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 88
  i32.sub
  global.set $~lib/memory/__stack_pointer
  call $~stack_check
  global.get $~lib/memory/__stack_pointer
  i32.const 0
  i32.const 88
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
  i32.const 8304
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
  local.tee $1
  i32.store
  local.get $1
  call $~lib/string/String.__not
  i32.eqz
  if
   global.get $~lib/memory/__stack_pointer
   i32.const 8304
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
   local.set $1
   local.get $0
   i32.eqz
   if
    i32.const 3088
    i32.const 3216
    i32.const 52
    i32.const 32
    call $~lib/builtins/abort
    unreachable
   end
   local.get $1
   local.get $0
   i32.store offset=36
   global.get $~lib/memory/__stack_pointer
   i32.const 9776
   i32.store
   global.get $~lib/memory/__stack_pointer
   i32.const 8304
   i32.store offset=24
   i32.const 9776
   i32.const 0
   i32.const 8304
   call $~lib/staticarray/StaticArray<~lib/string/String>#__uset
   global.get $~lib/memory/__stack_pointer
   i32.const 9776
   i32.store
   global.get $~lib/memory/__stack_pointer
   local.get $0
   i32.store offset=24
   i32.const 9776
   i32.const 2
   local.get $0
   call $~lib/staticarray/StaticArray<~lib/string/String>#__uset
   global.get $~lib/memory/__stack_pointer
   i32.const 9776
   i32.store
   global.get $~lib/memory/__stack_pointer
   i32.const 2528
   i32.store offset=24
   i32.const 9776
   call $~lib/staticarray/StaticArray<~lib/string/String>#join
   i32.const 3216
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
  local.set $1
  local.get $0
  i64.load
  local.tee $4
  i32.wrap_i64
  call $assembly/contracts/main/proposalKey
  local.set $0
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store
  local.get $1
  local.get $0
  call $~lib/@massalabs/massa-as-sdk/assembly/std/storage/get<~lib/string/String>
  local.tee $0
  i32.store offset=44
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store
  block $folding-inner0 (result i32)
   local.get $0
   call $~lib/string/String.__not
   if
    global.get $~lib/memory/__stack_pointer
    i32.const 9808
    i32.store offset=24
    i32.const 1
    global.set $~argumentsLength
    i32.const 9808
    call $~lib/string/String.UTF8.encode@varargs
    local.set $0
    global.get $~lib/memory/__stack_pointer
    local.get $0
    i32.store
    local.get $0
    call $assembly/contracts/main/arrayBufferToStaticArrayU8
    br $folding-inner0
   end
   global.get $~lib/memory/__stack_pointer
   local.get $0
   i32.store
   global.get $~lib/memory/__stack_pointer
   i32.const 3984
   i32.store offset=24
   i32.const 1
   global.set $~argumentsLength
   global.get $~lib/memory/__stack_pointer
   local.get $0
   i32.const 3984
   call $~lib/string/String#split@varargs
   local.tee $7
   i32.store offset=48
   global.get $~lib/memory/__stack_pointer
   local.get $7
   i32.store
   local.get $7
   call $~lib/array/Array<~lib/@massalabs/massa-as-sdk/assembly/std/address/Address>#get:length
   i32.const 7
   i32.lt_s
   if
    global.get $~lib/memory/__stack_pointer
    i32.const 9888
    i32.store offset=24
    i32.const 1
    global.set $~argumentsLength
    i32.const 9888
    call $~lib/string/String.UTF8.encode@varargs
    local.set $0
    global.get $~lib/memory/__stack_pointer
    local.get $0
    i32.store
    local.get $0
    call $assembly/contracts/main/arrayBufferToStaticArrayU8
    br $folding-inner0
   end
   global.get $~lib/memory/__stack_pointer
   local.set $5
   global.get $~lib/memory/__stack_pointer
   local.get $4
   call $~lib/util/number/utoa64
   local.tee $6
   i32.store offset=52
   global.get $~lib/memory/__stack_pointer
   local.get $7
   i32.store
   global.get $~lib/memory/__stack_pointer
   local.get $7
   i32.const 0
   call $~lib/array/Array<~lib/@massalabs/massa-as-sdk/assembly/std/address/Address>#__get
   local.tee $8
   i32.store offset=56
   global.get $~lib/memory/__stack_pointer
   local.get $7
   i32.store
   global.get $~lib/memory/__stack_pointer
   local.get $7
   i32.const 1
   call $~lib/array/Array<~lib/@massalabs/massa-as-sdk/assembly/std/address/Address>#__get
   local.tee $9
   i32.store offset=60
   global.get $~lib/memory/__stack_pointer
   local.get $7
   i32.store
   global.get $~lib/memory/__stack_pointer
   local.get $7
   i32.const 2
   call $~lib/array/Array<~lib/@massalabs/massa-as-sdk/assembly/std/address/Address>#__get
   local.tee $0
   i32.store offset=64
   global.get $~lib/memory/__stack_pointer
   local.get $7
   i32.store
   global.get $~lib/memory/__stack_pointer
   local.get $7
   i32.const 3
   call $~lib/array/Array<~lib/@massalabs/massa-as-sdk/assembly/std/address/Address>#__get
   local.tee $1
   i32.store offset=68
   global.get $~lib/memory/__stack_pointer
   local.get $7
   i32.store
   global.get $~lib/memory/__stack_pointer
   local.get $7
   i32.const 4
   call $~lib/array/Array<~lib/@massalabs/massa-as-sdk/assembly/std/address/Address>#__get
   local.tee $2
   i32.store offset=72
   global.get $~lib/memory/__stack_pointer
   local.get $7
   i32.store
   global.get $~lib/memory/__stack_pointer
   local.get $7
   i32.const 5
   call $~lib/array/Array<~lib/@massalabs/massa-as-sdk/assembly/std/address/Address>#__get
   local.tee $3
   i32.store offset=76
   global.get $~lib/memory/__stack_pointer
   local.get $7
   i32.store
   global.get $~lib/memory/__stack_pointer
   local.get $7
   i32.const 6
   call $~lib/array/Array<~lib/@massalabs/massa-as-sdk/assembly/std/address/Address>#__get
   local.tee $7
   i32.store offset=80
   global.get $~lib/memory/__stack_pointer
   i32.const 10480
   i32.store
   global.get $~lib/memory/__stack_pointer
   local.get $6
   i32.store offset=24
   i32.const 10480
   i32.const 1
   local.get $6
   call $~lib/staticarray/StaticArray<~lib/string/String>#__uset
   global.get $~lib/memory/__stack_pointer
   i32.const 10480
   i32.store
   global.get $~lib/memory/__stack_pointer
   local.get $8
   i32.store offset=24
   i32.const 10480
   i32.const 3
   local.get $8
   call $~lib/staticarray/StaticArray<~lib/string/String>#__uset
   global.get $~lib/memory/__stack_pointer
   i32.const 10480
   i32.store
   global.get $~lib/memory/__stack_pointer
   local.get $9
   i32.store offset=24
   i32.const 10480
   i32.const 5
   local.get $9
   call $~lib/staticarray/StaticArray<~lib/string/String>#__uset
   global.get $~lib/memory/__stack_pointer
   i32.const 10480
   i32.store
   global.get $~lib/memory/__stack_pointer
   local.get $0
   i32.store offset=24
   i32.const 10480
   i32.const 7
   local.get $0
   call $~lib/staticarray/StaticArray<~lib/string/String>#__uset
   global.get $~lib/memory/__stack_pointer
   i32.const 10480
   i32.store
   global.get $~lib/memory/__stack_pointer
   local.get $1
   i32.store offset=24
   i32.const 10480
   i32.const 9
   local.get $1
   call $~lib/staticarray/StaticArray<~lib/string/String>#__uset
   global.get $~lib/memory/__stack_pointer
   i32.const 10480
   i32.store
   global.get $~lib/memory/__stack_pointer
   local.get $2
   i32.store offset=24
   i32.const 10480
   i32.const 11
   local.get $2
   call $~lib/staticarray/StaticArray<~lib/string/String>#__uset
   global.get $~lib/memory/__stack_pointer
   i32.const 10480
   i32.store
   global.get $~lib/memory/__stack_pointer
   local.get $3
   i32.store offset=24
   i32.const 10480
   i32.const 13
   local.get $3
   call $~lib/staticarray/StaticArray<~lib/string/String>#__uset
   global.get $~lib/memory/__stack_pointer
   i32.const 10480
   i32.store
   global.get $~lib/memory/__stack_pointer
   local.get $7
   i32.store offset=24
   i32.const 10480
   i32.const 15
   local.get $7
   call $~lib/staticarray/StaticArray<~lib/string/String>#__uset
   global.get $~lib/memory/__stack_pointer
   i32.const 10480
   i32.store
   global.get $~lib/memory/__stack_pointer
   i32.const 2528
   i32.store offset=24
   local.get $5
   i32.const 10480
   call $~lib/staticarray/StaticArray<~lib/string/String>#join
   local.tee $0
   i32.store offset=84
   global.get $~lib/memory/__stack_pointer
   local.get $0
   i32.store offset=24
   i32.const 1
   global.set $~argumentsLength
   local.get $0
   call $~lib/string/String.UTF8.encode@varargs
   local.set $0
   global.get $~lib/memory/__stack_pointer
   local.get $0
   i32.store
   local.get $0
   call $assembly/contracts/main/arrayBufferToStaticArrayU8
  end
  local.set $0
  global.get $~lib/memory/__stack_pointer
  i32.const 88
  i32.add
  global.set $~lib/memory/__stack_pointer
  local.get $0
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
 (func $~lib/rt/__newArray (param $0 i32) (param $1 i32) (param $2 i32) (result i32)
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
  local.get $1
  i32.shl
  local.tee $1
  i32.const 1
  i32.const 0
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
   i32.const 3552
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
   i32.const 3776
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
 (func $export:assembly/contracts/main/createProposal (param $0 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 4
  i32.sub
  global.set $~lib/memory/__stack_pointer
  call $~stack_check
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store
  local.get $0
  call $assembly/contracts/main/createProposal
  global.get $~lib/memory/__stack_pointer
  i32.const 4
  i32.add
  global.set $~lib/memory/__stack_pointer
 )
 (func $export:assembly/contracts/main/voteOnProposal (param $0 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 4
  i32.sub
  global.set $~lib/memory/__stack_pointer
  call $~stack_check
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store
  local.get $0
  call $assembly/contracts/main/voteOnProposal
  global.get $~lib/memory/__stack_pointer
  i32.const 4
  i32.add
  global.set $~lib/memory/__stack_pointer
 )
 (func $export:assembly/contracts/main/executeProposal (param $0 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 4
  i32.sub
  global.set $~lib/memory/__stack_pointer
  call $~stack_check
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store
  local.get $0
  call $assembly/contracts/main/executeProposal
  global.get $~lib/memory/__stack_pointer
  i32.const 4
  i32.add
  global.set $~lib/memory/__stack_pointer
 )
 (func $export:assembly/contracts/main/getProposal (param $0 i32) (result i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 4
  i32.sub
  global.set $~lib/memory/__stack_pointer
  call $~stack_check
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store
  local.get $0
  call $assembly/contracts/main/getProposal
  local.set $0
  global.get $~lib/memory/__stack_pointer
  i32.const 4
  i32.add
  global.set $~lib/memory/__stack_pointer
  local.get $0
 )
 (func $byn$mgfn-shared$assembly/contracts/main/participantKey (param $0 i32) (param $1 i32) (result i32)
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
  local.get $0
  call $~lib/number/I32#toString
  local.set $0
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
 (func $byn$mgfn-shared$assembly/contracts/main/userSharesKey (param $0 i32) (param $1 i32) (result i32)
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
