
<!-- README.md is generated from README.Rmd. Please edit that file -->

# docker

<!-- badges: start -->

<!-- badges: end -->

This repo provides docker images on which to run code in *Geocomputation
with R*.

The base image is `rockerdev/geospatial:3.6.3` from
[github.com/rocker-org/rocker-versioned2](https://github.com/rocker-org/rocker-versioned2/blob/master/dockerfiles/Dockerfile_geospatial_3.6.3).

To build on different system configurations we provide tags that
correspond to the following categories:

`baseimage-ubuntugis-setup-rpackages-buildbook`

The default base image is `rockerdev/geospatial:3.6.3`. More images may
be added in the future.

``` r
baseimage = c(
  rockerdev_geospatial_3.6.3 = ""
)
```

Ubuntugis options include using the `ubuntugis-unstable` and
`ubuntugis-stable` repos.

``` r
ubuntugis = c(
  no_ubuntugis = "default_repos",
  ubuntugis_unstable = "ubuntugis_unstable",
  ubuntugis_stable = "ubuntugis_stable"
)
```

Setup options can include RStudio settings (yet to be added).

R package options relate to which R packages are installed on the image
(yet to be added).

Buildbook options report whether or not the book is built:

``` r
buildbook = c(
  no = "",
  yes = "buildbook"
)
```

We will create a ‘build matrix’ covering all combinations of these
options (excluding the base image for now):

``` r
g = expand.grid(ubuntugis, buildbook, stringsAsFactors = FALSE)
g
#>                 Var1      Var2
#> 1      default_repos          
#> 2 ubuntugis_unstable          
#> 3   ubuntugis_stable          
#> 4      default_repos buildbook
#> 5 ubuntugis_unstable buildbook
#> 6   ubuntugis_stable buildbook
```

These can be converted into tags as follows:

``` r
tag_df = tidyr::unite(g, tag)
tags = gsub(pattern = "__|^_|_$", replacement = "", tag_df$tag)
tags
#> [1] "default_repos"                "ubuntugis_unstable"          
#> [3] "ubuntugis_stable"             "default_repos_buildbook"     
#> [5] "ubuntugis_unstable_buildbook" "ubuntugis_stable_buildbook"
```

We could write code to auto-generate Dockerfiles, as demonstrated in
[rocker-org/rocker-versioned2](https://github.com/rocker-org/rocker-versioned2).

For now, to start the project going, we will manually edit the files,
which can be created as follows:

``` r
new_dockerfiles = paste0("Dockerfile_", tags)
lapply(new_dockerfiles, file.copy, from = "rockerdev-ubuntugis-bookbuild/Dockerfile", TRUE)
#> [[1]]
#> [1] TRUE
#> 
#> [[2]]
#> [1] TRUE
#> 
#> [[3]]
#> [1] TRUE
#> 
#> [[4]]
#> [1] TRUE
#> 
#> [[5]]
#> [1] TRUE
#> 
#> [[6]]
#> [1] TRUE
```

Edit these files as appropriate:

``` r
file.edit("Dockerfile_ubuntugis_unstable")
```
