# auto generated - do not edit

default: all

all:\
UNIT_TESTS/bht_support.ali UNIT_TESTS/bht_support.o UNIT_TESTS/t_bht_01 \
UNIT_TESTS/t_bht_01.ali UNIT_TESTS/t_bht_01.o UNIT_TESTS/t_bht_02 \
UNIT_TESTS/t_bht_02.ali UNIT_TESTS/t_bht_02.o UNIT_TESTS/t_bht_03 \
UNIT_TESTS/t_bht_03.ali UNIT_TESTS/t_bht_03.o UNIT_TESTS/t_bht_04 \
UNIT_TESTS/t_bht_04.ali UNIT_TESTS/t_bht_04.o UNIT_TESTS/t_bht_05 \
UNIT_TESTS/t_bht_05.ali UNIT_TESTS/t_bht_05.o UNIT_TESTS/t_bht_06 \
UNIT_TESTS/t_bht_06.ali UNIT_TESTS/t_bht_06.o UNIT_TESTS/t_bht_07 \
UNIT_TESTS/t_bht_07.ali UNIT_TESTS/t_bht_07.o UNIT_TESTS/t_bht_08 \
UNIT_TESTS/t_bht_08.ali UNIT_TESTS/t_bht_08.o UNIT_TESTS/t_bht_09 \
UNIT_TESTS/t_bht_09.ali UNIT_TESTS/t_bht_09.o UNIT_TESTS/t_bht_10 \
UNIT_TESTS/t_bht_10.ali UNIT_TESTS/t_bht_10.o UNIT_TESTS/t_bht_11 \
UNIT_TESTS/t_bht_11.ali UNIT_TESTS/t_bht_11.o UNIT_TESTS/t_bht_12 \
UNIT_TESTS/t_bht_12.ali UNIT_TESTS/t_bht_12.o UNIT_TESTS/t_bht_13 \
UNIT_TESTS/t_bht_13.ali UNIT_TESTS/t_bht_13.o UNIT_TESTS/t_bht_14 \
UNIT_TESTS/t_bht_14.ali UNIT_TESTS/t_bht_14.o UNIT_TESTS/test.ali \
UNIT_TESTS/test.o cgbc-bounded_hashed_maps.ali cgbc-bounded_hashed_maps.o \
cgbc.ali cgbc.o

# Mkf-test
tests:
	(cd UNIT_TESTS && make)
tests_clean:
	(cd UNIT_TESTS && make clean)

UNIT_TESTS/bht_support.ads:\
cgbc-bounded_hashed_maps.ali

UNIT_TESTS/bht_support.o UNIT_TESTS/bht_support.ali:\
ada-compile UNIT_TESTS/bht_support.adb UNIT_TESTS/bht_support.ads
	./ada-compile UNIT_TESTS/bht_support.adb

UNIT_TESTS/t_bht_01:\
ada-bind ada-link UNIT_TESTS/t_bht_01.ald UNIT_TESTS/t_bht_01.ali \
UNIT_TESTS/bht_support.ali cgbc-bounded_hashed_maps.ali cgbc.ali \
UNIT_TESTS/test.ali
	./ada-bind UNIT_TESTS/t_bht_01.ali
	./ada-link UNIT_TESTS/t_bht_01 UNIT_TESTS/t_bht_01.ali

UNIT_TESTS/t_bht_01.o UNIT_TESTS/t_bht_01.ali:\
ada-compile UNIT_TESTS/t_bht_01.adb UNIT_TESTS/bht_support.ali cgbc.ali \
UNIT_TESTS/test.ali
	./ada-compile UNIT_TESTS/t_bht_01.adb

UNIT_TESTS/t_bht_02:\
ada-bind ada-link UNIT_TESTS/t_bht_02.ald UNIT_TESTS/t_bht_02.ali \
UNIT_TESTS/bht_support.ali cgbc-bounded_hashed_maps.ali cgbc.ali \
UNIT_TESTS/test.ali
	./ada-bind UNIT_TESTS/t_bht_02.ali
	./ada-link UNIT_TESTS/t_bht_02 UNIT_TESTS/t_bht_02.ali

UNIT_TESTS/t_bht_02.o UNIT_TESTS/t_bht_02.ali:\
ada-compile UNIT_TESTS/t_bht_02.adb UNIT_TESTS/bht_support.ali \
UNIT_TESTS/test.ali
	./ada-compile UNIT_TESTS/t_bht_02.adb

UNIT_TESTS/t_bht_03:\
ada-bind ada-link UNIT_TESTS/t_bht_03.ald UNIT_TESTS/t_bht_03.ali \
UNIT_TESTS/bht_support.ali cgbc-bounded_hashed_maps.ali cgbc.ali \
UNIT_TESTS/test.ali
	./ada-bind UNIT_TESTS/t_bht_03.ali
	./ada-link UNIT_TESTS/t_bht_03 UNIT_TESTS/t_bht_03.ali

