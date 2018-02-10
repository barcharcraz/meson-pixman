project('pixman', 'c',
    version: '0.34.0'
)

pixman_sources = files(
'pixman/pixman.c',
'pixman/pixman-access.c',
'pixman/pixman-access-accessors.c',
'pixman/pixman-bits-image.c',
'pixman/pixman-combine32.c',
'pixman/pixman-combine-float.c',
'pixman/pixman-conical-gradient.c',
'pixman/pixman-filter.c',
'pixman/pixman-x86.c',
'pixman/pixman-mips.c',
'pixman/pixman-arm.c',
'pixman/pixman-ppc.c',
'pixman/pixman-edge.c',
'pixman/pixman-edge-accessors.c',
'pixman/pixman-fast-path.c',
'pixman/pixman-glyph.c',
'pixman/pixman-general.c',
'pixman/pixman-gradient-walker.c',
'pixman/pixman-image.c',
'pixman/pixman-implementation.c',
'pixman/pixman-linear-gradient.c',
'pixman/pixman-matrix.c',
'pixman/pixman-noop.c',
'pixman/pixman-radial-gradient.c',
'pixman/pixman-region16.c',
'pixman/pixman-region32.c',
'pixman/pixman-solid-fill.c',
'pixman/pixman-timer.c',
'pixman/pixman-trap.c',
'pixman/pixman-utils.c'
)
pixman_headers = files(
'pixman/pixman.h',
'pixman/pixman-accessor.h',
'pixman/pixman-combine32.h',
'pixman/pixman-compiler.h',
'pixman/pixman-edge-imp.h',
'pixman/pixman-inlines.h',
'pixman/pixman-private.h'
)


if get_option('enable-mmx')
    pixman_sources += files('pixman/pixman-mmx.c')
    add_project_arguments('-DUSE_X86_MMX', language: 'c')
endif
if get_option('enable-sse2')
    pixman_sources += files('pixman/pixman-sse2.c')
    add_project_arguments('-DUSE_SSE2', language: 'c')
endif
if get_option('enable-ssse3')
    pixman_sources += files('pixman/pixman-ssse3.c')
    add_project_arguments('-DUSE_SSSE3', language: 'c')
endif
add_project_arguments('-DPACKAGE=pixman-1',
                      '-DPACKAGE_VERSION=""',
                      '-DPACKAGE_BUGREPORT=""', language: 'c')

pixman_lib = library('pixman-1', pixman_sources,
    install: true,
    include_directories: include_directories('pixman'),
    vs_module_defs: 'pixman.def')

install_headers(pixman_headers, subdir: 'pixman-1')
pkg = import('pkgconfig')

pkg.generate(name: 'Pixman',
             filebase: 'pixman-1',
             description: 'The pixman library (version 1)',
             libraries: pixman_lib,
             subdirs: 'pixman-1',
             version: '0.34.0')