; ModuleID = 'assert_test.bc'
source_filename = "assert_test.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [2 x i8] c"0\00", align 1
@.str.1 = private unnamed_addr constant [14 x i8] c"assert_test.c\00", align 1
@__PRETTY_FUNCTION__.assert_tester = private unnamed_addr constant [23 x i8] c"int assert_tester(int)\00", align 1
@.str.2 = private unnamed_addr constant [2 x i8] c"a\00", align 1

; Function Attrs: noinline nounwind uwtable
define i32 @assert_tester(i32 %i) #0 !dbg !7 {
entry:
  %i.addr = alloca i32, align 4
  store i32 %i, i32* %i.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %i.addr, metadata !11, metadata !DIExpression()), !dbg !12
  %0 = load i32, i32* %i.addr, align 4, !dbg !13
  %cmp = icmp eq i32 %0, 3, !dbg !15
  br i1 %cmp, label %if.then, label %if.end, !dbg !16

if.then:                                          ; preds = %entry
  call void @__assert_fail(i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str, i32 0, i32 0), i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str.1, i32 0, i32 0), i32 7, i8* getelementptr inbounds ([23 x i8], [23 x i8]* @__PRETTY_FUNCTION__.assert_tester, i32 0, i32 0)) #4, !dbg !17
  unreachable, !dbg !17

if.end:                                           ; preds = %entry
  ret i32 0, !dbg !20
}

; Function Attrs: nounwind readnone speculatable
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: noreturn nounwind
declare void @__assert_fail(i8*, i8*, i32, i8*) #2

; Function Attrs: noinline nounwind uwtable
define i32 @main() #0 !dbg !21 {
entry:
  %retval = alloca i32, align 4
  %a = alloca i32, align 4
  store i32 0, i32* %retval, align 4
  call void @llvm.dbg.declare(metadata i32* %a, metadata !24, metadata !DIExpression()), !dbg !25
  %0 = bitcast i32* %a to i8*, !dbg !26
  call void @klee_make_symbolic(i8* %0, i64 4, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.2, i32 0, i32 0)), !dbg !27
  %1 = load i32, i32* %a, align 4, !dbg !28
  %call = call i32 @assert_tester(i32 %1), !dbg !29
  ret i32 %call, !dbg !30
}

declare void @klee_make_symbolic(i8*, i64, i8*) #3

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone speculatable }
attributes #2 = { noreturn nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { noreturn nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!3, !4, !5}
!llvm.ident = !{!6}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 6.0.1 ", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2)
!1 = !DIFile(filename: "assert_test.c", directory: "/home/klee/klee_src/examples/assert_test")
!2 = !{}
!3 = !{i32 2, !"Dwarf Version", i32 4}
!4 = !{i32 2, !"Debug Info Version", i32 3}
!5 = !{i32 1, !"wchar_size", i32 4}
!6 = !{!"clang version 6.0.1 "}
!7 = distinct !DISubprogram(name: "assert_tester", scope: !1, file: !1, line: 5, type: !8, isLocal: false, isDefinition: true, scopeLine: 5, flags: DIFlagPrototyped, isOptimized: false, unit: !0, variables: !2)
!8 = !DISubroutineType(types: !9)
!9 = !{!10, !10}
!10 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!11 = !DILocalVariable(name: "i", arg: 1, scope: !7, file: !1, line: 5, type: !10)
!12 = !DILocation(line: 5, column: 23, scope: !7)
!13 = !DILocation(line: 6, column: 6, scope: !14)
!14 = distinct !DILexicalBlock(scope: !7, file: !1, line: 6, column: 6)
!15 = !DILocation(line: 6, column: 8, scope: !14)
!16 = !DILocation(line: 6, column: 6, scope: !7)
!17 = !DILocation(line: 7, column: 5, scope: !18)
!18 = distinct !DILexicalBlock(scope: !19, file: !1, line: 7, column: 5)
!19 = distinct !DILexicalBlock(scope: !14, file: !1, line: 7, column: 5)
!20 = !DILocation(line: 8, column: 3, scope: !7)
!21 = distinct !DISubprogram(name: "main", scope: !1, file: !1, line: 12, type: !22, isLocal: false, isDefinition: true, scopeLine: 12, isOptimized: false, unit: !0, variables: !2)
!22 = !DISubroutineType(types: !23)
!23 = !{!10}
!24 = !DILocalVariable(name: "a", scope: !21, file: !1, line: 13, type: !10)
!25 = !DILocation(line: 13, column: 7, scope: !21)
!26 = !DILocation(line: 14, column: 22, scope: !21)
!27 = !DILocation(line: 14, column: 3, scope: !21)
!28 = !DILocation(line: 15, column: 24, scope: !21)
!29 = !DILocation(line: 15, column: 10, scope: !21)
!30 = !DILocation(line: 15, column: 3, scope: !21)
