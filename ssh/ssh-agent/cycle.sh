eval "$(ssh-agent -s)" > /dev/null

for key in ~/.ssh/*; do
    [ -f "$key" ] || continue
    ssh-add "$key" 2>/dev/null
done
