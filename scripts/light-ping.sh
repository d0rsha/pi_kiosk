while ! timeout 0.2 ping -c 1 -n google.com &> /dev/null; do
    sleep 0.2
done