UNIT_TESTS/t_bht_03.o UNIT_TESTS/t_bht_03.ali:\
ada-compile UNIT_TESTS/t_bht_03.adb UNIT_TESTS/bht_support.ali \
UNIT_TESTS/test.ali
	./ada-compile UNIT_TESTS/t_bht_03.adb

UNIT_TESTS/t_bht_04:\
ada-bind ada-link UNIT_TESTS/t_bht_04.ald UNIT_TESTS/t_bht_04.ali \
UNIT_TESTS/bht_support.ali cgbc-bounded_hashed_maps.ali cgbc.ali \
UNIT_TESTS/test.ali
	./ada-bind UNIT_TESTS/t_bht_04.ali
	./ada-link UNIT_TESTS/t_bht_04 UNIT_TESTS/t_bht_04.ali

UNIT_TESTS/t_bht_04.o UNIT_TESTS/t_bht_04.ali:\
ada-compile UNIT_TESTS/t_bht_04.adb UNIT_TESTS/bht_support.ali \
UNIT_TESTS/test.ali
	./ada-compile UNIT_TESTS/t_bht_04.adb

UNIT_TESTS/t_bht_05:\
ada-bind ada-link UNIT_TESTS/t_bht_05.ald UNIT_TESTS/t_bht_05.ali \
UNIT_TESTS/bht_support.ali cgbc-bounded_hashed_maps.ali cgbc.ali \
UNIT_TESTS/test.ali
	./ada-bind UNIT_TESTS/t_bht_05.ali
	./ada-link UNIT_TESTS/t_bht_05 UNIT_TESTS/t_bht_05.ali

UNIT_TESTS/t_bht_05.o UNIT_TESTS/t_bht_05.ali:\
ada-compile UNIT_TESTS/t_bht_05.adb UNIT_TESTS/bht_support.ali \
UNIT_TESTS/test.ali
	./ada-compile UNIT_TESTS/t_bht_05.adb

UNIT_TESTS/t_bht_06:\
ada-bind ada-link UNIT_TESTS/t_bht_06.ald UNIT_TESTS/t_bht_06.ali \
UNIT_TESTS/bht_support.ali cgbc-bounded_hashed_maps.ali cgbc.ali \
UNIT_TESTS/test.ali
	./ada-bind UNIT_TESTS/t_bht_06.ali
	./ada-link UNIT_TESTS/t_bht_06 UNIT_TESTS/t_bht_06.ali

UNIT_TESTS/t_bht_06.o UNIT_TESTS/t_bht_06.ali:\
ada-compile UNIT_TESTS/t_bht_06.adb UNIT_TESTS/bht_support.ali \
UNIT_TESTS/test.ali
	./ada-compile UNIT_TESTS/t_bht_06.adb

UNIT_TESTS/t_bht_07:\
ada-bind ada-link UNIT_TESTS/t_bht_07.ald UNIT_TESTS/t_bht_07.ali \
UNIT_TESTS/bht_support.ali cgbc-bounded_hashed_maps.ali cgbc.ali \
UNIT_TESTS/test.ali
	./ada-bind UNIT_TESTS/t_bht_07.ali
	./ada-link UNIT_TESTS/t_bht_07 UNIT_TESTS/t_bht_07.ali

UNIT_TESTS/t_bht_07.o UNIT_TESTS/t_bht_07.ali:\
ada-compile UNIT_TESTS/t_bht_07.adb UNIT_TESTS/bht_support.ali \
UNIT_TESTS/test.ali
	./ada-compile UNIT_TESTS/t_bht_07.adb

UNIT_TESTS/t_bht_08:\
ada-bind ada-link UNIT_TESTS/t_bht_08.ald UNIT_TESTS/t_bht_08.ali \
UNIT_TESTS/bht_support.ali cgbc-bounded_hashed_maps.ali cgbc.ali \
UNIT_TESTS/test.ali
	./ada-bind UNIT_TESTS/t_bht_08.ali
	./ada-link UNIT_TESTS/t_bht_08 UNIT_TESTS/t_bht_08.ali

UNIT_TESTS/t_bht_08.o UNIT_TESTS/t_bht_08.ali:\
ada-compile UNIT_TESTS/t_bht_08.adb UNIT_TESTS/bht_support.ali \
UNIT_TESTS/test.ali
	./ada-compile UNIT_TESTS/t_bht_08.adb

