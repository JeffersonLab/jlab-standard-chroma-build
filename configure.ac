AC_INIT([build.sh.in])

AC_ARG_ENABLE(qmp-mvia-version,
	AC_HELP_STRING([--enable-qmp-mvia-version],
	[Select version of qmp-mvia to use, default is qmp-mvia-mesh-2-4]),
	[ac_qmp_mvia_vers=${enableval}],
	[ac_qmp_mvia_vers="qmp-mvia-mesh-2-4"]
)
AC_SUBST(QMP_MVIA_VERSION, [${ac_qmp_mvia_vers}])


AC_ARG_ENABLE(gmp-version,
	AC_HELP_STRING([--enable-gmp-version],
	[Select version of GMP to use, default is gmp4.2.1]),
	[ac_gmp_vers=${enableval}],
	[ac_gmp_vers="4.2.1"]
)
AC_SUBST(GMP_VERSION, [${ac_gmp_vers}])


AC_ARG_ENABLE(qmt-version,
	AC_HELP_STRING([--enable-qmt-version],
	[Select version of QMT to use, default is master]),
	[ac_qmt_vers=${enableval}],
	[ac_qmt_vers="master"]
)
AC_SUBST(QMT_VERSION, [${ac_qmt_vers}])


AC_ARG_ENABLE(qmp-version,
	AC_HELP_STRING([--enable-qmp-version],
	[Select version of MPI qmp to use, default is qmp2-1-6]),
	[ac_qmp_vers=${enableval}],
	[ac_qmp_vers="qmp2-1-6"]
)
AC_SUBST(QMP_VERSION, [${ac_qmp_vers}])

AC_ARG_ENABLE(qdp-version,
	AC_HELP_STRING([--enable-qdp-version],
	[Select version of qdpxx to use, default is qdp1-35-0]),
	[ac_qdp_vers=${enableval}],
	[ac_qdp_vers="qdp1-35-0"]
)
AC_SUBST(QDP_VERSION, [${ac_qdp_vers}])

AC_ARG_ENABLE(chroma-version,
	AC_HELP_STRING([--enable-chroma-version],
	[Select version of chroma to use, default is chroma3-36-2]),
	[ac_chroma_vers=${enableval}],
	[ac_chroma_vers="chroma3-36-2"]
)
AC_SUBST(CHROMA_VERSION, [${ac_chroma_vers}])

AC_ARG_ENABLE(bagel-version,
	AC_HELP_STRING([--enable-bagel-version],
	[Select version of bagel to use, default is 1.4.0]),
	[ac_bagel_vers=${enableval}],
	[ac_bagel_vers="1.4.0"]
)
AC_SUBST(BAGEL_VERSION, [${ac_bagel_vers}])

AC_ARG_ENABLE(bagel-wilson-dslash-version,
	AC_HELP_STRING([--enable-bagel-wilson-dslash-version],
	[Select version of bagel to use, default is 1.4.6]),
	[ac_bagel_wilson_dslash_vers=${enableval}],
	[ac_bagel_wilson_dslash_vers="1.4.6"]
)
AC_SUBST(BAGEL_WILSON_DSLASH_VERSION, [${ac_bagel_wilson_dslash_vers}])

AC_ARG_ENABLE(bagel-clover-version,
        AC_HELP_STRING([--enable-bagel-clover-version],
        [Select version of bagel to use, default is master]),
        [ac_bagel_wilson_dslash_vers=${enableval}],
        [ac_bagel_wilson_dslash_vers="master"]
)
AC_SUBST(BAGEL_CLOVER_VERSION, [${ac_bagel_wilson_dslash_vers}])

AC_ARG_ENABLE(bagel-qdp-version,
	AC_HELP_STRING([--enable-bagel-qdp-version],
	[Select version of bagel to use, default is bagel_qdp1-1-7]),
	[ac_bagel_qdp_vers=${enableval}],
	[ac_bagel_qdp_vers="bagel_qdp1-1-7"]
)
AC_SUBST(BAGEL_QDP_VERSION, [${ac_bagel_qdp_vers}])

AC_ARG_ENABLE(adat-version,
	AC_HELP_STRING([--enable-adat-version],
	[Select version of adat to use, default is adat2-27-0]),
	[ac_adat_vers=${enableval}],
	[ac_adat_vers="adat2-27-0"]
)
AC_SUBST(ADAT_VERSION, [${ac_adat_vers}])

AC_ARG_ENABLE(tensor-version,
	AC_HELP_STRING([--enable-tensor-version],
	[Select version of tensor to use, default is tensor1-0-0]),
	[ac_adat_vers=${enableval}],
	[ac_adat_vers="tensor1-0-0"]
)
AC_SUBST(TENSOR_VERSION, [${ac_tensor_vers}])

AC_ARG_ENABLE(hadron-version,
	AC_HELP_STRING([--enable-hadron-version],
	[Select version of hadron to use, default is hadron1-0-0]),
	[ac_adat_vers=${enableval}],
	[ac_adat_vers="hadron1-0-0"]
)
AC_SUBST(HADRON_VERSION, [${ac_hadron_vers}])

AC_ARG_ENABLE(colorvec-version,
	AC_HELP_STRING([--enable-colorvec-version],
	[Select version of colorvec to use, default is colorvec1-0-0]),
	[ac_adat_vers=${enableval}],
	[ac_adat_vers="colorvec1-0-0"]
)
AC_SUBST(COLORVEC_VERSION, [${ac_colorvec_vers}])

