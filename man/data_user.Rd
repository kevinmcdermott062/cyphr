% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/data.R
\name{data_request_access}
\alias{data_request_access}
\alias{data_key}
\title{User commands}
\usage{
data_request_access(path_data, path_user = NULL, quiet = FALSE)

data_key(path_data, path_user = NULL, test = TRUE, quiet = FALSE)
}
\arguments{
\item{path_data}{Path to the data}

\item{path_user}{Path to the directory with your user key.
Usually this can be omitted.  Use the \code{cyphr.user.path}
global option (i.e., via \code{options()}) to set this more
conveniently.}

\item{quiet}{Suppress printing of informative messages.}

\item{test}{Test that the encryption is working?  (Recommended)}
}
\description{
User commands
}
\examples{

# The workflow here does not really lend itself to an example,
# please see the vignette.

# Suppose that Alice has created a data directory:
path_alice <- tempfile()
cyphr::ssh_keygen(path_alice, password = FALSE)
path_data <- tempfile()
dir.create(path_data, FALSE, TRUE)
cyphr::data_admin_init(path_data, path_user = path_alice)

# If Bob can also write to the data directory (e.g., it is a
# shared git repo, on a shared drive, etc), then he can request
# access
path_bob <- tempfile()
cyphr::ssh_keygen(path_bob, password = FALSE)
hash <- cyphr::data_request_access(path_data, path_user = path_bob)

# Alice can authorise Bob
cyphr::data_admin_authorise(path_data, path_user = path_alice, yes = TRUE)

# After which Bob can get the data key
cyphr::data_key(path_data, path_user = path_bob)

# See the vignette for more details.  This is not the best medium
# to explore this.

# Cleanup
unlink(path_alice, recursive = TRUE)
unlink(path_bob, recursive = TRUE)
unlink(path_data, recursive = TRUE)
}