UNIT_TESTS/t_bht_09:\
ada-bind ada-link UNIT_TESTS/t_bht_09.ald UNIT_TESTS/t_bht_09.ali \
UNIT_TESTS/bht_support.ali cgbc-bounded_hashed_maps.ali cgbc.ali \
UNIT_TESTS/test.ali
	./ada-bind UNIT_TESTS/t_bht_09.ali
	./ada-link UNIT_TESTS/t_bht_09 UNIT_TESTS/t_bht_09.ali

UNIT_TESTS/t_bht_09.o UNIT_TESTS/t_bht_09.ali:\
ada-compile UNIT_TESTS/t_bht_09.adb UNIT_TESTS/bht_support.ali \
UNIT_TESTS/test.ali
	./ada-compile UNIT_TESTS/t_bht_09.adb

UNIT_TESTS/t_bht_10:\
ada-bind ada-link UNIT_TESTS/t_bht_10.ald UNIT_TESTS/t_bht_10.ali \
UNIT_TESTS/bht_support.ali cgbc-bounded_hashed_maps.ali cgbc.ali \
UNIT_TESTS/test.ali
	./ada-bind UNIT_TESTS/t_bht_10.ali
	./ada-link UNIT_TESTS/t_bht_10 UNIT_TESTS/t_bht_10.ali

UNIT_TESTS/t_bht_10.o UNIT_TESTS/t_bht_10.ali:\
ada-compile UNIT_TESTS/t_bht_10.adb UNIT_TESTS/bht_support.ali \
UNIT_TESTS/test.ali
	./ada-compile UNIT_TESTS/t_bht_10.adb

UNIT_TESTS/t_bht_11:\
ada-bind ada-link UNIT_TESTS/t_bht_11.ald UNIT_TESTS/t_bht_11.ali \
UNIT_TESTS/bht_support.ali cgbc-bounded_hashed_maps.ali cgbc.ali \
UNIT_TESTS/test.ali
	./ada-bind UNIT_TESTS/t_bht_11.ali
	./ada-link UNIT_TESTS/t_bht_11 UNIT_TESTS/t_bht_11.ali

UNIT_TESTS/t_bht_11.o UNIT_TESTS/t_bht_11.ali:\
ada-compile UNIT_TESTS/t_bht_11.adb UNIT_TESTS/bht_support.ali \
UNIT_TESTS/test.ali
	./ada-compile UNIT_TESTS/t_bht_11.adb

UNIT_TESTS/t_bht_12:\
ada-bind ada-link UNIT_TESTS/t_bht_12.ald UNIT_TESTS/t_bht_12.ali \
UNIT_TESTS/bht_support.ali cgbc-bounded_hashed_maps.ali cgbc.ali \
UNIT_TESTS/test.ali
	./ada-bind UNIT_TESTS/t_bht_12.ali
	./ada-link UNIT_TESTS/t_bht_12 UNIT_TESTS/t_bht_12.ali

UNIT_TESTS/t_bht_12.o UNIT_TESTS/t_bht_12.ali:\
ada-compile UNIT_TESTS/t_bht_12.adb UNIT_TESTS/bht_support.ali \
UNIT_TESTS/test.ali
	./ada-compile UNIT_TESTS/t_bht_12.adb

UNIT_TESTS/t_bht_13:\
ada-bind ada-link UNIT_TESTS/t_bht_13.ald UNIT_TESTS/t_bht_13.ali \
UNIT_TESTS/bht_support.ali cgbc-bounded_hashed_maps.ali cgbc.ali \
UNIT_TESTS/test.ali
	./ada-bind UNIT_TESTS/t_bht_13.ali
	./ada-link UNIT_TESTS/t_bht_13 UNIT_TESTS/t_bht_13.ali

UNIT_TESTS/t_bht_13.o UNIT_TESTS/t_bht_13.ali:\
ada-compile UNIT_TESTS/t_bht_13.adb UNIT_TESTS/bht_support.ali \
UNIT_TESTS/test.ali
	./ada-compile UNIT_TESTS/t_bht_13.adb

UNIT_TESTS/t_bht_14:\
ada-bind ada-link UNIT_TESTS/t_bht_14.ald UNIT_TESTS/t_bht_14.ali \
UNIT_TESTS/bht_support.ali cgbc-bounded_hashed_maps.ali cgbc.ali \
UNIT_TESTS/test.ali
	./ada-bind UNIT_TESTS/t_bht_14.ali
	./ada-link UNIT_TESTS/t_bht_14 UNIT_TESTS/t_bht_14.ali

UNIT_TESTS/t_bht_14.o UNIT_TESTS/t_bht_14.ali:\
ada-compile UNIT_TESTS/t_bht_14.adb UNIT_TESTS/bht_support.ali \
UNIT_TESTS/test.ali
	./ada-compile UNIT_TESTS/t_bht_14.adb

UNIT_TESTS/test.o UNIT_TESTS/test.ali:\
ada-compile UNIT_TESTS/test.adb UNIT_TESTS/test.ads
	./ada-compile UNIT_TESTS/test.adb

