for M in {01..12}
  do
    mkdir $M
    cd $M
    for D in {01..31}
    do
      mkdir $D
      cd $D
      number=$((RANDOM % 12))
	for ((i=1; i <= number; i++)); do
        echo "$i on $M/$D/2018" > commit.md
        export GIT_COMMITTER_DATE="2018-$M-$D 12:$i:00"
        export GIT_AUTHOR_DATE="2018-$M-$D 12:$i:00"
        git add commit.md -f
        git commit --date="2018-$M-$D 12:0$i:00" -m "$i on $M $D 2018"
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
