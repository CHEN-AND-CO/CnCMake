PHONY += addClassCpp addPathfindingCpp addExceptionCpp addClassSfml addWindowSfml addWindowOpenGL addClassC

addClassCpp:
	"$(TEMPDIR)/addCPPClass" "$(TEMPDIR)"

addPathfindingCpp:
	"$(TEMPDIR)/addCPPPathfinding" "$(TEMPDIR)"

addExceptionCpp:
	"$(TEMPDIR)/addCPPException" "$(TEMPDIR)"

addClassSfml:
	"$(TEMPDIR)/addSFMLClass" "$(TEMPDIR)"

addWindowSfml:
	"$(TEMPDIR)/addSFMLWindow" "$(TEMPDIR)" "$(NAME_NEW_FILE)"

addWindowOpenGL:
	"$(TEMPDIR)/addOPENGLWindow" "$(TEMPDIR)" "$(NAME_NEW_FILE)"

addClassC:
	"$(TEMPDIR)/addCClass" "$(TEMPDIR)"

\\include rules_addlib.mk
