PgSearch.multisearch_options = {
  :using => {
    :tsearch => {
      :highlight => {
        :start_sel => '<b>',
        :stop_sel => '</b>'
      }
    }
  }
}
# this doesn't seem to work. I don't know why. Maybe my postgresql is too old?