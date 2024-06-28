reset_mode <- function() {
  lineclearJuliaTerminal()
  execJuliaTerminal("\b")
  slp()
}
cur_mode <- function() {
  buffer <- getJuliaTerminalBuffer()
  execs <- which(grepl("^(R|julia|shell)>", buffer))
  last_exec <- execs[length(execs)]
  gsub(">.*$", "", buffer[last_exec])
}
is_mode <- function(x) {
  identical(x, cur_mode())
}

activate_repl <- function(x = c("julia", "r", "shell"), show = TRUE) {
  x <- match.arg(x)
  reset_mode()
  if (x == "r" && !is_mode("r")) execJuliaTerminal("$")
  if (x == "shell" && !is_mode("shell")) execJuliaTerminal(";")
  if (show) toJuliaTerminal()
}
