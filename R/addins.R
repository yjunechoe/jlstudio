get_selection <- function() {
  rstudioapi::selectionGet()$value
}
get_rchunk <- function() {
  x <- rstudioapi::getSourceEditorContext()
  cursor <- x$selection[[1]]
  range <- rstudioapi::document_range(
    start = rstudioapi::document_position(cursor$range$end[1], Inf),
    end = rstudioapi::document_position(cursor$range$end[1], Inf)
  )
}
resolve_selection <- function() {
  selection <- get_selection()
  if (nzchar(selection)) {
    selection <- selection
  }
  selection
}
send_selection_to_r <- function() {
  activate_repl("r")
  execJuliaTerminal(resolve_selection())
  execJuliaTerminal("\n\b")
}
letters

