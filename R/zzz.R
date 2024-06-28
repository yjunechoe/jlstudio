.onLoad <- function(libname, pkgname) {
  if (interactive() && rstudioapi::showQuestion("jlstudio", "Start Julia?")) {
    restartJuliaTerminal()
  }
}
