function diffh
  # Get the second to last and last commands without leading spaces
  set --local first (echo $history[1] | sed 's/^ //')
  set --local second (echo $history[2] | sed 's/^ //')

  # Build diff command
  # set command (printf 'diff <( %s ) <( %s )' "$first" "$second")
  set command (printf 'diff ( %s|psub ) ( %s|psub )' "$first" "$second")

  # Print and run diff
  eval $command
  set --local tmpstatus $status
  # Update history with diff command
  history delete --case-sensitive --exact "$command"
  # Return exit code
  return $tmpstatus
end
