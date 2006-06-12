AC_INIT([build.sh.in])

AC_ARG_ENABLE(qmp-mvia-version,
	AC_HELP_STRING([--enable-qmp-mvia-version],
	[Select version of qmp-mvia to use, default is qmp-mvia-mesh-2-4 ]),
	[ac_qmp_mvia_vers=${enableval}],
	[ac_qmp_mvia_vers="qmp-mvia-mesh-2-4"]
)
AC_SUBST(QMP_MVIA_VERSION, [${ac_qmp_mvia_vers}])

AC_ARG_ENABLE(qmp-version,
	AC_HELP_STRING([--enable-qmp-version],
	[Select version of MPI qmp to use, default is qmp2-1-6 ]),
	[ac_qmp_vers=${enableval}],
	[ac_qmp_vers="qmp2-1-6"]
)
AC_SUBST(QMP_VERSION, [${ac_qmp_vers}])

AC_ARG_ENABLE(qdp-version,
	AC_HELP_STRING([--enable-qdp-version],
	[Select version of qdp++ to use, default is qdp1-20-6 ]),
	[ac_qdp_vers=${enableval}],
	[ac_qdp_vers="qdp1-20-6"]
)
AC_SUBST(QDP_VERSION, [${ac_qdp_vers}])

AC_ARG_ENABLE(chroma-version,
	AC_HELP_STRING([--enable-chroma-version],
	[Select version of chroma to use, default is chroma3-7-2 ]),
	[ac_chroma_vers=${enableval}],
	[ac_chroma_vers="chroma3-7-2"]
)
AC_SUBST(CHROMA_VERSION, [${ac_chroma_vers}])

AC_ARG_ENABLE(bagel-version,
	AC_HELP_STRING([--enable-bagel-version],
	[Select version of bagel to use, default is 1.4.0 ]),
	[ac_bagel_vers=${enableval}],
	[ac_bagel_vers="1.4.0"]
)
AC_SUBST(BAGEL_VERSION, [${ac_bagel_vers}])

AC_ARG_ENABLE(bagel-wilson-dslash-version,
	AC_HELP_STRING([--enable-bagel-wilson-dslash-version],
	[Select version of bagel to use, default is 1.4.2 ]),
	[ac_bagel_wilson_dslash_vers=${enableval}],
	[ac_bagel_wilson_dslash_vers="1.4.2"]
)
AC_SUBST(BAGEL_WILSON_DSLASH_VERSION, [${ac_bagel_wilson_dslash_vers}])

AC_ARG_ENABLE(bagel-qdp-version,
	AC_HELP_STRING([--enable-bagel-qdp-version],
	[Select version of bagel to use, default is bagel_qdp1-1-6 ]),
	[ac_bagel_qdp_vers=${enableval}],
	[ac_bagel_qdp_vers="bagel_qdp1-1-7"]
)
AC_SUBST(BAGEL_QDP_VERSION, [${ac_bagel_qdp_vers}])


AC_ARG_ENABLE(libxml2-version,
	AC_HELP_STRING([--enable-libxml2-version],
	{Select version of libxml to use, default is 2.6.24"]),
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


AC_SUBST(SFW_INSTALL_ROOT,[${ac_install_root}])

AC_ARG_ENABLE(parallel-make,
	AC_HELP_STRING([--enable-parallel-make=N],
	[ enables the -j N option to make to allow for parallel builds]),
	[ ac_make_threads=${enableval}],
	[ ac_make_threads=""]
)

AC_ARG_ENABLE(mailto,
	AC_HELP_STRING([--enable-mailto=List of email addreses ],
	[ Sent mail to the list of addresses ]),
	[ ac_mailto=${enableval} ],
	[ ac_mailto="nobody" ]
)

AC_ARG_ENABLE(build-name,
	AC_HELP_STRING([--enable-build-name ],
	[ Set the name of the build for mail messages ]),
	[ ac_build_name=${enableval} ],
	[ ac_build_name="Buildtest" ]
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

AC_CONFIG_FILES(qmp-mvia-mesh/PREFIX)
AC_CONFIG_FILES(qmp-mvia-mesh/VERSION)

AC_CONFIG_FILES(qmp/PREFIX)
AC_CONFIG_FILES(qmp/VERSION)

AC_CONFIG_FILES(qdp++/PREFIX)
AC_CONFIG_FILES(qdp++/VERSION)

AC_CONFIG_FILES(chroma/PREFIX)
AC_CONFIG_FILES(chroma/VERSION)

AC_CONFIG_FILES(libxml2/PREFIX)
AC_CONFIG_FILES(libxml2/VERSION)

AC_CONFIG_FILES(build.sh)
AC_CONFIG_COMMANDS(build,[chmod u+x ./build.sh])

AC_OUTPUT
