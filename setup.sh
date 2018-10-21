cp ~/.pandoc/filters/*.lua .
# remove debugging modules
for i in *.lua; do
    sed -i '/require(/d' $i
done
