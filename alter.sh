year = 2018
for month in {01..12}
do
  mkdir $month
  cd $month
  for day in {01..31}
  do
    mkdir $day
    cd $day
    randomHours=$((RANDOM % 12))
    for ((hour=1; hour <= randomHours; hour++)); do
      echo "$hour on $month/$day/$year" > commit.md
      export GIT_COMMITTER_DATE="$year-$month-$day $hour:00:00"
      export GIT_AUTHOR_DATE="$year-$month-$day $hour:00:00"
      git add commit.md -f
      git commit --date="$year-$month-$day 0$hour:00:00" -m "$hour on $month $day $year"
    done
    cd ../
  done
  cd ../
done
git push origin master
git rm -rf 0*
git rm -rf 1*
git commit -am "cleanup"
git push origin master
