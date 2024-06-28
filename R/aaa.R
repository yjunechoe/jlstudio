this <- new.env()

get_id <- function() {
  this$id
}
set_id <- function(x) {
  assign("id", x, envir = this)
}

slp <- function() Sys.sleep(.1)
