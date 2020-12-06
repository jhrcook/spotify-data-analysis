Spotify Data Preparation
================
Joshua Cook
12/6/2020

## Streaming History

``` r
streaming_history_path <- file.path(raw_data_dir, "StreamingHistory1.json")
rjson::fromJSON(file = streaming_history_path) %.% {
  head()
  map(as_tibble)
  bind_rows()
  janitor::clean_names()
  mutate(
    end_time = lubridate::ymd_hm(end_time),
    duration_played = lubridate::as.period(ms_played / 1e3, unit = "seconds")
  )
  select(-ms_played)
}
```

    #> # A tibble: 6 x 4
    #>   end_time            artist_name  track_name             duration_played
    #>   <dttm>              <chr>        <chr>                  <Period>
    #> 1 2020-07-06 20:26:00 Ryan Vasquez Pray                   56.36S
    #> 2 2020-07-07 17:26:00 Jon Bellion  He Is The Same         241.202S
    #> 3 2020-07-07 17:29:00 Jon Bellion  80's Films             216.036S
    #> 4 2020-07-07 17:33:00 Jon Bellion  All Time Low           217.603S
    #> 5 2020-07-07 17:37:00 Jon Bellion  New York Soul - Pt. ii 267.862S
    #> 6 2020-07-07 17:41:00 Jon Bellion  Fashion                235.751S
