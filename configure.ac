AC_INIT([build.sh])

AC_ARG_ENABLE(qmp-mvia-version,
	AC_HELP_STRING([--enable-qmp-mvia-version],
	[Select version of qmp-mvia to use, default is qmp-mvia-mesh-2-4 ]),
	[ac_qmp_mvia_vers=${enableval}],
	[ac_qmp_mvia_vers="qmp-mvia-mesh-2-4"]
)
AC_SUBST(QMP_MVIA_VERSION, [${ac_qmp_mvia_vers}])

AC_ARG_ENABLE(qmp-version,
	AC_HELP_STRING([--enable-qmp-version],
	[Select version of MPI qmp to use, default is qmp2-1-3 ]),
	[ac_qmp_vers=${enableval}],
	[ac_qmp_vers="qmp2-1-5"]
)
AC_SUBST(QMP_VERSION, [${ac_qmp_vers}])

AC_ARG_ENABLE(qdp-version,
	AC_HELP_STRING([--enable-qdp-version],
	[Select version of qdp++ to use, default is qdp1-20-2 ]),
	[ac_qdp_vers=${enableval}],
	[ac_qdp_vers="qdp1-20-5"]
)
AC_SUBST(QDP_VERSION, [${ac_qdp_vers}])

AC_ARG_ENABLE(chroma-version,
	AC_HELP_STRING([--enable-chroma-version],
	[Select version of chroma to use, default is chroma3-2-1 ]),
	[ac_chroma_vers=${enableval}],
	[ac_chroma_vers="chroma3-4-3"]
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
	[Select version of bagel to use, default is bagel_qdp1-1-5 ]),
	[ac_bagel_qdp_vers=${enableval}],
	[ac_bagel_qdp_vers="bagel_qdp1-1-6"]
)
AC_SUBST(BAGEL_QDP_VERSION, [${ac_bagel_qdp_vers}])


AC_ARG_ENABLE(install-root,
	AC_HELP_STRING([--enable-install-root],
	[ Select a root directory to install all the packages to. Default is /usr/local ]),
	[ac_install_root=${enableval}],
	[ac_install_root="/usr/local"]
)


AC_SUBST(SFW_INSTALL_ROOT,[${ac_install_root}])

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


AC_OUTPUT