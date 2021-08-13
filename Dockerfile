FROM archlinux:latest
RUN pacman -Syu wget --needed --noconfirm --overwrite '*' 
COPY gendb.sh /gendb.sh
ENTRYPOINT ["/gendb.sh"]
