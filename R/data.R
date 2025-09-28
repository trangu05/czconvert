#' PUMA to Commuting Zone Crosswalk (2000 vintage)
#'
#' A dataset containing crosswalk weights from PUMA 2000 to CZ90
#'
#' @format A data frame with columns:
#' \describe{
#'   \item{puma}{6-character PUMA code}
#'   \item{cz90}{Commuting Zone code}
#'   \item{afactor}{Allocation factor}
#' }
#' @source Autor, David and David Dorn (2013).
#'   "The Growth of Low Skill Service Jobs and the Polarization of the U.S. Labor Market."
#'   *American Economic Review*, 103(5): 1553-1597.
#'   Crosswalk data available at \url{https://www.ddorn.net/data.htm}.

"cw_puma2000_czone"

#' PUMA to Commuting Zone Crosswalk (2010 vintage)
#'
#' A dataset containing crosswalk weights from PUMA 2010 to CZ90
#'
#' @format A data frame with columns:
#' \describe{
#'   \item{puma}{6-character PUMA code}
#'   \item{cz90}{Commuting Zone code}
#'   \item{afactor}{Allocation factor}
#' }
#' @source Autor, David, David Dorn, and Gordon Hanson (2019).
#'   "When Work Disappears: Manufacturing Decline and the Falling Marriage-Market Value of Young Men."
#'   *American Economic Review: Insights*, 1(2): 161-178.
#'   Crosswalk data available at \url{https://www.ddorn.net/data.htm}.

"cw_puma2010_czone"

#' PUMA to Commuting Zone Crosswalk (2020 vintage)
#'
#' A dataset containing crosswalk weights from PUMA 2020 to CZ90
#'
#' @format A data frame with columns:
#' \describe{
#'   \item{puma}{6-character PUMA code}
#'   \item{cz90}{Commuting Zone code}
#'   \item{afactor}{Allocation factor}
#' }
#' #' @source Constructed by the author, following the
#'   methodology described in Dorn (2009).
#'   See Dorn’s original commuting zone crosswalks at \url{https://www.ddorn.net/data.htm}.

"cw_puma2020_czone"
