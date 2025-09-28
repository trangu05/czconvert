#' Crosswalk PUMA codes to Commuting Zones (CZ90)
#'
#' @param df A data.frame/tibble with at least column `puma` (6-character string).
#' @param puma_vintage One of "2000","2010","2020". Matches your microdata PUMA coding.
#' @param to_cz Which CZ definition to output. For now, fixed to "cz90".
#' @param method Mapping mode:
#'   - "m:m" keeps many-to-many using `afactor` shares
#'   - "1:1" collapses to the single dominant CZ per PUMA
#'
#' @return Input `df` with added columns `cz90` and `afactor`.
#'
#' @details
#' With `method = "m:m"`, each PUMA record may appear multiple times,
#' once per commuting zone, with weights in `afactor`.
#' With `method = "1:1"`, each PUMA is assigned to its dominant commuting zone.
#'
#' @examples
#' df <- tibble::tibble(id = 1:3, puma = c("100100","100200","100100"))
#' puma_to_cz(df, puma_vintage = "2000", method = "m:m")
#' puma_to_cz(df, puma_vintage = "2000", method = "1:1")
#'
#' @export
puma_to_cz <- function(
    df,
    puma_vintage = c("2000","2010","2020"),
    to_cz = "cz90",
    method = c("m:m", "1:1")
) {
  stopifnot(is.data.frame(df))
  puma_vintage <- match.arg(puma_vintage)
  method       <- match.arg(method)

  if (!"puma" %in% names(df)) {
    stop("`df` must contain column `puma` (6-character PUMA code).")
  }
  df <- dplyr::mutate(df, puma = as.character(.data$puma))
  if (any(nchar(df$puma) != 6L)) {
    stop("Some PUMA codes in `df$puma` are not 6 characters long.")
  }
  if (to_cz != "cz90") stop("For v0, `to_cz` must be 'cz90'.")

  # pick the packaged crosswalk by vintage
  xwalk <- switch(
    puma_vintage,
    "2000" = get("cw_puma2000_czone"),
    "2010" = get("cw_puma2010_czone"),
    "2020" = get("cw_puma2020_czone")
  )

  if (!all(c("puma","cz90","afactor") %in% names(xwalk))) {
    stop("Crosswalk must contain `puma`, `cz90`, and `afactor`.")
  }

  if (method == "1:1") {
    # pick dominant afactor per PUMA
    xwalk <- xwalk %>%
      dplyr::group_by(.data$puma) %>%
      dplyr::slice_max(order_by = .data$afactor, n = 1, with_ties = FALSE) |>
      dplyr::mutate(afactor = 1)  %>%
      dplyr::ungroup()
  }

  # left join input to crosswalk
  df2 <- dplyr::left_join(df, xwalk, by = "puma")

  df2
}
