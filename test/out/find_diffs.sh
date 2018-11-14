for i in out*; do
    diff --strip-trailing-cr -u "exp.${i#out.}" "$i"
done
echo "Diffs computed."
