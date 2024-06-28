startJuliaTerminal <- function(show = TRUE, RCall = TRUE) {
  set_id(rstudioapi::terminalCreate(caption = "Julia"))
  rstudioapi::terminalSend(get_id(), "julia\n")
  Sys.sleep(.5)
  rstudioapi::terminalSend(get_id(), "using RCall\n")
  if (show) toJuliaTerminal()
}

findJuliaTerminal <- function() {
  terminals <- lapply(rstudioapi::terminalList(), rstudioapi::terminalContext)
  julia_terminal <- which(sapply(terminals, `[[`, "caption") == "Julia")
  if (length(julia_terminal) == 0) {
    return(NULL)
  } else {
    terminals[[julia_terminal]]
  }
}

toJuliaTerminal <- function() {
  rstudioapi::terminalActivate(get_id())
}
onJuliaTerminal <- function() {
  get_id() %in% rstudioapi::terminalList()
}

stopJuliaTerminal <- function() {
  if (is.null(get_id())) {
    julia_terminal <- findJuliaTerminal()$handle
    if (!is.null(julia_terminal)) rstudioapi::terminalKill(julia_terminal)
  } else {
    rstudioapi::terminalKill(get_id())
  }
  set_id(NULL)
}
restartJuliaTerminal <- function(...) {
  stopJuliaTerminal()
  startJuliaTerminal(...)
}

execJuliaTerminal <- function(x, show = TRUE) {
  rstudioapi::terminalSend(get_id(), x)
  if (show) toJuliaTerminal()
}
lineclearJuliaTerminal <- function() {
  execJuliaTerminal("\033\b")
}
getJuliaTerminalBuffer <- function() {
  rstudioapi::terminalBuffer(get_id())
}

infoJuliaTerminal <- function() {
  rstudioapi::terminalContext(get_id())
}