ada-bind:\
conf-adabind conf-systype conf-adatype conf-adafflist flags-cwd

ada-compile:\
conf-adacomp conf-adatype conf-systype conf-adacflags conf-adafflist flags-cwd

ada-link:\
conf-adalink conf-adatype conf-systype conf-adaldflags

ada-srcmap:\
conf-adacomp conf-adatype conf-systype

ada-srcmap-all:\
ada-srcmap conf-adacomp conf-adatype conf-systype

cc-compile:\
conf-cc conf-cctype conf-systype

cc-link:\
conf-ld conf-ldtype conf-systype

cc-slib:\
conf-systype

cgbc-bounded_hashed_maps.o cgbc-bounded_hashed_maps.ali:\
ada-compile cgbc-bounded_hashed_maps.adb cgbc-bounded_hashed_maps.ads
	./ada-compile cgbc-bounded_hashed_maps.adb

cgbc.o cgbc.ali:\
ada-compile cgbc.ads cgbc.ads
	./ada-compile cgbc.ads

conf-adatype:\
mk-adatype
	./mk-adatype > conf-adatype.tmp && mv conf-adatype.tmp conf-adatype

conf-cctype:\
conf-cc mk-cctype
	./mk-cctype > conf-cctype.tmp && mv conf-cctype.tmp conf-cctype

conf-ldtype:\
conf-ld mk-ldtype
	./mk-ldtype > conf-ldtype.tmp && mv conf-ldtype.tmp conf-ldtype

conf-systype:\
mk-systype
	./mk-systype > conf-systype.tmp && mv conf-systype.tmp conf-systype

mk-adatype:\
conf-adacomp conf-systype

mk-cctype:\
conf-cc conf-systype

mk-ctxt:\
mk-mk-ctxt
	./mk-mk-ctxt

mk-ldtype:\
conf-ld conf-systype conf-cctype

mk-mk-ctxt:\
conf-cc conf-ld

mk-systype:\
conf-cc conf-ld

clean-all: tests_clean obj_clean ext_clean
clean: obj_clean
obj_clean:
	rm -f UNIT_TESTS/bht_support.ali UNIT_TESTS/bht_support.o UNIT_TESTS/t_bht_01 \
	UNIT_TESTS/t_bht_01.ali UNIT_TESTS/t_bht_01.o UNIT_TESTS/t_bht_02 \
	UNIT_TESTS/t_bht_02.ali UNIT_TESTS/t_bht_02.o UNIT_TESTS/t_bht_03 \
	UNIT_TESTS/t_bht_03.ali UNIT_TESTS/t_bht_03.o UNIT_TESTS/t_bht_04 \
	UNIT_TESTS/t_bht_04.ali UNIT_TESTS/t_bht_04.o UNIT_TESTS/t_bht_05 \
	UNIT_TESTS/t_bht_05.ali UNIT_TESTS/t_bht_05.o UNIT_TESTS/t_bht_06 \
	UNIT_TESTS/t_bht_06.ali UNIT_TESTS/t_bht_06.o UNIT_TESTS/t_bht_07 \
	UNIT_TESTS/t_bht_07.ali UNIT_TESTS/t_bht_07.o UNIT_TESTS/t_bht_08 \
	UNIT_TESTS/t_bht_08.ali UNIT_TESTS/t_bht_08.o UNIT_TESTS/t_bht_09 \
	UNIT_TESTS/t_bht_09.ali UNIT_TESTS/t_bht_09.o UNIT_TESTS/t_bht_10 \
	UNIT_TESTS/t_bht_10.ali UNIT_TESTS/t_bht_10.o UNIT_TESTS/t_bht_11 \
	UNIT_TESTS/t_bht_11.ali UNIT_TESTS/t_bht_11.o UNIT_TESTS/t_bht_12 \
	UNIT_TESTS/t_bht_12.ali UNIT_TESTS/t_bht_12.o UNIT_TESTS/t_bht_13 \
	UNIT_TESTS/t_bht_13.ali UNIT_TESTS/t_bht_13.o UNIT_TESTS/t_bht_14 \
	UNIT_TESTS/t_bht_14.ali UNIT_TESTS/t_bht_14.o UNIT_TESTS/test.ali \
	UNIT_TESTS/test.o cgbc-bounded_hashed_maps.ali cgbc-bounded_hashed_maps.o
	rm -f cgbc.ali cgbc.o
ext_clean:
	rm -f conf-adatype conf-cctype conf-ldtype conf-systype mk-ctxt

regen:\
ada-srcmap ada-srcmap-all
	./ada-srcmap-all
	cpj-genmk > Makefile.tmp && mv Makefile.tmp Makefile
