year = 2018 #Change the year as per your need
for month in {01..12}
do
  mkdir $month
  cd $month
  for day in {01..31}
  do
    mkdir $day
    cd $day
    randomHours=$((RANDOM % 12)) # To add a randomness to the commits
    for ((hour=1; hour <= randomHours; hour++)); do
      echo "$hour on $month/$day/$year" > commit.md
      export GIT_COMMITTER_DATE="$year-$month-$day $hour:00:00"
      export GIT_AUTHOR_DATE="$year-$month-$day $hour:00:00"
      git add commit.md -f
      git commit --date="$year-$month-$day 0$hour:00:00" -m "$hour on $month $day $year"
    done # End of Hour Loop
    cd ../
  done # End of Day Loop
  cd ../
done # End of Month Loop
git push origin master
git rm -rf 0*
git rm -rf 1*
git commit -am "cleanup"
git push origin master