AC_ARG_ENABLE(sfpcac-version,
	AC_HELP_STRING([--enable-sfpcac-version],
	[Select version of sfpcac to use, default is sfpcac-0-0]),
	[ac_adat_vers=${enableval}],
	[ac_adat_vers="sfpcac1-0-0"]
)
AC_SUBST(SFPCAC_VERSION, [${ac_sfpcac}])

AC_ARG_ENABLE(redstar-version,
	AC_HELP_STRING([--enable-redstar-version],
	[Select version of redstar to use, default is redstar1-0-0]),
	[ac_adat_vers=${enableval}],
	[ac_adat_vers="redstar1-0-0"]
)
AC_SUBST(REDSTAR_VERSION, [${ac_redstar_vers}])

AC_ARG_ENABLE(libxml2-version,
	AC_HELP_STRING([--enable-libxml2-version],
	["Select version of libxml to use, default is 2.6.24"]),
	[ac_libxml2_vers=${enableval}],
	[ac_libxml2_vers="2.6.24"]
)
AC_SUBST(LIBXML2_VERSION, [${ac_libxml2_vers}])

AC_ARG_ENABLE(install-root,
	AC_HELP_STRING([--enable-install-root],
	[ Select a root directory to install all the packages to. Default is /dist/scidac ]),
	[ac_install_root=${enableval}],
	[ac_install_root="/dist/scidac"]
)

AC_ARG_ENABLE(git-root,
	AC_HELP_STRING([--enable-git-root],
	   [ Point to root of a git tree ]),
	[ git_root=${enableval} ],
        [ git_root="git://git.jlab.org/pub/lattice/usqcd" ]
)

AC_SUBST(GIT_ROOT, [${git_root}])

AC_SUBST(SFW_INSTALL_ROOT,[${ac_install_root}])

AC_ARG_ENABLE(parallel-make,
	AC_HELP_STRING([--enable-parallel-make=N],
	[enables the -j N option to make to allow for parallel builds]),
	[ac_make_threads=${enableval}],
	[ac_make_threads=""]
)

AC_ARG_ENABLE(mailto,
	AC_HELP_STRING([--enable-mailto=List of email addreses],
	[Sent mail to the list of addresses]),
	[ac_mailto=${enableval}],
	[ac_mailto="nobody"]
)

AC_ARG_ENABLE(build-name,
	AC_HELP_STRING([--enable-build-name],
	[Set the name of the build for mail messages]),
	[ac_build_name=${enableval}],
	[ac_build_name="Buildtest"]
)

if test "X${ac_make_threads}X" != "XX" ;
then 
     MAKE_ARGS=" -j ${ac_make_threads}"
else
     MAKE_ARGS=""
fi 


AC_SUBST(MAKE_ARGS,[${MAKE_ARGS}])
AC_SUBST(MAILTO, [${ac_mailto}])
AC_SUBST(BUILDNAME,[${ac_build_name}])

AC_CONFIG_FILES(bagel/PREFIX)
AC_CONFIG_FILES(bagel/VERSION)

AC_CONFIG_FILES(bagel_wilson_dslash/PREFIX)
AC_CONFIG_FILES(bagel_wilson_dslash/VERSION)

AC_CONFIG_FILES(bagel_qdp/PREFIX)
AC_CONFIG_FILES(bagel_qdp/VERSION)

AC_CONFIG_FILES(bagel_clover/PREFIX)
AC_CONFIG_FILES(bagel_clover/VERSION)

AC_CONFIG_FILES(qmp-mvia-mesh/PREFIX)
AC_CONFIG_FILES(qmp-mvia-mesh/VERSION)

AC_CONFIG_FILES(gmp/PREFIX)
AC_CONFIG_FILES(gmp/VERSION)

AC_CONFIG_FILES(qmt/PREFIX)
AC_CONFIG_FILES(qmt/VERSION)

AC_CONFIG_FILES(qmp/PREFIX)
AC_CONFIG_FILES(qmp/VERSION)

AC_CONFIG_FILES(qdpxx/PREFIX)
AC_CONFIG_FILES(qdpxx/VERSION)

AC_CONFIG_FILES(chroma/PREFIX)
AC_CONFIG_FILES(chroma/VERSION)

AC_CONFIG_FILES(adat/PREFIX)
AC_CONFIG_FILES(adat/VERSION)

AC_CONFIG_FILES(tensor/PREFIX)
AC_CONFIG_FILES(tensor/VERSION)

AC_CONFIG_FILES(hadron/PREFIX)
AC_CONFIG_FILES(hadron/VERSION)

AC_CONFIG_FILES(colorvec/PREFIX)
AC_CONFIG_FILES(colorvec/VERSION)

AC_CONFIG_FILES(sfpcac/PREFIX)
AC_CONFIG_FILES(sfpcac/VERSION)

AC_CONFIG_FILES(redstar/PREFIX)
AC_CONFIG_FILES(redstar/VERSION)

AC_CONFIG_FILES(libxml2/PREFIX)
AC_CONFIG_FILES(libxml2/VERSION)

AC_CONFIG_FILES(build.sh)
AC_CONFIG_COMMANDS(build,[chmod u+x ./build.sh])

AC_CONFIG_FILES(build-git.sh)
AC_CONFIG_COMMANDS(build-git,[chmod u+x ./build-git.sh])

AC_OUTPUT
