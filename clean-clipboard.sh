pbpaste | awk '
{
  while (match($0, /[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,}|https?:\/\/[^[:space:]]+|[A-Za-z0-9.-]+\.[A-Za-z]{2,}(\/[^[:space:]]*)?|[0-9]{5,}|[Pp][Aa][Ss][Ss].*/)) {
    m = substr($0,RSTART,RLENGTH)
    if (RLENGTH > 2) {
      r = substr(m,1,1) sprintf("%*s", RLENGTH-2, "") substr(m,RLENGTH,1)
      gsub(/ /, "X", r)
    } else {
      r = m
    }
    print "Removed:", m > "/dev/stderr"
    $0 = substr($0,1,RSTART-1) r substr($0,RSTART+RLENGTH)
  }
  print
}' | pbcopy
